# Lootfall 2.0 – Entwicklungsprotokoll

## 2026-10-16 – Git-Checkpoint und Screenshot vor dem Inventar

**Auftrag:** Nutzer bestätigt das vorgeschlagene INV1-Paket und bittet vor dem Weiterarbeiten um Git-Commit und aktuellen Screenshot fürs Archiv. Dieser Auftrag sichert den Stand; kein Inventar-/Gameplay-Code darin geändert.

**Screenshot:** Echten kurzen Lauf der aktuellen Hauptszene über Godot MCP gestartet, `runtime_screenshot` aufgenommen und gesichtet, anschließend den gestarteten Lauf beendet. Archiv: `Progress/captures/2026-10-16_before_inventory.png`, 1152 × 720, unveränderte native Aufnahme. Kein inszenierter Capture-Test und keine menschliche Gameplay-Aufnahme. Original liegt außerdem in Godots user://screenshots/; keine Spielstanddatei ins Repository übernommen.

**Spiel-Commit:** `bc2877fd82fa738a3ba5d27905e7a3a2210c9fba` – `Checkpoint arena loot Echoes and dev console before inventory`. Eigenes lokales Repository direkt unter `C:/Users/elias/Lootfall 2.0/lootfall-2.0`, Branch `codex/baseline`. 316 Dateien: Spielquellen/Szenen/Tests, Projekteinstellungen, vorhandene Nutzertestszene, aktive MCP-Toolkit-Quellen und Lizenz. Aktueller Arbeitsbaum nach Commit sauber; kein Remote eingerichtet.

**Chronik-Commit:** Dieser begleitende lokale Commit im bestehenden OneDrive-Chronik-Repository enthält Masterplan, Regeln, Devlog, Galerie und Archiv einschließlich Screenshot. Zwei Repositories bewahren die vorhandenen Godot-/MCP-Pfade, statt jetzt unter offenem Editor Ordner zu verschieben. Dokumentation referenziert den konkreten Spiel-Commit. Frühere ZIP-Sicherungen bleiben erhalten.

**Ausschlüsse:** Godot-Caches, echte Spielstände, maschinenspezifische `.codex`-/MCP-Konfiguration und Credentials nicht gestaged; inaktives Godot AI und dessen Updateordner lokal belassen/ignoriert. Keine Dateien gelöscht, kein Upload/Push. Ausgewählte Pfade und Credential-Muster geprüft; kein vollständiges Sicherheits-Audit des bestehenden Drittanbieter-Addons behauptet.

**Prüfung:** Vor dem Spiel-Commit beide Suites mit aktivem MCP-Runtime-Autoload erneut ausgeführt: Arena 58 + Loot/Konsole 54 = 112 checks / 0 failures, Exit 0, isoliertes APPDATA und `--test-mode`. Eigene gestagte Dateien auf Whitespace und unerwünschte Pfade geprüft; Galerie-Verweise vor Chronik-Commit geprüft. Nur überschüssige Schlussleerzeile im Spiel-AGENTS bereinigt, keine Laufzeitlogik geändert.

**Nächster Schritt / Grenze:** INV1 mit Run-Tasche, Zepter-/Buchslot und bewusster Equipment-Wahl als nächstes Paket. Echoes-Ausgaben und dauerhafte Items bleiben außerhalb. Beide Checkpoints sind lokal, noch keine externe Sicherung.

---


## 2026-10-16 – Godot MCP live bestätigt

Nach dem Neustart sind die Godot-MCP-Werkzeuge im Chat verfügbar. Zwei lesende Aufrufe zum Editor erfolgreich: Projektsettings melden Lootfall 2.0 und Hauptszene `res://scenes/arena.tscn`; der aktuell im Editor bearbeitete Szenenbaum enthält eine leere Node2D-Szene (`res://node_2d.tscn`). Nicht automatisch zur Arena gewechselt oder Szene gespeichert. Verbindung damit tatsächlich bestätigt; Spielstart/Runtime-Steuerung nicht erneut geprüft. Nur Dokumentation aktualisiert, kein Gameplay verändert.

---


## 2026-10-16 – Godot-MCP-Verbindung für Codex vorbereitet

**Auftrag:** Nutzer bittet ausdrücklich, den fehlenden Codex-Servereintrag selbst anzulegen.

