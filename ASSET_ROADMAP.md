# Lootfall 2.0 — Asset Roadmap & Godot Integration
**Basis:** [ART_DIRECTION.md](ART_DIRECTION.md) — Style C „Bold Graphic Anime Dark Fantasy“  
**Stand:** 19.10.2026 · **Status:** Umsetzungsplan mit kleinen Freigabe-Gates, **noch kein Implementierungsauftrag**.  
**Umgebung:** Godot 4.7 / GDScript · 2D-Top-down · aktives Spielrepo `karlospeter464-hub/lootfall-2.0`.

## 1. Grundentscheidung: Art-Replacement statt Game-Rewrite

Heute entstehen Player, Chaser, Seer, Guardian und Projektile weitgehend durch `_draw()` in bestehenden Godot-Skripten (`scripts/player.gd`, `scripts/enemy.gd`, `scripts/ranged_enemy.gd`, `scripts/guardian_enemy.gd`, `scripts/projectile.gd`). Die Arena läuft in `scenes/arena.tscn` mit `scripts/arena.gd`; UI ist unter anderem in `scripts/town_panel.gd` und `scripts/inventory_panel.gd` implementiert.

**Strategie:** Darstellung separat austauschen, Logik/Hitboxen/Skills/Run-Ökonomie bewahren. Der erste Test verwendet die existierende Kamera, Arena-Grenzen, Wellen und Spawns. Danach in kleinen Paketen ausbauen.

### Was das Style-C-Konzeptbild leisten kann und was nicht
| Konzeptboard liefert | Spiel benötigt zusätzlich |
|---|---|
| Proportionen, Formen, Strichführung, Stimmung | einzelne freigestellte Sprites in gleicher Perspektive |
| schönes Anime-Heldenporträt | kleiner 3/4-Top-down-Spiel-Sprite, Pivot und Richtungsvarianten |
| große illustrativ gerenderte Ruine | schichtbarer Boden/Props mit kontrollierter Kollision und Z-Ordnung |
| VFX-Idee | reproduzierbare Frames/kurze Animation im Spielmaßstab |
| UI-Atmosphäre | tatsächlich lesbare, klickbare Godot-Controls |

**Wichtig:** Das Bild mit „Style Brief C“ ist eine Konzeptreferenz, keine Sprite-Atlas-Datei; nicht einfach Teile automatisch ausschneiden und als finale Assets deklarieren.

## 2. Pipeline vom Entwurf bis ins Spiel

1. **Asset-Brief:** Rolle, Größe im Spiel, Perspektive (Top-down/leicht erhöht), Silhouette, Farbsemantik, Animation/Interaktion und Dateiformat festlegen.
2. **Konzept / Varianten:** wenige Varianten pro Asset entwickeln (KI-unterstützt oder gezeichnet). Zunächst an Formensprache des Style C ausrichten, nicht an identischem Gesicht/Kostüm.
3. **Asset-Produktion:** eine freigestellte Figur/Prop in konsistenter 3/4-Perspektive herstellen; Freistellung, Kontur, Hände/Füße, transparente Ränder und Richtungen prüfen. Bei Bedarf manuell korrigieren oder kontrolliert neu zeichnen; KI-Konzeptbilder sind oft über Frames hinweg inkonsistent.
4. **Runtime-Dateien:** RGBA-PNG für Figuren/VFX oder WebP für geeignete statische Art; konsistente Pivots; mehrere Framebilder in einheitlicher Größe, falls animiert. SVG für geeignete Vektor-Icons, nicht für alles.
5. **Godot:** Bild importieren, als `Sprite2D` oder `AnimatedSprite2D` an bestehende Actor-Szenen hängen; bei Bedarf `AnimationPlayer` für einfache Zustände verwenden. Bestehende `_draw()`-Visuals nur für den jeweiligen ersetzten Körper ausblenden, nicht ungewollt Warnkreise oder Hit-Feedback.
6. **Vergleich:** dieselbe Testszene und möglichst gleicher Seed mit altem/neuem Look aufnehmen; Lesbarkeit und Performance im tatsächlichen Kampf prüfen.
7. **Freigabe:** Creative Director prüft und entscheidet, bevor weitere Assetfamilien oder Biome folgen.

**Niemals:** neue Hitboxen nur wegen Spriteumrissen anpassen, Gameplaywerte still verändern, einen isometrischen Kameraschwenk durch Assetproduktion erzwingen oder eine komplette Asset-Pipeline als Voraussetzung für einen ersten Test bauen.

