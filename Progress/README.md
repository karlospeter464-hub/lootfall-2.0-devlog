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

## INV1 – Fund verstehen, dann ausrüsten

`captures/2026-10-16_inventory_v01.png`, `2026-10-16_ground_item_inv1.png`, `2026-10-16_item_tuning_inv1.png`: neue native D3D12-Vorschauen aus `tests/capture_preview.gd -- --test-mode` mit den Ansichten `inventory`, `loot`, `tuning`. Alle drei Bilder gesichtet, 1152 × 720. Sie zeigen den Buchvergleich mit verlorenem Splash, den erklärten Bodenfund und die zusätzlichen Itemregler. Inszenierte Testaufbauten mit isolierten Spielständen, kein menschlicher Durchlauf und kein neuer Clip. Aktueller Spiel-Commit steht im zugehörigen INV1-Devlog-Eintrag; frühere Bilder zeigen historische Verhaltensstände, insbesondere die inzwischen ersetzte automatische Codex-Aktivierung.

## P2 – Emberhaven und Skilltree, 17.10.2026

Vier neue Bilder unter `captures/`: `2026-10-17_town_v01.png`, `2026-10-17_skilltree_v01.png`, `2026-10-17_tree_tuning_v01.png`, `2026-10-17_loot_name_only.png`. Native D3D12-Ausgabe aus `tests/capture_preview.gd -- --test-mode`, Ansichten `town`, `skilltree`, `tree_tuning`, `loot`, jeweils 1152 × 720, visuell geprüft. Stadt-/Baumansichten verwenden ausdrücklich inszenierte 500 Test-Echoes und vier Testkäufe, keine menschlich erspielte Progression. Sie zeigen die Querverbindung Power II → Vitality III und das Ziel Renewal. Kein neuer Clip; alle alten Medien bleiben erhalten. Zugehöriger Spiel-Commit im P2-Devlog-Eintrag.

## Begegnungen und Entsorgung, 18.10.2026

`captures/2026-10-18_encounter_v01.png` und `2026-10-18_destroy_v01.png`: native D3D12-Vorschauen mit `tests/capture_preview.gd -- --test-mode --view=encounter` beziehungsweise `--view=inventory`, 1152 × 720, gesichtet. Begegnung inszeniert zwei eingefrorene Seer-Warnkreise zur Darstellung der Mechanik; Inventar verwendet Testitems. Keine menschliche Gameplay-Aufnahme und kein Clip. Spiel-Commit `78dcaaf`. Seltenheitskaskade ist darin noch nicht implementiert.

## Seltenheitskaskade, 18.10.2026

Nachfolgender CE1-Meilenstein: `captures/2026-10-18_ce1_encounter.png` und `2026-10-18_ce1_tools.png`, erzeugt mit `tests/capture_preview.gd -- --test-mode --view=ce1` beziehungsweise `--view=ce1_tools`. Native D3D12-Ausgabe, 1152 × 720, beide gesichtet. Gestellte Welle 3 mit Guardian und eingefrorenem Seer-Warnkreis/drei Trefferpunkten sowie F1-Testauswahl; keine menschliche Gameplay-Aufnahme. Kein neuer Clip. Frühere Aufnahmen bleiben historisch unverändert.

`captures/2026-10-18_rarity_inventory.png`, `2026-10-18_rarity_ground.png`, `2026-10-18_rarity_metrics.png`: native D3D12-Vorschauen aus `tests/capture_preview.gd -- --test-mode` mit `inventory`, `rarity_loot`, `rarity_metrics`, 1152 × 720, gesichtet. Alle vier Items/ausgerüsteten Gegenstände sind gestellte Testfunde, kein Nachweis menschlich erspielter Legendary-Drops. Die Konsole zeigt berechnete bedingte Anteile und Chancen pro Kill; kurze Start-FPS nicht als Benchmark verwenden. Spiel-Commit `5caea96`. Kein neuer Clip, Vorversionen erhalten.

## CE1 nach Spieltest, 18.10.2026

`captures/2026-10-18_ce1_feedback.png`: native D3D12-Vorschau aus `tests/capture_preview.gd -- --test-mode --view=ce1_feedback`, 1152 × 720, visuell geprüft. Zwei natürliche Guardians im inszenierten Welle-3-Aufbau, jeweils echter 14-Schadens-Testtreffer mit 6.0 Lebensverlust und 8.0 BLOCKED. Seer-Konzentrationspunkte und BROKEN sind gestellte eingefrorene Darstellungszustände. Kein menschlicher Playthrough oder Clip. Frühere CE1-Aufnahmen zeigen die initiale Fassung und bleiben erhalten.

## CE2 – Ascent & Boss Milestones, 19.10.2026

`captures/2026-10-19_ce2_intro.png`, `2026-10-19_ce2_champion.png`, `2026-10-19_ce2_prophet.png`, `2026-10-19_ce2_reward.png`: native D3D12-Aufnahmen aus dem aktiven Godot-Projekt mit `tests/capture_preview.gd -- --test-mode` und Ansichten ce2_intro / ce2_boss5 / ce2_boss10 / ce2_reward. Je 1152 × 720, visuell geprüft. Gestellte, eingefrorene Begegnungen; Prophet STEADY CAST bewusst gesetzt, Bosskarte über bereinigtes Testbudget erzeugt. Kein menschlich besiegter Boss, keine echte 15–20-Minuten-Session und kein neuer Clip. Frühere Aufnahmen bleiben unverändert als Historie erhalten. Zugehöriger Spiel-Commit steht im CE2-Devlog-Eintrag.

## CE3 – 19.10.2026

`captures/2026-10-19_ce3_cards.png` und `2026-10-19_ce3_combat.png`: mit `tests/capture_preview.gd -- --test-mode --view=ce3_cards` beziehungsweise `ce3_combat` erzeugt, native D3D12-Ausgabe 1152×720. Beide Bilder gesichtet. Kartenansicht zeigt absichtlich alle drei neuen Karten statt einer natürlichen Ziehung; Kampfanordnung friert Gegner/Projektile ein, aktiviert alle neuen Karten plus Codex und stellt READY für die Darstellung. Cyan markierter Hauptschuss entsteht über den echten Attack-Pfad. Keine menschliche Spielaufnahme, kein Video und kein Beleg für die Balance über mehrere Runs. Historische Medien bleiben erhalten.