**Änderung:** `.codex/config.toml` im Chronik-/Codex-Projekt neu angelegt (UTF-8 ohne BOM). Verwendet vorhandenen Node-Runtime und vorhandene Toolkit-Brücke 1.0.4 aus dem alten Lootfall; cwd und GODOT_MCP_PROJECT_PATH zeigen auf das neue `C:/Users/elias/Lootfall 2.0/lootfall-2.0`. Keine bestehenden Konfigurationen ersetzt, keine Pakete installiert, kein Spielcode geändert. Das Godot MCP Toolkit ist laut project.godot aktiviert.

**Prüfung:** TOML mit dem gebündelten Python/tomllib geparst, Node-/Brücken-/Spielpfade und übereinstimmende Projektvariable geprüft. Vorhandene Brücke mit `--tools-count` gestartet: Exit 0, 112 Tools + 2 Meta, 160 Operationen. Das ist ein Brückenstarttest, kein erfolgreicher Editor-Aufruf.

**Offen:** Codex neu starten, Godot geöffnet lassen; erst danach im Chat einen lesenden Szenenbaum-Aufruf durchführen. Aktuell noch keine Godot-MCP-Werkzeuge in diesem laufenden Chat geladen. Keine Git-Commits oder Gameplay-Tests in diesem Konfigurationsauftrag.

---


## 2026-10-16 – Feedback: Mehr Gegenstand, weniger automatischer Power-up

**Nutzerbeobachtung:** Look and Feel sehr gut; Echoes hat beim Spielen funktioniert. Dev-Konsole noch nicht selbst ausprobiert. Cinder Codex erklärt seine Wirkung beim Fund nicht ausreichend; sofortige Aktivierung wirkt wie ein Power-up. Nutzer möchte Loot besitzen, untersuchen und während des Runs Equipment verändern. Keine vollständige Abnahme aller Echoes-/Speicherfälle aus diesem Feedback ableiten.

**Planungsantwort:** Masterplan Abschnitt 8.4 enthält den noch unfreigegebenen INV1-Vorschlag. Aufheben → Run-Tasche → Beschreibung/Vergleich → bewusst ausrüsten → Wirkung erkennen. Vorschlag: acht Taschenfelder, ein Zepter- und ein Buchslot, je zwei feste Testalternativen, pausierte Bedienung über I beziehungsweise Equipment im Escape-Menü. Erklären beim Annähern/Fund und im Inventar, ohne automatisch erzwungene Kampfpause beim Aufheben. Karten und Echoes-Regeln bleiben; Run-Item-Persistenz unverändert. Das erweitert den bisherigen „ein Drop, kein Inventar“-Scope ausdrücklich und ist keine bereits umgesetzte Änderung.

**MCP-Frage geprüft:** In diesem Chat keine Godot-MCP-Werkzeuge verfügbar; neues Projekt ohne addons/Godot-MCP-Aktivierung. Bisherige Umsetzung direkt über Dateien und Godot-Kommandozeile für Tests/Engine-Vorschauen. Das frühere Projekt besitzt Godot MCP Toolkit und eine dokumentierte Brücke; sie wurden nicht in Lootfall 2.0 übernommen. Keine Installation oder Konfigurationsänderung vorgenommen. Offizielle allgemeine Codex-MCP-Dokumentation geprüft: https://learn.chatgpt.com/docs/extend/mcp?surface=cli . Konkrete Godot-Anbindung bleibt optional und separat zu prüfen.

**Prüfung:** Nur Feedback/Planung dokumentiert; keine Gameplay-Änderung und keine neuen Laufzeittests oder Medien. Bestehende 112 automatisierte Prüfungen gehören zum vorherigen Implementierungsstand.

---


## 2026-10-16 – Cinder Codex, Echoes und F1-Balancing

**Auftrag/Planbezug:** Nutzer beauftragt das dokumentierte Zufallsloot-/Run-Ende-Belohnungsmodell und eine umfangreiche Dev-Konsole. P1 sowie Belohnung/Speichern aus P2; keine stillschweigende vollständige P2-Umsetzung. Wellenbasierte Kartenentscheidungen bleiben bei 2/4. Code und Spieloberfläche Englisch.

