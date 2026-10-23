"""Fixed EP01 rough cut. Decode actual AVI frames; do not modify the source media."""
import argparse
import hashlib
import io
import json
import math
import mmap
import struct
from pathlib import Path

import numpy as np
from PIL import Image, ImageDraw, ImageFilter, ImageFont, ImageOps

FPS, WIDTH, HEIGHT = 30, 1080, 1920
TIMELINE = [
    (0, 1.2, "E", 2.5, 1, "fit", "My first playtester\nexposed a problem.", "A better game started here."),
    (1.2, 4.5, "A", .2, 1, "action", "My first playtester\nexposed a problem.", "The first two runs reached\nwave 7. Then wave 12."),
    (4.5, 8.5, "B", .3, 1, "action", "The combat worked.", "Spells. Loot. Build experiments."),
    (8.5, 10.5, "B", 4.6, 1, "cards", "So did the builds.", "Choices that changed each run."),
    (10.5, 15, "C", .2, 1, "action", "But why\nkeep playing?", "The feedback: no convincing\nlong-term goal."),
    (15, 23, "D", 0, .75, "fit", "So I gave every run\na purpose.", "Not just a stronger character.\nA world worth coming back to."),
    (23, 29, "E", 1.8, 2 / 3, "fit", "Bring a dead world\nback to life.", "Grow. Restore.\nLeave something better behind."),
    (29, 32, "E", 6.2, 1, "fit", "One region healed.\nAnother waiting.", "Permanent progress.\nA bigger journey."),
    (32, 38, "F", 0, 1, "fit", "Every run makes\nyou stronger.", "LOOTFALL / EARLY PROTOTYPE"),
]


class Source:
    def __init__(self, path):
        self.path = path
        self.file = path.open("rb")
        self.data = mmap.mmap(self.file.fileno(), 0, access=mmap.ACCESS_READ)
        self.frames, audio = [], []
        self.header_fields = {}
        self.movi = self.data.find(b"movi")
        assert self.data[:4] == b"RIFF" and self.movi > 0

        def walk(start, end):
            at = start
            stream = None
            while at + 8 <= end:
                tag = self.data[at:at + 4]
                size = struct.unpack_from("<I", self.data, at + 4)[0]
                left, right = at + 8, min(at + 8 + size, end)
                if tag == b"LIST":
                    walk(left + 4, right)
                elif tag == b"avih":
                    self.header_fields["avih"] = left
                elif tag == b"strh":
                    stream = self.data[left:left + 4]
                    self.header_fields[stream.decode()] = left
                elif tag == b"strf" and stream == b"vids":
                    self.header_fields["bitmap"] = left
                elif tag in (b"00db", b"00dc"):
                    self.frames.append((left, right))
                elif tag == b"01wb":
                    audio.append(self.data[left:right])
                at = left + size + size % 2

        walk(12, len(self.data))
        header = self.header_fields
        assert struct.unpack_from("<II", self.data, header["avih"] + 32) == (1920, 1080)
        assert self.data[header["vids"]:header["vids"] + 8] == b"vidsMJPG"
        self.audio = np.frombuffer(b"".join(audio), dtype="<i2").reshape(-1, 2).copy()
        assert self.frames and len(self.audio) > 48000

    def image(self, seconds):
        # Match the existing MP4s: their one Movie Maker initialization frame was removed.
        index = min(len(self.frames) - 1, 1 + int(seconds * FPS))
        left, right = self.frames[index]
        return Image.open(io.BytesIO(self.data[left:right])).convert("RGB")


