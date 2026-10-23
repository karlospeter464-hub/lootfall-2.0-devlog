# EP01 – Shotlist / CapCut-Import

Thema: **My First Playtester Exposed a Problem With My Game**

Sechs finale MP4s: echtes 1080p, 30 FPS, H.264/AAC. Direkter Importordner: `C:\Users\elias\Lootfall 2.0\Video_Production\EP01\capcut_import`. AVI-Master, Quell-ZIPs und QA bleiben hier im Episodenordner.

**Herkunft:** A/B sind heute aufgenommene Rekonstruktionen des tatsächlichen historischen Commits. C–F sind aktuelle kontrollierte Laufzeitszenen. Kein Original-Gameplay des Testers. Die Wellen 7/12 stammen aus dokumentiertem Feedback in WORLD_RESTORATION.md §1 und DEVLOG, nicht aus diesen Clips.

| Clip | Dauer | Vorgeschlagener Einsatz | Quellenausschnitt |
|---|---:|---|---|
| [A — The Original Game](<C:/Users/elias/Lootfall 2.0/Video_Production/EP01/capcut_import/01_Original_Game.mp4>) | 8.00 s | 0–4 s · Hook / früherer Kampf | 0–4 s |
| [B — Combat and Build Discovery](<C:/Users/elias/Lootfall 2.0/Video_Production/EP01/capcut_import/02_Combat_and_Build_Discovery.mp4>) | 8.00 s | 4–10 s · Combat und Builds machten Spaß | 1–7 s |
| [C — A Dying World](<C:/Users/elias/Lootfall 2.0/Video_Production/EP01/capcut_import/03_A_Dying_World.mp4>) | 6.02 s | 10–14 s · Das langfristige Ziel fehlt | 0–4 s |
| [D — The World Comes Back to Life](<C:/Users/elias/Lootfall 2.0/Video_Production/EP01/capcut_import/04_The_World_Comes_Back_to_Life.mp4>) | 8.00 s | 14–22 s · Jeder Run heilt die Welt | 0–8 s |
| [E — Region Fully Restored](<C:/Users/elias/Lootfall 2.0/Video_Production/EP01/capcut_import/05_Region_Fully_Restored.mp4>) | 10.01 s | 22–31 s · Sichtbarer Erfolg / neue Region | 0–9 s |
| [F — The Bigger Journey](<C:/Users/elias/Lootfall 2.0/Video_Production/EP01/capcut_import/06_The_Bigger_Journey.mp4>) | 8.00 s | 31–38 s · Die größere Reise | 1–8 s |

Die Auswahl ergibt rund **38 Sekunden** und ist ein Schnittvorschlag, kein fertig montiertes Video. Voiceover, Hook-Text und Schnitt entstehen später in CapCut.

## Testaufbauten / ehrliche Zuordnung

**A — The Original Game**: Historischer Commit ohne Restoration, heute inszeniert. Welle 3, Spawnbudget 40, Swift Scepter/Cinder Codex, 1 Power/1 Fan; Gegner werden nachgesetzt.

**B — Combat and Build Discovery**: Historischer Commit: Welle 2, Spawnbudget 40, Ember Scepter/Storm Grimoire, 1 Power/1 Fan und Burst vorbereitet. Bei 4,5 s scripted Cleanup; regulärer Wave-Clear öffnet echte Kartenwahl.

**C — A Dying World**: Aktuelle Fields bei 0 %. Welle 3, Spawnbudget 40, Ember Scepter/Cinder Codex, 1 Power/1 Fan; Gegnernachschub verhindert leere Passage. Keine Heilung im Clip.

**D — The World Comes Back to Life**: Kontrollierte kumulative Credit-Fixture: Welle 12, Welt 0/600, bisherige Run-Credits 0. Scripted Cleanup bei 2 s; echter Clear/Save/Tween schreibt 312 Punkte (52 %). Kartenoverlay für Landschaft verborgen. Keine Darstellung der normalen Einzelwellenrate.

**E — Region Fully Restored**: Wie D, aber gespeicherte Welt startet bei 288/600 (48 %). Echte 312 Punkte heilen auf 600; Grove freigeschaltet. Echte Kartenauswahl bei 5 s, Ergebnis/Return to Town bei 6 s. Kein Punktüberhang bei dieser exakt passenden Fixture.

**F — The Bigger Journey**: Geladene Weltpunkte [600,560,0], regionale Bestwellen [12,7,0], 180 Echoes, keine Talente gekauft. Fields restored, Grove 40 %, Marsh locked. Bei 5 s echte Skilltree-Ansicht, bei 7 s zurück zur Übersicht.

Alle Gameplay-Szenen: mittig bewegte, unverwundbare Testfigur, Seed 4201, vorbereitete bestehende Items/Karten. Projektiltreffer, Gegnerverhalten, Save/Clear/Tween/Karten/Unlock sind echte Spielsysteme. Keine produktiven Gameplay-Änderungen.

**Wichtig für D/E:** Der große Sprung verwendet kumulative Test-Credits einer Welle-12-Fixture. Nicht behaupten, jede normale Welle heile 52 % der Region.

## Ton, Hochformat und Grenzen

A/B und F sind im Original still. C/D/E enthalten echten Spielton; Peaks/RMS in manifests/EP01_MANIFEST.json. Die Kontrolle wurde stumm abgespielt; subjektive Lautstärke/Mischung noch in CapCut prüfen. Keine künstlich hinzugefügte Musik/VO.

Kampf für 9:16 nachführen; Karten und Hub vollständig passend einbetten. Kein pauschaler Center-Crop. Vollständige 16:10-Spielansicht ist unverzerrt in den 16:9-Master eingepasst.

Alle sechs MP4s nativ geöffnet, vier Zeitpositionen dekodiert, stumm bis höchstens 0,25 s vor Dateiende abgespielt. Codec/FPS/Dauer/Abmessungen und AVI-Ton geprüft. Ein tatsächlicher CapCut-Import ist nicht erfolgt. Gameplay-/Effekt-/Menüframes visuell gesichtet.

Fehlendes Material: Originalruns des Testers; 9:16-Schnitt/Voiceover bleiben absichtlich offen. Alle sechs angefragten Motive vorhanden.

Technische Proben und verworfene Takes sind unter technical_probes erhalten und gehören nicht in den Schnitt. Ältere AVI-Takes außerhalb *_final.avi ebenfalls ignorieren.