**Umgesetzt:** Cinder Codex droppt mit einstellbaren 2 % pro berechtigtem Gegnerkill, maximal ein Buch am Boden/aktiv pro Run. Physisch aufheben; bleibt über Wellen hinweg liegen. Feuerballtreffer ergänzen 60 % Geschossschaden im Radius 85 an andere Gegner; Primärgegner erhält keinen doppelten Treffer. Neustart entfernt Item/Buildeffekt. Kein dauerhafter Itembesitz, kein Inventar, keine XP-Leiste.

**Echoes-Startmodell:** `10 * n * (n + 1) / 2`, n = abgeschlossene Wellen; bei Tod/Sieg einmal am Ergebnis. Beispiele 1/2/3/6 abgeschlossen → 10/30/60/210 Echoes. Erreichte Welle allein bringt keine Auszahlung, App-Schließen im Run ebenfalls nicht. Faktor im F1-Menü. Wallet und Bestwelle werden gespeichert, Run-Items nicht. Kein Hideout oder Ausgaben für Echoes in diesem Paket.

**Dev-Konsole:** F1 öffnet sechs Tabs: Metrics, Player, Waves, Enemies, Combat & loot, Rewards & tools. 28 begrenzte Regler mit Wirkungshinweisen; tatsächliche Buildwerte werden inklusive gewählter Karten neu berechnet. Enemy-Werte für neue Gegner; neue Geschosse übernehmen Geschosswerte. Metriken: FPS/Frame/Memory, Zustand/Zeit/Seed, Wellen/Bestwert, Gegner/HP/Spawn-Budget, Kills/Schüsse/Treffer/Schaden/DPS/HP-Verlust, Karten und Loot, Wallet/prognostizierte Auszahlung. Testaktionen: Unverwundbarkeit, Gegner einfrieren, HP auffüllen, physisches Testbuch, aktive Gegner besiegen und RNG-Seed anwenden. Testschalter resetten im neuen Run. F1 pausiert und stellt vorherige Pause/Karten-/Ergebniszustände wieder her. Keine Konsole im Release-Build.

**Profile und Speichern:** Profile sind getrennt vom Fortschritt und werden manuell gespeichert/geladen. Bekannte Keys, Typen, Grenzen und endliche Werte werden vor jeder Profilanwendung vollständig validiert. Kein partiell angewendetes ungültiges Profil. Standard-Reset nimmt Inspector-Startwerte. Spielstand/Profile über geprüfte temporäre Dateien und Backup ersetzen; beschädigten bestehenden Spielstand nicht überschreiben. Auszahlungsfehler bieten Retry statt stillschweigendem Verlust beim Neustart; Wiederholungsschutz nach erfolgreicher Auszahlung. Dev-Testaktionen und Tuning beeinflussen echte Runs und deren Echoes; für isolierte Versuche `-- --test-mode` verwenden.

**Prüfung:** Godot 4.7.2: `arena_test.gd` 58 checks / 0 failures, `loot_console_test.gd` 54 / 0, beide Exit 0 ohne Laufzeitfehler. Echte Physik-Aufnahme/Flächentreffer, Run-Reset, Auszahlungsformel/Einmaligkeit, neue Save-Instanz, Backup/Wiederherstellung, fehlgeschlagene Auszahlung/Retry, beschädigte/ungültige Dateien, echte SpinBox-Signale, aktive Kartenwerte nach Tuning, Profil-Roundtrip/atomare Validierung und Pausen-Eingabe geprüft. Tests und Capture erzwingen `--test-mode` mit prozessspezifischen Dateien; APPDATA zusätzlich unter `.godot/test-user` isoliert.

**Aufschlussreiche Korrekturen:** Erste Tests fanden nicht unterstütztes `%g` in Kartentexten sowie JSON-Zahltypen (Integer werden beim Parsen Float) bei der Rückleseprüfung. Formate korrigiert, beide Seiten der Datei-Prüfung aus JSON gelesen. Eine Testfixture hatte kein verbleibendes Spawn-Budget; gezielt korrigiert. Beschädigte JSON wird nun ohne irreführenden Engine-Fehler als ungültig behandelt. Finaler Stand siehe erfolgreiche Prüfungen oben.

