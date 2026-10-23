# Lootfall – Video-Produktion

Rohmaterial für englische Devlogs; Berichte Deutsch. Skript, Voiceover und Schnitt bleiben in CapCut. Keine automatische Veröffentlichung und kein automatischer Videoeditor.

## Ablauf pro Entwicklungsschritt

1. **Vorher sichern:** Beide Repositories mit `git status --short` prüfen, aktuelle Aufgabe/Devlog lesen. Vorherigen Spiel-Commit notieren, bei Bedarf gezielt lokal checkpointen. Parallel laufende Änderungen weder stagen noch überschreiben.
2. **Vorher aufnehmen:** Einen Git-Archiv-Snapshot des passenden Commits außerhalb der Repositories anlegen. Reproduzierbare Szene mit identischem Seed, Bildausschnitt und echten Spielsystemen aufnehmen. Historischer Commit ist eine Rekonstruktion, kein zeitgenössisch aufgezeichneter Playthrough.
3. **Entwickeln und prüfen:** Freigegebenes Feature im aktiven Projekt implementieren/testen. Video-Auftrag allein erlaubt keine Gameplay-/Balanceänderung.
4. **Nachher aufnehmen:** Neuen geprüften Commit separat archivieren; möglichst dieselbe Vergleichsszene aufnehmen. World-/Wave-Testwerte und vorbereitete Builds offen protokollieren.
5. **Eindeutig archivieren:** Episode/Take, Datum, vollständiger Git-Hash, Spielversion, Capture-Controller-Hash, Engineversion, Seed, Testwerte, Codec/Abmessungen/FPS/Dauer und SHA256 der Dateien im Manifest ablegen. Große Videos und Quellkopien außerhalb Git halten. Fehlversuche in technical_probes erhalten und aus dem Importordner entfernen.
6. **Prüfen und erzählen:** Dateien dekodieren/abspielen, Anfang/Mitte/Ende ansehen, wichtige Effekte prüfen und Vorher/Nachher vergleichen. Aufschlussreichen Schritt im Devlog notieren, kleine Standbilder/Galerielinks committen. Kein Tester-Originalmaterial behaupten, wenn nur B-Roll existiert.

## EP01 reproduzieren

Werkzeuge unter `Video_Production/tools/` in dieser Chronik. Lokale Episode:

`C:/Users/elias/Lootfall 2.0/Video_Production/EP01/`

`capcut_import/` enthält ausschließlich die sechs finalen MP4s; `historical/` und `current/` native AVI-Master, `previews/` Standbilder, `manifests/` Provenienz/Prüfungen, `source_snapshots/` die unveränderten Git-ZIPs und Aufnahme-Kopien. Große Dateien liegen außerhalb beider Repositories. Die Chronik übernimmt nur kleine ausgewählte Vorschauen und Dokumentation.

In PowerShell einen **neuen leeren Ausgabeordner** benutzen:

```powershell
& 'C:/Users/elias/OneDrive/Dokumente/ChatGPT/Lootfall 2.0/Video_Production/tools/record_episode.ps1' `
  -GameRepo 'C:/Users/elias/Lootfall 2.0/lootfall-2.0' `
  -Godot 'C:/Users/elias/Downloads/Godot_v4.7.2-stable_win64.exe/Godot_v4.7.2-stable_win64_console.exe' `
  -OutputRoot 'C:/Users/elias/Lootfall 2.0/Video_Production/EP01_TakeNext' `
  -HistoricalRef e720b49 -CurrentRef 014793a
```

Mit `-Shots D` lässt sich gezielt nur die Heilungsszene aufnehmen. Dieser komplette Ein-Szenen-Workflow wurde zusätzlich von Quellarchiv bis MP4-Wiedergabe erfolgreich ausgeführt.

Das Skript überschreibt keine alten Takes. Es archiviert beide angegebenen Commits, ergänzt nur den Capture-Controller und zwei Fenstergrößen in den **Kopien**, importiert sie mit eigenem APPDATA unter `.godot/` und startet Godot Movie Maker: `--write-movie …avi --fixed-fps 30`. Keine produktiven Saves oder Gameplay-Dateien werden verändert. Snapshot-ZIPs bleiben exakt die Git-Inhalte. Nur committed Source wird rekonstruiert; uncommittete parallele Arbeit bleibt unangetastet.