class Writer:
    def __init__(self, path, template, count):
        if path.exists():
            raise FileExistsError(path)
        self.out = path.open("w+b")
        self.header = bytearray(template.data[:template.movi + 4])
        h = template.header_fields
        struct.pack_into("<I", self.header, h["avih"] + 16, count)
        struct.pack_into("<II", self.header, h["avih"] + 32, WIDTH, HEIGHT)
        struct.pack_into("<I", self.header, h["vids"] + 32, count)
        # Godot's 48-byte stream header omits rcFrame; the next bytes belong to strf.
        struct.pack_into("<I", self.header, h["auds"] + 32, count * 1600)
        struct.pack_into("<ii", self.header, h["bitmap"] + 4, WIDTH, HEIGHT)
        struct.pack_into("<I", self.header, h["bitmap"] + 20, WIDTH * HEIGHT * 3)
        self.out.write(self.header)
        self.movi, self.index = template.movi, []

    def chunk(self, tag, payload):
        offset = self.out.tell() - self.movi
        self.out.write(tag + struct.pack("<I", len(payload)) + payload)
        if len(payload) % 2:
            self.out.write(b"\0")
        self.index.append(struct.pack("<4sIII", tag, 16, offset, len(payload)))

    def frame(self, image, audio):
        encoded = io.BytesIO()
        image.save(encoded, format="JPEG", quality=90, subsampling=2)
        self.chunk(b"00db", encoded.getvalue())
        self.chunk(b"01wb", audio)

    def close(self):
        end = self.out.tell()
        index = b"".join(self.index)
        self.out.write(b"idx1" + struct.pack("<I", len(index)) + index)
        size = self.out.tell()
        assert size < 2 ** 31, "Classic AVI limit; split longer edits before extending this fixed cut"
        self.out.seek(4)
        self.out.write(struct.pack("<I", size - 8))
        self.out.seek(self.movi - 4)
        self.out.write(struct.pack("<I", end - self.movi))
        self.out.close()


def font(size, bold=False):
    return ImageFont.truetype("C:/Windows/Fonts/segoeui" + ("b" if bold else "") + ".ttf", size)


def segment_at(t):
    return next(s for s in TIMELINE if s[0] <= t < s[1])