## 3. Verzeichnisvorschlag im Spielrepo

Nur nach technischem Abgleich mit dem bestehenden Repository anlegen:

```text
assets/
  art/
    characters/
      apprentice/
      chaser/
      seer/
      guardian/
    bosses/
    vfx/
      projectiles/
      impacts/
      telegraphs/
    arenas/
      ashen_courtyard/
        floor/
        props/
    ui/
      cards/
      items/
      talents/
  source/                    # optional: editierbare Originale, Lizenz-/Asset-Notizen
```

Dateinamen auf Englisch, stabil und eindeutig, z. B. `apprentice_idle_down.png`, `chaser_idle.png`, `ember_burst_frame_01.png`, `ash_courtyard_floor_tile.png`. Datenherkunft/Lizenz mitführen. `.godot/`, temporäre Generierungen und persönliche Pfade nicht committen.

## 4. Priorisierte Roadmap und Freigabestufen

### A0 — Style-Referenz & technische Vorprüfung (noch kein Artwork-Tausch)
**Artefakte:** diese beiden Design-Dokumente, referenziertes Style-C-Board, Screenshot vom aktuellen Kampf, eine kurze Bestandsaufnahme betroffener Godot-Szenen/Skripte.  
**Codex prüft:** wo `_draw` Körper/VFX/Telegraphen vermischt; verfügbare Godot-Knoten; Auflösung und Import; bestehende Test-/Screenshotmöglichkeiten; Repo-Status.  
**Gate:** Creative Director bestätigt **einen** engen Umsetzungsversuch. Fehlendes Style-C-Bild im Repo offen melden, nicht so tun, als sei es vorhanden.

### A1 — Minimaler Art-Vertical-Slice (höchste Priorität)
**Asset-Liste (genau klein halten):**
- 1 Gameplay-Sprite **Apprentice** (Idle/Grundhaltung; vorerst ein Blickwinkel oder zwei Varianten).
- 1 **Chaser**-Gameplay-Sprite als Gegnervergleich.
- 1 **Ember-Fireball** und 1 **Impact/Burst** als leichte visuelle Effekte.
- 1 ruhiger **Boden-Skin / Tile-Set-Test** plus maximal 2 dekorative Rand-Props.

**Godot-Arbeit:** bestehende Player-/Enemy-/Projectile-Logik unangetastet weiterverwenden, Renderkomponenten kapseln; Kamera, Spawngeometrie und Kollisionsregeln erhalten. Debug/Editor-Vergleich alter vs. neuer Visuals nur falls klein und hilfreich.  
**Gate:** Aufgenommenes Gameplay (nicht nur Konzeptbild!) zeigt klare Figuren, lesbare Treffer und unveränderte Bedienbarkeit in echter Wellenbelastung. **Erst dann** weitere Artworkserien.

### A2 — Gegner-/Boss-Silhouetten und Telegraphs
- Gameplay-Sprites für **Cinder Seer** und **Rune Guardian**, Bossvarianten **Rune Champion** und **Ash Prophet** (visuelle Unterscheidung vor Spezialanimationen).
- Bestehende Warnfläche des Seers und Warnstreifen des Champion im neuen VFX-Stil.
- Trefferblitz/Rüstungsabsorption, Boss-HP-Balken, erkennbare Boss-Einführung.
- **Gate:** Rollen auch ohne UI-Namen unterscheidbar; Warnung bei Overcharge, Fire Fan und Storm sichtbar.

### A3 — Kernanimationen, Loot- und Build-Feedback
- Apprentice: sparsame Idle-, Lauf-, Cast- und Hurt-Reaktionen; zunächst nur die minimal notwendigen Richtungen.
- Gegner: einfache Bewegungs-/Hit-Feedback-Varianten, kein vollständiges 8-Richtungen-Set vor Test.
- Overcharge-Aufladung, Piercing-Durchstoß, Ember Burst, Echo-Nachschuss, Storm-Blitz, Phoenix-Heilung.
- Loot-Pickups: einheitliche Silhouette/Umriss mit Farbe **und** Rarity-Text. Keine Änderung von Itemchancen.
- **Gate:** In schnellem Mixed Build bleiben Spielfigur, direkte Treffer und Gefahr visuell trennbar.