Die Godot-Szene braucht `-- --test-mode --shot=A..F --seconds=… --commit=… --output-prefix=…`. Ohne isolierten Start verweigert sie die Aufnahme. Eine Vorschau/Screenshots entstehen beim normalen Movie-Lauf; für einen reinen Screenshot dieselbe Szene ohne `--write-movie`, aber mit `--fixed-fps 30` und den normalen Szenen-/Laufzeitparametern starten. Captures schließen regulär mit `quit()`, damit AVI-Index und Ton korrekt finalisiert werden. [Godot Movie Maker: offizielle Anleitung](https://docs.godotengine.org/en/stable/tutorials/animation/creating_movies.html).

**Bildformat:** 1920×1080/30 FPS, vollständiges ursprüngliches 16:10-Spielbild ohne Streckung in 16:9 eingepasst. Wichtig: Auch die Snapshot-Fenstergröße auf 1920×1080 setzen; CLI allein reichte nicht. Der Controller passt Welt und CanvasLayers rein visuell ein. Die Viewport-Textur muss ebenfalls 1920×1080 sein, sonst kann Movie Maker oben/unten abschneiden. Roh-AVI und dekodierte MP4 mit Standbildern vergleichen.

**Ton/MP4:** Wenn `ffmpeg` im PATH vorhanden ist, H.264/AAC mit CRF 18/yuv420p/30 FPS verwenden. Hier war keine FFmpeg-CLI vorhanden: Windows Media Foundation erzeugt H.264/AAC, 48 kHz Stereo mit dem eingebauten Encoder. Keine Installation nötig. `windows_video.ps1` läuft unter Windows PowerShell 5.1; der Runner setzt die Ausführungsrichtlinie nur für diesen Kindprozess, keine globale Einstellung. Innerhalb der Codex-Sandbox war für die WinRT-Dateischnittstelle eine lokale Rechtefreigabe nötig. Keine Sicherheitssoftware abschalten.

Der Encoder entfernt nur den initialen Movie-Maker-Frame. Danach vier MP4-Zeitpositionen nativ dekodieren und die stumme Wiedergabe bis auf höchstens 0,25 s vor Dateiende prüfen. Das belegt Decoder-/Wiedergabefunktion, keine menschliche Tonabnahme und keinen tatsächlichen CapCut-Import. A/B und der Hub F besitzen in diesen Szenen keinen Spielsound: stille AAC-Spur ist korrekt. C/D/E enthalten echten Pickup-/Heilungston; keine nachträglich erfundenen Kampfgeräusche.

## Ehrliche Inszenierung und vertikaler Schnitt

EP01 A/B: echter Commit e720b49 vor World Restoration, heute kontrolliert aufgenommen. C–F: Spielstand 014793a. Kein Clip stammt vom ersten Tester. D/E setzen Welle 12 und kumulative Vorab-Credits gezielt, um 0→52 % bzw. 48→100 % über den tatsächlichen Save-/Wave-Clear-/Tweenpfad in Sekunden zu zeigen. Das ist eine beschleunigte Testdarstellung, **nicht** die normale Heilungsrate einer einzelnen Welle. A/B/C nutzen inszenierte Spawnbudgets; alle Details im Episodenmanifest.

Spielfigur/Action liegen mittig, wichtige Karten und Regionsinformationen aber über die ganze Breite. Für 9:16 Kampf gezielt nachführen; Karten/Hub passend skalieren oder auf gestaltetem Hintergrund vollständig einpassen. Kein pauschaler Center-Crop und keine vorgetäuschte native Hochformat-UI. Keine 9:16-Datei ausliefern, die wichtige Inhalte verliert.

Nächster sinnvoller Ausbau: diesen bewährten Ablauf später als kleinen Codex-Skill zusammenfassen, erst nach Erfahrung mit dem ersten CapCut-Schnitt.