def render(t, sources):
    start, end, key, source_start, speed, mode, title, subtitle = segment_at(t)
    seconds = source_start + (t - start) * speed
    source = sources[key].image(seconds)
    accent = "#a5e0ba" if key in "DEF" else ("#f1a09b" if key == "C" else "#efc995")
    if mode == "action":
        center = 960 + math.sin(seconds * 1.1) * 88
        half = 1080 * WIDTH / HEIGHT / 2
        image = source.crop((int(center - half), 0, int(center + half), 1080)).resize((WIDTH, HEIGHT), Image.Resampling.LANCZOS)
    else:
        image = ImageOps.fit(source, (270, 480)).filter(ImageFilter.GaussianBlur(13)).resize((WIDTH, HEIGHT))
        image = Image.blend(image, Image.new("RGB", image.size, "#0c1720"), .72)
        if mode == "cards":
            source = source.crop((260, 300, 1660, 820))
        foreground = ImageOps.contain(source, (1000, 690), Image.Resampling.LANCZOS)
        x, y = (WIDTH - foreground.width) // 2, 1000 - foreground.height // 2
        draw = ImageDraw.Draw(image)
        draw.rounded_rectangle((x - 4, y - 4, x + foreground.width + 4, y + foreground.height + 4), radius=9, fill="#a1b9aa")
        image.paste(foreground, (x, y))
    overlay = Image.new("RGBA", (WIDTH, HEIGHT))
    draw = ImageDraw.Draw(overlay)
    for y in range(HEIGHT):
        alpha = max(0, .94 * (1 - y / 670), .96 * (y - 1250) / 670)
        draw.line((0, y, WIDTH, y), fill=(7, 15, 23, int(min(.97, alpha) * 255)))
    if 18 <= t < 23:
        title = "World\nRestoration."
        subtitle = "Every run leaves the world\nbetter than you found it."
    if t >= 35:
        title = "Every run brings\nthe world back to life."
        subtitle = "WOULD YOU PLAY THIS?"
    draw.text((78, 113), "L O O T F A L L  /  DEVLOG 01", font=font(29, True), fill="#e9d0aa")
    chapter = 0 if t < 4.5 else 1 if t < 10.5 else 2 if t < 15 else 3 if t < 23 else 4 if t < 32 else 5
    for index in range(6):
        left = 78 + index * 156
        draw.rounded_rectangle((left, 176, left + 140, 181), radius=2, fill=accent if index <= chapter else "#40505a")
    size = 79
    while max(draw.textlength(line, font=font(size, True)) for line in title.splitlines()) > 928:
        size -= 1
    draw.multiline_text((76, 255), title, font=font(size, True), fill="#f6efe2", spacing=16)
    draw.rectangle((78, 1480, 154, 1485), fill=accent)
    draw.multiline_text((78, 1525), subtitle, font=font(42, t >= 35), fill=accent, spacing=12)
    disclosure = "Historical build / recreated footage" if key in "AB" else "Controlled preview / accelerated restoration" if key in "DE" else "Current prototype / controlled footage"
    draw.text((78, 1730), disclosure, font=font(26), fill="#a9b8bd")
    draw.text((78, 1830), "DRAFT 01  /  ORIGINAL GAME AUDIO  /  NO VOICEOVER", font=font(21), fill="#80939b")
    image = Image.alpha_composite(image.convert("RGBA"), overlay).convert("RGB")
    if t < .13:
        image = Image.blend(Image.new("RGB", image.size, "#071019"), image, t / .13)
    if t > 37.65:
        image = Image.blend(image, Image.new("RGB", image.size, "#071019"), (t - 37.65) / .35)
    return image


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("episode", type=Path)
    parser.add_argument("output", type=Path)
    parser.add_argument("--previews-only", action="store_true")
    args = parser.parse_args()
    args.output.mkdir(parents=True, exist_ok=True)
    manifest = json.loads((args.episode / "manifests/EP01_MANIFEST.json").read_text(encoding="utf-8"))
    sources = {c["shot"]: Source(Path(c["raw_master"])) for c in manifest["clips"]}
    for time in [.5, 2.5, 6, 9.5, 13, 18.5, 24.5, 30.5, 36]:
        render(time, sources).save(args.output / ("preview_%05.1f.jpg" % time), quality=91)
    if args.previews_only:
        return
    count = 38 * FPS
    audio = np.zeros((38 * 48000, 2), dtype=np.float64)
    for start, end, key, offset, speed, *_ in TIMELINE:
        first, last = round(start * 48000), round(end * 48000)
        positions = (offset + 1 / FPS + np.arange(last - first) / 48000 * speed) * 48000
        source = sources[key].audio.astype(np.float64)
        for channel in range(2):
            audio[first:last, channel] = np.interp(positions, np.arange(len(source)), source[:, channel])
        fade = min(2400, (last - first) // 2)
        audio[first:first + fade] *= np.linspace(0, 1, fade)[:, None]
        audio[last - fade:last] *= np.linspace(1, 0, fade)[:, None]
    audio = np.clip(audio * 3, -32767, 32767).astype("<i2")
    writer = Writer(args.output / "Lootfall_EP01_Draft01_1080x1920_master.avi", sources["F"], count)
    for index in range(count):
        t = index / FPS
        image = render(t, sources)
        segment = segment_at(t)
        local = t - segment[0]
        if local < .1 and segment[0] > 0:
            previous = render(max(0, segment[0] - .1 + local), sources)
            image = Image.blend(previous, image, local / .1)
        writer.frame(image, audio[index * 1600:(index + 1) * 1600].tobytes())
        if index % 120 == 0:
            print("Rendered %.0f / 38 seconds" % t, flush=True)
    writer.close()
    metadata = {"duration": 38, "fps": FPS, "size": [WIDTH, HEIGHT], "timeline": TIMELINE, "voiceover": False, "music": False, "audio": "Original source PCM, 3x gain, cut fades; slow sections also slow the game sound", "audio_peak": int(np.abs(audio.astype(np.int32)).max()) / 32768, "source_files": {k: str(v.path) for k, v in sources.items()}, "renderer_sha256": hashlib.sha256(Path(__file__).read_bytes()).hexdigest()}
    (args.output / "EDIT_DECISIONS.json").write_text(json.dumps(metadata, indent=2), encoding="utf-8")
    print("Rendered 1140 actual video frames; 38 seconds; original media unchanged.", flush=True)


if __name__ == "__main__":
    main()