### A4 — UI-Polish für Karten, Inventar, Skilltree und Emberhaven
- Ein kleines Icon-Set für zunächst die **sechs bestehenden Karten** und **acht bestehenden Items**; vorhandene Mechaniken unverändert.
- Gemeinsame Rahmen-/Icon-Sprache, aktive und inaktive Zustände, sichtbare Tooltips und Focusstates.
- Skilltree-Power/Vitality/Flow mit gleicher grafischer Formensprache und unmissverständlichem gekauft/erreichbar/gesperrt.
- UI in realer Spielauflösung und beim Öffnen aus allen erlaubten Zuständen prüfen.
- **Gate:** keine verlorenen Informationen, abgeschnittenen Zahlen oder unbedienbaren Controls; klarer Text schlägt Dekoration.

### A5 — Zusätzliche Arena-Skins (später, bewusst nicht A1)
Mögliche Art-Sets: **Ashen Courtyard** (offen), **Ember Chapel** (sakral) und **Arcane Archive** (magisch). Die Namen sind **Mood-Hypothesen**. Zunächst **nur visuelle Skinwechsel**, keine Map-Mechaniken, Kollision-/Spawnänderungen oder neue Encounterlogik. Falls später Räumlichkeit gewünscht: als **separate Designfreigabe** mit Test gegen die 15–20-Minuten-/Build-Discovery-Ziele.

## 5. Asset-Spezifikation für den ersten Versuch

| Asset | Minimale Lieferung | Integration / Prüfpunkt |
|---|---|---|
| Apprentice | 1 RGBA-Sprite in vereinbartem 3/4-Top-down-Winkel, konsistenter Pivot/Bodenkontakt; ggf. 2 Zustände | `scenes/player.tscn` + `Sprite2D`; Aim, Bewegung, Projektilursprung nicht verändern |
| Chaser | 1 eigenständige, schlanke Silhouette mit Bodenanker | Spawn-/Hit-Flashes, Enemy-Hitbox beibehalten |
| Fireball | 1 Sprite oder kurze einfache Framefolge | `scripts/projectile.gd`, Pivot/Drehung entlang Flugrichtung; Kollisions-Ray unverändert |
| Impact/Burst | 2–5 kurzlebige grafische Frames oder Godot-Draw-Formen | Event → VFX, Schaden unabhängig von Effektanzeigen-Limit |
| Arena-Boden | kleines wiederholbares Floor-Set oder ein neutraler Boden-Skin | keine neuen Hindernisse; Spieler-/Projektilkontrast messen |
| Rand-Props | 1–2 unabhängig platzierbare dekorative Sprites | keine Kollision, keine Abdeckung wichtiger Telegraphs |

**Produktionstoleranz:** Erst am tatsächlichen Spielmaßstab entscheiden, ob Sprites 64/96/128 Pixel Arbeitszellen oder andere Maße benötigen. Einheitliche Konturstärken nach Skalierung testen. Texturfilter für diesen nicht-pixeligen Stil primär **linear**, Import-/Mipmapping-Optionen im Kontext prüfen. Transparentes Padding und Anchor-Punkte sauber halten.

## 6. Technische Godot-Hinweise für Codex

- Vorhandenes `_draw()` in `scripts/player.gd`, `scripts/enemy.gd` und Unterklassen vorsichtig abgrenzen. Die Guardian-/Seer-Draw-Methoden rufen `super._draw()` auf; ein pauschales Abschalten könnte Gesundheitsleisten oder Telegraphen verbergen.
- Visuelles Node als Kind vorhandener `CharacterBody2D`-/Projectile-Nodes einführen; `CollisionShape2D`, Bewegung, Hit-Signale und direkte Treffer-/Piercing-/Overcharge-Zählung unverändert lassen.
- Actor-Facing nach Aim/Richtung zunächst einfach lösen; wenn bloßes Drehen menschenförmige Sprites grotesk verdreht, Richtungsvarianten oder begrenzte Sprite-Orientierung statt endloser Körperrotation.
- 2D-Böden/Props als eigene Renderlayer unter und über Gameplay mit bewusster `z_index`-Ordnung. `TileMapLayer` erst einsetzen, wenn tilebare Fläche tatsächlich genutzt wird; für A1 genügt nötigenfalls ein einfacher Boden-Sprite.
- VFX am bestehenden Damage-/Spawn-Ereignis einhängen, visuelle Effektbudgets respektieren und Warnungs-/Bossmechaniken nicht hinter Show-Effekten verstecken.
- Bei UI-Skins nicht die tatsächlichen Button- und Textzustände durch dekorative Bilder ersetzen.
- Native Godot-Testszene und Headless-Regressionen beibehalten; ein erfolgreicher Script-Check ist **kein** Beleg für stimmige Grafik oder Laufzeit-Performance.

## 7. Aufwandstreiber und Risiken

