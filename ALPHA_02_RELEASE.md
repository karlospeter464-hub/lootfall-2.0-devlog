# Lootfall Alpha 0.2 — Windows-Release, 23.10.2026

**ZIP:** C:/Users/elias/Lootfall 2.0/Exports/Playtest_v0.2/Lootfall_Alpha_v0.2_Windows.zip

39.857.009 Bytes; SHA-256 `67eb6a4d66acc3e541d7240ab0386de74e97eba9846167d0c59ded348bc58d1a`.
Fünf Dateien: Lootfall.exe, Lootfall.pck, README.txt, GODOT_LICENSES.txt und ASSET_NOTICES.txt.

Aktueller lokaler Stand mit drei Regionen, sofortiger Wellen-Restoration/Heilungsanimation, Übertrag, 45 Talenten und bisherigen Karten/Items/Bossen. Nur Release-Metadaten 0.2.0/0.2.0.0, Presetpfad und Audit/Dokumentation verändert, keine Balance-/Gameplayänderung. Normale Savepfade und v1–v3-Kompatibilität erhalten; Tests komplett isoliert.

## Geprüft

- 1272 Quellprüfungen/17 Suites, 868 echte PCK-Prüfungen/10 Suites, 8 Paketaudits: keine fehlgeschlagenen Prüfungen.
- Native D3D12-Release-QA: 87 Checks plus 23 in zweitem Prozess; Start/Inputberechnung/Angriff, physische Items/Ausrüsten, Karten, beide Bosse, zehn simuliert geklärte Wellen, Live-Credit, Tod/Echoes/Baumkauf, Reload, tatsächlicher Heilungsübergang, beide Freischaltungen und absoluter Übertrag.
- QA-EXE bytegleich zum Paket; externe QA-Einstiegs-PCK lädt tatsächliche finale Spielressourcen. Keine QA-Datei im ZIP. Das ist Release-Runtime-Verifikation, kein vollständiger menschlicher Durchlauf.
- Direkter Start aus frisch entpackter ZIP beim erneuten Versuch erreichbar: Emberhaven leer, F1 gesperrt, Explore startet Run. Danach Benutzereingaben erkannt; Livebild Welle 2/Kampf/+4 Heilung, isolierte Datei bestätigt [4,0,0]. Nicht weiter in laufende Benutzerbedienung eingegriffen. Nur diese Testinstanz hatte automatisches Zeitlimit; regulärer Paketstart ohne Zeitlimit.
- x86_64/PE-Version, offizielle vorhandene Template-SHA512 und Installationsbytes, ZIP-CRC/Allowlist/frische Extraktion bytegleich geprüft. MCP/Tests/privaten Daten/Caches nicht enthalten; interne importierte .godot-Ressourcen sind nötig.

## Materialien / offene Punkte

Sechs native PNGs und englische Beschreibung, Startanleitung, Changelog, Einschränkungen sowie Bildprovenienz: C:/Users/elias/Lootfall 2.0/Exports/Playtest_v0.2/itch_assets/.
Screenshotwerte und Gegnerclears sind kontrollierte Fixtures, keine behaupteten natürlichen Runs. Deep-Tree zeigt XII–XV. Feedback-Link ausdrücklich Platzhalter.

Technisch kein verbleibender Packaging-/Gameplayfehler in finalen Tests. Vollständiger menschlicher Durchlauf, spätes Last-/Balanceverhalten und weitere Windows/GPU-Systeme offen. Frühere QA-Fehlversuche dokumentiert: Audit aus Projektordner sah lokale Dateien, CLI-Overrides in Standard-Release gesperrt, erste QA ohne InputMap und synthetische Rechtszeiger-Annahme fehlerhaft. Standalone-Audit und korrigierter QA-Lauf bestanden. System-Zertifikatsspeicher-/Editorcache-Meldungen im beschränkten Toolkontext, keine OS-Schutzregeln verändert.

**Vor öffentlichem Upload:** Für die vom Projektinhaber gelieferte optionale Magierillustration liegt keine separate Lizenz-/Rechtedokumentation vor. Standard ist prozedural, Textur wird noch als Szenenabhängigkeit gebündelt. Herkunft und fehlende Dokumentation sind im Paket offen aufgeführt; öffentliche Weitergaberechte bitte bestätigen. Godot-/Bibliothekslizenzen vollständig beigelegt. Keine Naturreferenzfotos oder Musik übernommen.

## Kurz selbst testen

ZIP vollständig entpacken, Lootfall.exe öffnen, Explore. WASD/Maus/LMB, I/ausrüsten, zwei Wellen/Karten/Heilung, sterben, zurück nach Emberhaven, Echoes ausgeben, beenden/neustarten. Frühe Heilung zeigt kleine Prozentwerte: Welle 1 +4/600 = 0,7 %, Welle 2 insgesamt 12/600 = 2 %. F1 darf keine Konsole öffnen. Bestehenden echten Spielstand nicht löschen. Technischer Vollbericht und Hashmanifest liegen neben der ZIP.

Kein Upload, keine Veröffentlichung, kein GitHub-Push. V0.1 bewahrt. Zwischenzeitlich neu hinzugefügte unversionierte Nutzer-Grafik nicht in Release/Commit übernommen.

Lokaler Spiel-Releasecheckpoint: **ad04503**.