**Medien:** Vier native D3D12-Vorschauen mit AMD Radeon RX 7600S erzeugt/gesichtet: `2026-10-16_codex_v01.png`, `2026-10-16_console_v01.png`, `2026-10-16_tuning_v01.png`, `2026-10-16_echoes_v01.png` unter `Progress/captures/`. Inszenierte Engine-Testaufbauten, keine menschlichen Playthroughs oder neuen Clips. Vorherige Quellen unter `Progress/snapshots/2026-10-16_p0_before_loot.zip` gesichert.

**Abgleich/Offen:** Beauftragtes Modell umgesetzt; keine Sammelleiste, kein Kartenersatz, keine neue Klasse/Gegnerrolle oder Plugins. Für echte Abnahme Codex gezielt testen, kompletten Run spielen, F1/Profile ausprobieren und Anwendung neu starten, um Wallet zu prüfen. Seltenheitsgefühl/Balance und Release bleiben offen. Ein Save-Fehler muss vor App-Schließen behoben werden, damit ein noch ungespeicherter Run-Ertrag nicht verloren geht.

---


## 2026-10-16 – Erste Idee: Zufälliger Loot hilft beim Pushen

**Nutzerwunsch:** Seltene Items sollen zufällig droppen, beim Erreichen höherer Wellen helfen und dadurch mehr Echoes am Run-Ende ermöglichen. Zunächst als erste Idee dokumentieren.

**Vorläufiges Testmodell:** Items verändern nur den aktuellen Run und werden nicht in den nächsten Run übernommen. Höherer Wellenfortschritt soll die spätere Echoes-Belohnung erhöhen; der Itemfund selbst erzeugt keinen zusätzlichen Echoes-Bonus. Wellenbasierte Kartenentscheidungen bleiben bestehen. P1 testet zunächst einen seltenen Drop mit einem besonderen Effekt, P2 ergänzt später die Meta-Belohnung. Kein gemeinsamer Implementierungsauftrag beider Phasen aus diesem Konzept abgeleitet.

**Offen:** Dropchance, Itemeffekt, Stapelregeln, konkrete Echoes-Formel und Behandlung von erreichter/abgeschlossener Welle, Sieg/Tod/Abbruch. Langfristige Item-Persistenz bleibt offen; Run-Nutzung ist die vorläufige Richtung für diesen Test.

**Dokumentation/Prüfung:** Masterplan Loops B/C, P1/P2, offene Fragen und Status/Änderungslog konsistent angepasst. Nur Dokumentation geändert; keine Gameplay-Änderung, keine neuen Spieltests oder Medien.

---

## 2026-10-16 – Planbindung und Belohnung am Run-Ende

**Korrektur:** Nutzer weist den vorgeschlagenen Ersatz der Wellenkarten durch eine Sammel-/Fortschrittsleiste als Planabweichung zurück. Vorschlag zurückgezogen; der vorherige Diskussionsstand weiter unten ist historisch und keine Freigabe.

**Entscheidung:** Ressourcenbelohnung nach dem Run auf dem Ergebnisbildschirm. Vorläufigen Namen an Codex delegiert: Echoes. Genaue Berechnung und Regeln für Sieg/Tod/Abbruch noch nicht festgelegt. Der bestehende wellenbasierte Kartenfortschritt bleibt erhalten. Die im Masterplan vorgesehene Reihenfolge P1-Loot-Test, danach P2-Meta-Fortschritt bleibt Planungsgrundlage.

**Arbeitsweise:** AGENTS und Masterplan um einen ausdrücklichen Planabgleich ergänzt: Ziel, Planbezug, Umfang, offene Fragen; Änderungen an Core Loops/Belohnungsauslösern/Persistenz als Abweichungen benennen und bestätigen lassen. Am Ende Umsetzung gegen Freigabe prüfen. Technische Entscheidungen innerhalb freigegebenen Umfangs eigenständig lösen.

**Offen:** Was mit seltenen Items nach dem Run geschieht: nur Run-Effekt, dauerhafter Archiv-/Freischalteintrag oder dauerhaft ausrüstbares Item. Keine dieser Optionen durch den Ressourcenbeschluss entschieden.

**Prüfung:** Nur Regeln und Dokumentation geändert; kein Gameplay geändert, keine neuen Laufzeittests erforderlich.

---