| Risiko | Frühe Gegenmaßnahme |
|---|---|
| Schöne Porträts sehen im Top-down-Kampf falsch aus | Gameplay-Sprite separat entwickeln und in A1 sofort testen |
| KI-Frames wechseln Aussehen/Kleidung unkontrolliert | Ein Master-Designblatt, feste Perspektive, manuelle Korrektur; nicht blind eine Animation als KI-Serie generieren |
| Hintergrund verschluckt Gegner oder Warnfelder | ruhiger Boden, Kontrasttest mit echtem Wellenkampf |
| Asset-Replacement ändert Kollisionsgefühl | Hitbox/Bewegung von Artwork trennen; Regressionen |
| Große VFX/Atlas-Dateien beeinträchtigen Performance | kleine Framefolgen, bestehende Caps, echte Lastszenarien |
| Mehrere Maplayouts dehnen die Entwicklungszeit aus | A1 nur 1 Boden-Skin, A5 bewusst später |
| Spielstil drifts durch Assets verschiedener Herkunft | Art Bible, einheitliche Linien-/Shading-Regeln, Creative-Director-Gate |
| Fremdes Referenzspiel zu genau kopiert | eigenständige Formen; keine wiederverwendeten Ravenswatch-Assets, Figuren, Logos oder markanten UI-Kompositionen |

## 8. Mini-Brief für den ersten technischen Auftrag (erst nach Freigabe verwenden)

**Ziel:** In Lootfall Style C anhand eines einzigen Spielausschnitts prüfen. **Umfang:** ein Apprentice-Gameplay-Sprite, ein Chaser-Sprite, ein Fireball-/Impact-Look, ein ruhiger Boden-Skin; keine neuen mechanischen Features. **Vorbereitung:** Dokumentationsrepo sauber mit Git aktualisieren und `ART_DIRECTION.md` + diese Roadmap lesen; lokalen Spielstand prüfen. **Umsetzung:** vorhandene Sprites/Draw-Renderpfade minimal adaptieren, alte Visuals als Fallback behalten; Kollisionsformen, KI, Karten, Items, Echoes und Run-Dauer nicht verändern. **Tests:** bestehende Automated Tests + native Gameplay-Aufnahme mit Vergleich und Warnungslesbarkeit; Ergebnisse und offene Probleme melden. **Freigabe:** keine größere Assetserie/Map-Umbau vor Sichtung durch den Creative Director.

## 9. Checkliste für echte „fertige“ Art

Ein Asset gilt **nicht** als implementiert, wenn lediglich eine Illustration oder PNG-Datei vorliegt. Fertig ist es erst, wenn es freigestellt/importiert, an die richtige Godot-Szene angeschlossen, in echter Spielgröße getestet, im Lauf-/Trefferverhalten überprüft, visuell mit den anderen Assets konsistent, ohne Rechteprobleme nutzbar und vom Creative Director abgenommen ist.

**Abnahmesignal der Phase A1:** „Das Spiel sieht schon in einer einzigen normalen Begegnung sichtbar nach Lootfall Style C aus, und der Kampf spielt sich exakt so zuverlässig wie vorher.“

## 10. Nachgewiesener Teilfortschritt – Art Vertical Slice 01

19.10.2026: Nutzer beauftragt ausdrücklich **nur einen Apprentice**, enger als das oben beschriebene volle A1-Paket. Sein PNG wurde bytegleich erhalten, als Sprite2D in die bestehende Player-Szene importiert und in nativer Godot-Ausgabe geprüft. Spielerlogik/Hitbox/Projektilursprung unverändert; ursprüngliche Draw-Figur per Inspector als Fallback. Mipmaps, Fußpivot, sanfte Atmung und kurze vorhandenen Zuständen folgende Rückmeldungen. 917 Checks ohne Fehler; vier echte Engine-Vorschauen, darunter ein bewegter Ablauf mit zwei direkten Treffern. Unterschiedliche Perspektive und Detailverlust bleiben dokumentierte Prototypgrenzen.

**A1 bleibt nur teilweise umgesetzt:** kein neuer Chaser, kein neuer Fireball/Impact-Look, kein Boden-Skin oder Rand-Prop. Keine weitere Assetserie aus diesem Einzelergebnis ableiten. Manuelle Stil-/Perspektivabnahme durch den Creative Director und finales Gameplay-Sprite noch offen. Alter Windows-v0.1-Export bleibt unverändert; dieser Schritt betrifft das lokale Godot-Projekt. Spiel lokal 5691976, kein Push.