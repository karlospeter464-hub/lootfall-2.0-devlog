# Entwicklungschronik & Medien

`index.html` direkt im Browser öffnen. Die Galerie funktioniert lokal ohne Server, JavaScript, Framework oder Internet. Nichts wird hochgeladen.

## Nach einem Entwicklungspaket

1. `DEVLOG.md` knapp ergänzen: Problem → Versuch/Änderung → Ergebnis → tatsächliche Tests → offene Frage. Auch aufschlussreiche Fehlversuche festhalten.
2. Bei sichtbaren Änderungen möglichst einen Vorher-/Nachher-Screenshot oder einen kurzen ausgewählten Gameplay-Clip ergänzen. Nur tatsächlich erzeugte Medien nennen; fehlende Aufnahmen offen lassen.
3. Neue Medien unter `captures/` ablegen, z. B. `2026-10-16_kampftest_v01.png`. Vorhandene Originale behalten. Datum, Build/Commit (falls vorhanden), Szene und Aussage des Materials im Devlog notieren.
4. Sichtbaren Meilenstein oben in `index.html` ergänzen und aktuellen Stand aktualisieren. Historie erhalten; Entwurf, implementiert, getestet und manuell abgenommen unterscheiden.
5. Masterplan Abschnitte 9/10 nur für den aktuellen Status und wesentliche Änderungen pflegen.

Der Nutzer hat Chronik, Screenshots und ausgewählte Clips gewählt. Eine durchgehende Bildschirmaufnahme ist nicht eingerichtet. Ein Textprotokoll ersetzt kein Video; wenn keine Aufnahme erzeugt wurde, existiert auch kein Clip.

## Übernommene Vorgeschichte

Quelle: `C:\Users\elias\lootfall\Progress`. HTML-Grundgestaltung aus `index.html` übernommen; Inhalte für 2.0 neu eingeordnet. Keine alten Gameplay- oder Testaussagen als neu bestätigt ausgegeben.

| Lokale Datei in `archive/` | Historische Einordnung |
| --- | --- |
| `dungeon_v03.png` | Dungeon-Vorschau, alter Galerieeintrag vom 14.10.2026 |
| `inventory_v01.png` | Inventar-Vorschau, alter Galerieeintrag vom 14.10.2026 |
| `rarity_stats_v01.png` | Werte-/Seltenheiten-Testbild, alter Galerieeintrag vom 15.10.2026 |
| `Recording 2026-10-14 115459.mp4` | Originalaufnahme; Zeit aus Dateiname, Inhalt nicht erneut gesichtet |
| `Recording 2026-10-14 172325.mp4` | Originalaufnahme; Zeit aus Dateiname, Inhalt nicht erneut gesichtet |

Alle fünf Medien wurden kopiert; Originaldateien bleiben im alten Projekt. Medienkopien sind damit unabhängig vom alten Ordner verfügbar. Die vollständige alte Galerie und frühere Entwicklungsprotokolle bleiben dort erhalten. Weitere Medien werden bei konkretem Bedarf übernommen.

## Später ein YouTube-Devlog schneiden

Aus jedem Meilenstein eine kurze Sequenz machen: Ausgangsproblem → Versuch → sichtbares Ergebnis → was daraus gelernt wurde. Die Entwicklung wird nicht automatisch gerendert, geschnitten oder veröffentlicht. Vor öffentlicher Verwendung ausgewählter Medien Quellen-/Nutzungsrechte und eventuell sichtbare persönliche Inhalte prüfen. Video-Wiedergabe und vollständige Sichtung sind keine Voraussetzung für das lokale Archiv.

## Neue P0-Vorschauen – 16.10.2026

`captures/2026-10-16_arena_v01.png`, `2026-10-16_upgrades_v01.png`, `2026-10-16_result_v01.png`: aus dem neuen Spiel unter `C:/Users/elias/Lootfall 2.0/lootfall-2.0` mit `tests/capture_preview.gd` erzeugt. Native D3D12-Engine-Ausgabe; reproduzierbare inszenierte Testaufbauten, kein menschlicher Playthrough und kein Video. Eigene prozedurale Platzhaltergrafik ohne externe Assets. Bei einer späteren Präsentation diese Bilder als Prototyp-/Testvorschau einordnen.

## Loot / Echoes / F1 – 16.10.2026

Neue Vorschauen unter `captures/`: `2026-10-16_codex_v01.png`, `2026-10-16_console_v01.png`, `2026-10-16_tuning_v01.png`, `2026-10-16_echoes_v01.png`. Herkunft: neues Godot-Projekt, `tests/capture_preview.gd -- --test-mode`, native D3D12-Ausgabe. Alle vier Bilder gesichtet. Inszenierte Testaufbauten; kein menschlicher Durchlauf, keine neuen Videos. Angezeigte Performancewerte stammen aus der kurzen Aufnahme und sind kein belastbarer Benchmark.

Unter `snapshots/` liegen ausgewählte Spielquellen (Scripts, Szenen, Tests, project.godot, Spiel-README), ohne .godot-Caches, echte Spielstände, Profile oder Git-Metadaten: `2026-10-16_p0_before_loot.zip` dokumentiert den Ausgangspunkt, `2026-10-16_loot_echoes_console.zip` das neue Paket. Das sind lokale Quellsicherungen für Vergleich und Devlog; die aktive Entwicklung bleibt im Godot-Projektordner. Keine Git-Commits oder Veröffentlichung dadurch erzeugt.

## Checkpoint vor INV1

`captures/2026-10-16_before_inventory.png`: echter Laufzeit-Screenshot (1152 × 720) über Godot MCP aus der aktuellen Hauptszene, aufgenommen vor dem Inventar-Umbau und visuell geprüft. Keine gestellte Capture-Szene und keine menschliche Gameplay-Aufnahme. Zugehöriger Spiel-Commit: `bc2877fd82fa738a3ba5d27905e7a3a2210c9fba`. In diesem Chronik-Commit zusammen mit den übrigen Medien lokal archiviert; keine Veröffentlichung.