## 2026-10-16 – Erstes Spielerfeedback: Der Kern macht Spaß

**Beobachtung:** Nutzer bezeichnet den ersten Prototyp als „unglaublich cool“ und berichtet, dass er „schon sehr viel Spaß“ macht. Gewünschte nächste Entwicklung: Ressourcen einsammeln und etwas mehr Komplexität.

**Einordnung:** Positives tatsächliches Nutzer-Spieltestfeedback zum aktuellen Prototyp. Kein Nachweis, dass alle sechs Wellen, jedes Upgrade, beide Run-Enden oder alle Balancewerte separat abgenommen wurden.

**Nächste Diskussion:** Welche Aufgabe sollen Sammelressourcen erfüllen: Fortschritt des Builds im aktuellen Run oder dauerhafte Entwicklung zwischen Runs? Vorschlag für einen kleinen Folgeschritt: sichtbare Run-Pickups mit klarer Wirkung und anschließend ein zweites Gegnerverhalten für andere Bewegungs-/Zielentscheidungen. Konkrete Regeln und Umfang noch nicht beschlossen; keine Gameplay-Dateien geändert.

**Prüfung:** Nur Dokumentationspflege; keine neuen Spieltests und keine neuen Medien.

---


## 2026-10-16 – P0: The Ember Trial

**Auftrag:** Das gemeinsam vorgeschlagene Arena-Paket in einem Durchgang umsetzen. Ergänzung des Nutzers: Spiel und Code auf Englisch. Chronik bleibt Deutsch.

**Ausgangspunkt:** Godot-Grundprojekt neu gefunden unter `C:/Users/elias/Lootfall 2.0/lootfall-2.0`, getrennt vom OneDrive-Ordner dieser Chronik. Keine bestehenden Szenen oder Scripts. Vorheriger Lootfall-Code blieb unberührt.

**Umgesetzt:** Vier Szenen (Arena, Player, Enemy, Projectile), vier Scripts, InputMap und Hauptszene. WASD + unabhängiges Mauszielen + gehaltene linke Maustaste; Feuerbälle mit durchgehender Trefferprüfung, begrenzter Lebensdauer und Schadensrückmeldung. Ein verfolgender Gegnertyp mit Kontaktschaden und Schutzzeit nach Spielertreffern. Sechs Wellen mit 8/12/16/20/24/28 Gegnern, Limit 18 gleichzeitig; sichere Randspawns. Nach Welle 2 und 4: Ember Power (+35 % Basisschaden), Quick Casting (20 % kürzeres Intervall), Fire Fan (+1 Projektil); zweimal dieselbe Wahl erlaubt. Pause/Resume, Tod/Sieg, Ergebnis und vollständiger Neustart; Bestwelle nur in derselben Spielsitzung. Eigene prozedurale Platzhaltergrafik, keine fremden Assets oder neuen Abhängigkeiten.

**Prüfung:** Godot 4.7.2, `tests/arena_test.gd`: **58 checks, 0 failures**, Exit 0. Prüft Bewegung/Begrenzung, Kontakt-/Schutzzeit, echte Physik-Geschosstreffer, Cooldown/Lebensdauer, Gegnerlimit/sichere Spawns, Pausieren samt Escape im pausierten Baum, alle sechs Wellen, Upgrade-Button-Signale, doppelte Klicks, Modifikatoren, eindeutige Killzählung (108), Tod/Sieg und Neustart. Abschlusskorrektur: Fire Fan behält den gezielten Hauptschuss und ergänzt seitliche Geschosse; ein zusätzlicher Ferntreffer-Test sichert das ab. Vollständiger Ablauf im Test beschleunigt durch programmgesteuertes Besiegen; kein Nachweis manueller Schwierigkeit. Hauptszene zusätzlich headless über 120 Frames ohne Fehler gestartet. Native D3D12-Vorschauen auf AMD Radeon RX 7600S erzeugt und angesehen.

**Prüfgrenze:** Der zusätzliche Editorimport endet mit Exit 0, meldet aber Safe-Save-Probleme bei Editoreinstellungen. Erste Ausführung konnte außerhalb des Workspace keine AppData-Verzeichnisse anlegen; weitere Prüfungen verwenden isoliertes APPDATA unter `.godot/test-user`. Kein entsprechender Fehler in Laufzeittests oder nativen Vorschauen. Keine Sicherheits-/Antiviruseinstellungen geändert.

**Medien:** `Progress/captures/2026-10-16_arena_v01.png`, `2026-10-16_upgrades_v01.png`, `2026-10-16_result_v01.png`. Reproduzierbare, inszenierte Engine-Testaufbauten; keine Aufnahme eines menschlichen Durchlaufs und kein neues Video. Herkunft: eigenes neues Godot-Projekt, `tests/capture_preview.gd`.

**Jetzt selbst einstellbar:** Arena-Inspector: Gegnerzahl/Zuwachs/Obergrenze, Spawntakt, Sicherheitsabstand und Gegnerwerte. Player-Inspector: Bewegung, Basisleben/-schaden/-Feuerrate, Schutzzeit. Projektilszene: Geschwindigkeit/Lebensdauer. Basiswerte werden beim Neustart angewendet; Gegnerwerte bei neuen Spawns.

**Für die spätere Erzählung:** „Der erste kleine Run verbindet aktiven Kampf mit zwei Entscheidungen. Jetzt muss ein echter Spieltest zeigen, ob stärkere Builds auch mehr Lust auf den nächsten Versuch machen.“ Redaktioneller Vorschlag, kein Nutzerzitat.

**Offen:** Nutzer spielt vollständige Runs und prüft Spielgefühl, Balance, Erkennbarkeit der Upgrades, Pause und Neustart sowie andere Fenstergrößen. Kein Inventar, Loot, Meta-Loop, Klassen-/Skill-Framework oder Export. Spielquellen liegen separat vom Git-Repository der Chronik; kein Git-Commit für das neue Spiel erstellt.

---


## 2026-10-16 – Die Vorgeschichte bewahren, den Neustart sichtbar machen

**Ziel:** Die Game-Dev-Entwicklung fortlaufend nachvollziehbar sammeln, um später eventuell ein YouTube-Devlog daraus zu erstellen. Chronik, Screenshots und ausgewählte Clips reichen; keine durchgehende Bildschirmaufnahme gewünscht.

**Ausgangspunkt:** Neuer Projektordner enthielt nur `.git`. Im früheren Lootfall existieren zwei Godot-Projekte, eine Fortschrittsgalerie und Medien. Frühere Funktionen sind nicht automatisch Teil von Lootfall 2.0.

**Änderung:** Masterplan lokal abgelegt, Status aktualisiert, HTML-Gestaltung der alten Galerie wiederverwendet. Drei historische Screenshots und zwei MP4-Dateien bytegetreu in `Progress/archive/` kopiert; Herkunft und historische Bedeutung gekennzeichnet. README und Pflegeablauf ergänzt. Altes Projekt und Downloads-Original unverändert.

**Prüfung:** Dateihashes der fünf Medien mit Originalen verglichen und lokale HTML-Verweise einschließlich Sprungmarken geprüft. Kein Gameplay-Test: es wurde kein Gameplay-Code geschrieben. Alle 20 HTML-Verweise einschließlich Sprungmarken sind vorhanden; Designabschnitte 1–8 des Masterplans unverändert. Browser-Sichtprüfung nicht möglich: lokale HTTP-Vorschau durch Socket-Rechte blockiert, direkter Dateiaufruf vom Browser aus Sicherheitsgründen gesperrt. Videos nicht abgespielt oder inhaltlich neu gesichtet.

**Für eine spätere Erzählung:** „Aus dem ersten Lootfall-Prototyp nehme ich Erfahrungen und sichtbare Erinnerungen mit. Für 2.0 will ich zuerst den kleinsten motivierenden Kampftest beweisen.“ Redaktioneller Vorschlag, kein Nutzerzitat.

**Offen:** Neues Godot-Projekt und erster abgegrenzter Bauauftrag; keine Aussagen über neuen Spielspaß oder bestandene alte Tests. Noch kein neues Gameplay-Material.

---

Für kommende Einträge: Datum/Titel, Ziel, Ausgangsproblem, Änderung und Grund, tatsächliche Prüfung, Medienpfad, offene Frage. Fehlversuche festhalten, wenn sie eine Entscheidung erklären. Keine vollständigen Chat-Transkripte nötig.
