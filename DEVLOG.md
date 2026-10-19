# Lootfall 2.0 – Entwicklungsprotokoll

## 2026-10-19 – Erster externer Windows-Playtest v0.1

**Auftrag / Freeze / Sicherung:** Eigenständig ausführbares Windows-x86_64-Release-ZIP, ausdrücklich ohne neue Spielmechaniken/Balance, Veröffentlichung, Versand oder Push. Beide sauberen lokalen Repositories, AGENTS und Masterplan §9 geprüft; kein Rücksetzen auf GitHub. Alle zwölf Regression-Suites erneut: **898 Checks ohne Fehler**. Vor Export lokale Tags `playtest-v0.1-source-2026-10-19`: Spiel 00e378d, Chronik 378c8ce. Gameplay und project.godot unverändert. Exportpreset, geprüfter Paket-Audit und englischer Prüfbericht lokal als Spiel-Commit **3010a95** gesichert; keine Binärdateien oder maschinenspezifischen Vorlagen im Repo.

**Build / Inhalt:** Offizielle Godot-4.7.2-Standardvorlagen heruntergeladen und gegen offizielle SHA-512 geprüft; Windows-Release-Vorlage in separatem ExportTools-APPDATA installiert. Windows Desktop-Preset x86_64, --export-release, getrenntes PCK, keine Konsolenhülle/Signierung. ZIP außerhalb beider Repositories: `C:/Users/elias/Lootfall 2.0/Exports/Playtest_v0.1/Lootfall_Prototype_Playtest_v0.1_Windows.zip`. **39392635 Bytes, ca. 37,6 MiB**. Genau vier Dateien: Lootfall.exe (109168640), Lootfall.pck (133712), README.txt (1767), GODOT_LICENSES.txt (112879 Bytes). README enthält Voraussetzungen, Entpacken/Start, Bedienung, notwendiges Ausrüsten und Prototypgrenzen. Neu entpacktes ZIP mit vier Quelldateien verglichen: bytegleich. SHA-256: `5733779764BB4533F818797BB5F3853D49C3C9E2E18AF159899784E4570DE92D`.

**Prüfung getrennt nach Laufzeit:** (1) 898 Source-Regressionschecks. (2) Sieben Suites gegen tatsächlich exportiertes PCK unter der Godot-Editor-/Testlaufzeit: **688 Checks, 0 Fehler** (64 Arena, 50 Inventar, 69 Stadt, 249 Ascent, 128 Karten, 65 Items, 63 frühe Progression); umfasst echte Projektil-/Item-/Bossmechaniken und Speichern/Laden, ist kein Release-EXE-Durchlauf. (3) **Sechs Paket-Audits ohne Fehler**: PCK, Szenen, binäre Projektkonfiguration, tatsächliche Hauptszene, kein MCP-Autoload, keine Tests/Addons/privaten Konfigurationen/Spielstände/Editor- oder Shadercaches. Godot-interne exportierte Szenen/Icon-/UID-Metadaten sind benötigte Laufzeitressourcen. Audit-Script über MCP gültig. PE-Kennung x86_64 geprüft. (4) Tatsächliche normale Lootfall.exe mit neuem isoliertem APPDATA: Emberhaven bei 0 Echoes/Talenten, F1 ohne Konsole, Start Run, Bewegung/gezielte Feuerbälle/Gegner und natürlicher Hunter-Drop beobachtet. Echter Tod Welle 1, Ergebnis 0 geklärte Wellen/0 Echoes korrekt, Rückkehr zur Stadt mit Bestwelle 1; isolierte Progress-v2-Datei geschrieben. D3D12 auf Radeon RX 7600S.

**Offene Abnahme:** Im unveränderten Release noch kein vollständiger Test von Kartenauswahl, Aufheben/Ausrüsten, beiden Bossen/neuen Effekten, positiver Echoes-Auszahlung, Talentkauf und gekauftem Fortschritt nach Prozessneustart. Diese Mechaniken bestanden die separaten PCK-Tests, werden deshalb nicht als native Release-Abnahme ausgegeben. Fenstersteuerung durch physische Escape-Eingabe des Nutzers beendet; danach keine weiteren Computer-Use-Eingaben. Aktives natives Testprofil blieb unangetastet. Keine normalen Entwicklungs-Spielstände gelöscht oder für Tests verwendet. Kein neuer Screenshot/Clip archiviert; bestehende CE5-Medien bleiben Vorschauen vor dem Export.

**Fehlversuche / Lösung:** Erster Sandbox-Export meldete trotz Exit 0 Safe-save-Fehler und fehlende temporäre project.binary: verworfen. Mit explizitem Build-TEMP/TMP und passenden Schreibrechten sauber wiederholt; kein Abschalten von Schutzoptionen. Externer --script-Smoke konnte mit der Standard-Release-Vorlage keine Prüflogik injizieren (Pfadüberschreibung nicht verfügbar); startete nur das normale Spiel. Nicht als bestandener Release-Autotest gezählt, Experiment außerhalb Repo/ZIP belassen. Paket-Audit zunächst mit einem physischen Prüfverzeichnis vermischt: auf leeres Mount-Verzeichnis begrenzt; Dekodierung auf zwei primitive benötigte Settings beschränkt statt InputEvent-Objekte zu laden. Finaler Audit sauber.

**Ergebnis / Scope:** Lokales weitergebbares ZIP vorhanden, kein bekannter Verpackungs-/Startblocker. Unsignierter früher Prototyp, weitere Hardware und vollständiger natürlicher Release-Run offen. Code-/Balance-Diff leer; Änderungen nur Exportpreset, Audit und Dokumentation. Kein Upload, Push, Versand, Store-Release oder automatische Synchronisierung.

## 2026-10-19 – GitHub-Synchronisierung nach CE5

Auf ausdrücklichen Nutzerauftrag beide sauberen Repositories und ihre Remotes geprüft, GitHub-Stände abgerufen und Fast-forward-Abstammung bestätigt. Spiel-main von 3ccb604 auf **00e378d** aktualisiert, Remote-Hash gegen lokalen HEAD verifiziert. Enthalten sind CE3, Combat-Polish, CE4 und CE5; die zugehörige Chronik samt Masterplan und Screenshots wird mit diesem Dokumentationscommit auf main synchronisiert. Keine Spieländerungen, neuen Tests, Caches, Spielstände oder Konfigurationen hinzugefügt; kein Force-Push, Export oder automatische Synchronisierung. Vorherige Paket-Einträge beschreiben ihren damaligen lokalen Status.

## 2026-10-19 – CE5: Skill Tree Refresh & Early Progression

**Auftrag / Planabgleich:** Lokalen CE4-Stand de56637, Masterplan §9 und beide AGENTS geprüft. Beide Repositories sauber; vor Änderungen jeweils lokalen Tag `ce4-before-ce5` gesetzt (Spiel de56637, Chronik cd64d6a), Spielbranch `codex/skill-tree-early-progression`. Bestätigte Abweichung: drei Wurzel-Grundwerte durch Effekte ersetzen. 15 IDs/Verbindungen/Querverbindungen, zwölf Folgeknoten, Tierkosten, Run-Ende-Echoes, Snapshot, gemeinsamer Progress v2 und exakter kostenloser Reset bleiben. Ponytail-Workflow; keine allgemeine Effekt-Engine, neuen Gegner/Items/Karten/Klassen oder zusätzliche Belohnungen.

**Änderung / Grund:** Frühe Käufe sollen Spielstil statt nur Zahlen verändern. Kindling: Kill → nächster regulärer zentraler Feuerball binnen 5 s +25 % direkten Schaden, einmal verbraucht, Kills erneuern ohne Stapeln. Fan-Seiten/Echo ausgeschlossen, direkter First-Spark-/Overcharge-/Ember-Bonus kombiniert, kein Multiplikator für Burst/Codex/Storm; direkter Kill kann Burst und neuen Kindling-Zustand auslösen. Emberguard: erster tatsächlicher nichttödlicher Gegnertreffer jeder Welle → 8 % effektive Max-HP-Heilung, kein Schutz-/Heilungs-Trigger oder Wiederbeleben; mit Phoenix/Renewal/Second Wind kombinierbar. Momentum: je vier direkte Projektiltreffer +12 % Bewegung für 3 s, erneuert statt gestapelt, Fan/Pierce/Echo zählen und indirekte Schäden nicht. Basisgeschwindigkeit bleibt unverändert; Pause/Neustart sauber. Orange Bereitschaft/Schuss, grüne Heilung, blauer Fußbogen. Aktuelle Zustände im pausierten Build-Überblick.

**Daten / frühe Motivation:** Alte Root-Käufe behalten IDs und tatsächlich bezahlte Preise, gelten im folgenden Run mit neuer Wirkung statt +4 % Schaden/+5 % HP/3 % Intervall. Voller Baum jetzt +16 % Schaden/+20 % HP/11 % kürzeres Intervall plus Effekte. Keine Migration der Käufe erforderlich. Fünf neue Inspector-/F1-Regler, insgesamt 92, Profil v10 akzeptiert v1–v9; fehlende neue Werte aus Startup-Defaults, alte Zahlen/Dateien nicht stillschweigend verändert. Leerer Geldbeutel nach 0/1/2 geklärten Wellen: 0/10/30 Echoes. Ein Kauf nach jedem beliebig kurzen ersten Run wäre mit den verlangten unveränderten Regeln nicht garantiert; dies vorab im Chat ausgewiesen und ohne künstliche Belohnung bewahrt.

**Darstellung:** Drei farbige gewundene Pfade mit Querverbindungen, runde II/III-Zwischenknoten, größere Einstiege/Endziele. Zustand zusätzlich per Text: gekauft/bezahlbar/verfügbar/gesperrt; heller Fokusring. Auswahl zeigt Effekt, Preis, Vorgänger und Zustand. Pfeile wechseln innerhalb/zwischen Pfaden, Tab erreicht Aktionen; Maus und Enter nutzen normale Godot-Buttons. Stadt nennt bezahlbare Käufe und First Spark/Renewal/Second Wind als nächste Ziele. Keine neue Asset-Pipeline.

**Echte Prüfung:** Godot 4.7.2: 64 Arena + 54 Loot/Konsole + 50 Inventar + 69 Stadt/Baum + 19 Begegnung + 28 Rarity + 74 Counterplay + 249 Ascent + 128 Karten + 35 Combat-Polish + 65 Items + 63 CE5 = **898 Checks, 0 Fehler**. Echte zentrale/fan/piercing Treffer, Kindling-Echo-Ausschluss und Projektilcap ohne Verbrauch, Kill/Burst/Overcharge/Spark/Codex-Kombination; Emberguard effektivem HP entsprechend, einmal/Welle, Schutz/Debug-Heilen/tödlichem Treffer korrekt, echte Phoenix-Heilung plus Renewal; direkte/indirekte Momentum-Treffer, Dauer/Refresh/Pause/Basiswert/Second Wind/Reset; Snapshot, v9-Kompatibilität, frühe Auszahlung, Tastaturfokus und Platz aller 15 Detailansichten. Bestehende Town-Suite bestätigt Kauf/Reload/exakte Erstattung/fehlschlagende Saves und die zwölf Folgetalente. Sechs relevante Scripts mit Godot MCP script_check gültig. Kein neuer Dauerbenchmark nötig; bestehende begrenzte CE3/CE4-Batches bestanden.

**Aufschlussreiche Korrekturen:** Erster neuer Test griff nach einem Frame auf einen bereits freigegebenen getöteten Gegner zu; Todeszustand direkt beim Treffer erfasst. Phoenix-Erwartung zunächst fälschlich 2 statt vorhandener 3 %; Fixture korrigiert, keine Spielbalance verändert. Renewal-Fixture brauchte echte Welle 1 statt ungestarteter Welle 0. Erste native Baumansicht zeigte zu breite Kleinknoten-Texte; gekürzt. Gezielter Layout-Test entdeckte überlange Kosten-/Statuszeilen vor Kaufknöpfen; redundanten Text entfernt, danach alle 15 Ansichten ohne Überschneidung. Parallele Suiten mit gemeinsamem APPDATA erzeugten MCP-Registry-Lock-/Tempdateiwarnungen trotz erfolgreicher Gameplaychecks; betroffene Suiten mit getrennten APPDATA-Ordnern erneut sauber bestanden. Headless-Editorimport abgeschlossen/UID erzeugt, meldete den bekannten Safe-save-Fehler seiner Editorumgebung; Fortschritts-/Profiltests bestanden, keine Schutzoption verändert.

**Medien / Abnahme / Umfang:** Vier endgültige native D3D12-Screenshots 1152×720 in Progress/captures, visuell geprüft: gemischter Baum mit Renewal, Kindling, Momentum, Stadt. Isoliert gestellte Käufe/270 Echoes, kein menschlicher Run oder Clip. CE5_PLAYTEST.md ermöglicht kurzen manuellen Test in F5 ohne Export. Menschliche Balance, Spürbarkeit/Lesbarkeit unter Kampfdruck, mehrere natürliche Runs und externer Test bleiben offen. Kein GitHub-Push, Export oder Deployment. Diff gegen Auftrag: genau Wurzeleffekte/UI/Tuning/Kompatibilität/Prüfung/Dokumentation; keine weiteren Gameplaypakete. Einzige benannte Erfolgsgrenze: erster Kauf erfordert zwei geklärte Wellen bei leerem Wallet.

**Git:** Spiel lokal als `00e378d` auf `codex/skill-tree-early-progression` committed, gezielt gestagt und staged Diff geprüft; Spiel-Arbeitsbaum sauber. Chronik mit zugehöriger Dokumentation und vier Bildern anschließend separat lokal gesichert. GitHub bleibt unverändert auf CE2.

## 2026-10-19 – CE4: Item Discovery & Synergy Expansion

**Auftrag / positiver Spieltest:** Nutzer hat Fire Fan + Piercing Flame + Overcharge eigenständig kombiniert und als motivierende Entdeckung erlebt. CE4 soll dieses Improvisieren über Items verstärken. Lokalen Follow-up-Stand 335327e und beide sauberen Git-Bäume geprüft; kein Rücksetzen auf älteres GitHub. Vier zusätzliche Items, 5 % Itemchance und Champion-Timing als beauftragte Abweichungen vom bisherigen Scope/Balancing vorab ausgewiesen. Keine neuen Karten, Klassen, Gegner, Slots, Seer-Regeln, Itemlevel, Belohnungswege oder Persistenz. Ponytail-Workflow genutzt.

**Items:** Echo Scepter (Magic): jeder vierte reguläre Angriff ein verzögerter zentraler Schuss, 0,15 s / 60 % normalen Schaden; keine Echo-Rekursion und kein kopierter Overcharge-Bonus/Ladungsverbrauch. Hunter's Scepter (Rare): erster direkter Treffer ohne Bonus, dann je zusätzlichem Treffer +8 % bis +40 % pro Ziel, 3 s Verfall; kein Zieltransfer oder Verteilen des direkten Zielbonus über Flächenschaden. Storm Grimoire (Magic): erster tatsächlicher direkter Treffer versucht einen Blitz auf den nächsten anderen lebenden Gegner, 150 Reichweite / 45 % Projektilschaden; höchstens einmal je regulärem Angriff einschließlich Fächer/Piercing/Echo, kein indirektes Zählen/Ketten. Phoenix Grimoire (Rare): nach 10 direkten Treffern 3 % effektive Max-HP-Heilung, mindestens 4 s Abstand, keine Trefferbank im Cooldown, keine Überheilung/Wiederbelebung. Buchwechsel löscht Teiltreffer, erhält Cooldown gegen Reset-Missbrauch; Run-Neustart setzt sämtliche neuen Zustände zurück.

**Technik / direkte Treffer:** Bestehenden Projektil-Impact weiterverwendet. Nur Hunter berechnet vor dem direkten Treffer seinen zielbezogenen Modifikator. Derselbe tatsächliche Treffer zählt für Overcharge und Phoenix und verbraucht gegebenenfalls die gemeinsame Storm-Freigabe. Ein kleines pro Angriff geteiltes Dictionary statt paralleler Trefferereignisse oder allgemeiner Effekt-Engine. Gear-Kontexte werden je Slotwechsel ungültig, auch bei Zurückwechseln; passende alte Projektile aktivieren entfernte Items nicht erneut. Schwache Zielreferenzen für Hunter, ein ausstehendes Echo statt Queue, 256-Projektil-/512-Visual-Caps bewahrt. Positive Heilung mit grünem Ring/HP-Zahl, Echo violett markiert, Blitz als direkte Verbindung. Inventar/Itemvergleich um aktuelle neue Regeln, Zahlen und bedingte Zustände erweitert, keine garantierte situative DPS vorgespiegelt.

**Loot / Modell:** Chance pro berechtigtem Kill 10 % → 5 %. Rarity-Würfe unverändert; Magic jetzt Swift/Echo/Storm, Rare Focus/Hunter/Phoenix, Normal Ember und Legendary Codex unverändert. Natürliche Codex-Einmalbegrenzung samt Fallthrough bleibt. Neue Items über vorhandenes F1-Dropmenü erreichbar. Standardmodell vollständig geklärter Wellen 5/10/15/20: 61/173/290/407 Kills, erwartet 3,05/8,65/14,50/20,35 Items vor Bodenlimit. Null Items bis 5 ca. 4,38 %, bis 10 ca. 0,014 %. Rund 41 % der Itemwürfe sind neue Typen. Keine Messung typischer menschlicher Runs, keine neuen Garantien; Sammlung/Bodenlimits können tatsächliche Menge drücken. Tabelle und Seltenheitsanteile in CE4_PLAYTEST.md.

**Champion / F1:** Standard-Cooldown 2 s ab Ende der Erholung; mit 0,7/0,4/0,8 s regulär etwa 3,9 s Warnstart zu Warnstart, am Rand früher. Vier Timings über F1, aktuelle Warnung/Route bleibt unverändert. Neue Werte beim nächsten Telegraph, Cooldown erreicht den laufenden Boss. Mit neun Itemwerten 13 neue Felder, insgesamt 87, Profil v9 unterstützt v1–v8 validiert ohne Umschreiben. Gespeicherte alte Itemchance bleibt erhalten; Reset defaults für neue 5 %. Progress weiterhin v2. CE4-Einzel-/Gruppentest mit gewähltem Item wiederverwendet bestehende Seed-42-Anordnung, nur --test-mode. Normale Dropwerkzeuge weiter verfügbar, keine permanente Build-Klasse.

**Echte Prüfung:** Elf Suites unter Godot 4.7.2, isoliertes APPDATA und -- --test-mode: 64 Arena + 54 Loot/Konsole + 50 Inventar + 69 Stadt/Baum + 19 Begegnung + 28 Rarity + 74 Counterplay + 249 Ascent + 128 Card-Synergy + 35 Combat-Polish + 65 Item-Synergy = **835 Checks, 0 Fehler**. Vier zusätzliche Inventarprüfungen entstehen durch neue Icons. Tatsächliche Echo-/Fan-/Piercing-Treffer, sechs direkte Fan/Pierce-Ereignisse, Hunter-Trefferfolge/Zielwechsel/Verfall/Overcharge, eine Storm-Freigabe einschließlich Echo, Miss/Radius, Phoenix-Heilung/Cap/Cooldown/Wechsel/Pause, Tod/Reset, alle acht Itempools, Debuganordnungen, v8-Legacy und live Champion-Timing geprüft. Sechs Gameplay-Scripts via Godot MCP gültig. Kurzer Echo/Storm/Fan/Pierce-Batch: 256 Projektile / 64 Ziele, zuletzt ca. 5,17 ms für einen manuell ausgeführten Batch; kein dauerhafter FPS-Benchmark. Bestehende CE3-Stressprüfung ebenfalls bestanden.

**Medien / Lernpunkte:** Zwei native D3D12-Vorschauen 1152×720 gesichtet und archiviert: ce4_inventory und ce4_effects. Volle Tasche, Ausrüstung und Teilzähler gestellt; Blitz aus tatsächlichem kontrolliertem Projektiltreffer, zusätzlicher Echo-Schuss für Darstellung gestellt, kein menschlicher Run/Clip. Erste Rarity-Regression erwartete das einzige frühere Rare-Item Focus und 0,2 % Legendary/Kill; auf gültigen Rare-Pool beziehungsweise beauftragte 0,1 % angepasst, Kaskadentests unverändert erhalten. Ein früher Blitzaufbau war zwischen dicht stehenden Körpern verdeckt; Gruppe für Vorschau auseinandergestellt. Danach musste der Capture-Aufbau Physik-/Prozesssynchronisation abwarten, damit der manuelle echte Treffer im Physics-Space ankam; Capture prüft jetzt den Blitz ausdrücklich. Alter Rarity-Capture hatte vier feste Positionen: auf acht umgestellt und nativ ausgeführt. Headless-Editor meldete erneut Safe-save-Fehler seiner Umgebung, Import/UID-Erzeugung trotzdem erfolgreich; Spielfortschritts-/Profiltests bestanden, keine Schutzoption deaktiviert.

**Offen / Git:** Mehrere natürliche Runs auf Entdeckung, ausreichende Dropvielfalt, Phoenix-Überleben und fairen Champion-Rhythmus prüfen. Balance, weitere Auflösungen und dauerhafte Performance bleiben offen; Windows-Export/Deployment ausdrücklich nicht durchgeführt. Kein zusätzlicher Scope außerhalb CE4. Spiel-Commit **de56637d9fb801d7e18f80e386344f02145d0129** auf codex/item-discovery-synergies, Spielbaum danach sauber. Masterplan §8.15/9/10, Galerie und englische CE4_PLAYTEST.md aktualisiert; Chronik erhält zugehörigen lokalen Commit. Kein GitHub-Push, Freigabe dafür ausdrücklich weiterhin erforderlich.

---

## 2026-10-19 – CE3 Follow-up: Combat Polish & Build Overview

**Auftrag / Planabgleich:** Nutzer bestätigt mehr Spielspaß und Flexibilität durch CE3 und beauftragt drei konkrete Verbesserungen. Lokaler CE3-Stand 715a344 geprüft und als Basis erhalten; beide Git-Bäume vor Beginn sauber. Der zuvor ausgeschlossene Champion-Ansturm wird durch den neuen Auftrag ausdrücklich freigegeben und im Chat als Abweichung vom bisherigen Plan markiert. Keine neue Karten-/Item-/Gegnerart, kein Seer-Tuning, keine Änderung an Loot, Echoes, Baum oder Persistenz. Ponytail-Workflow weiter genutzt.

**Burst:** Startwerte 105 Radius / 70 % des auslösenden Projektilschadens. Direkte Build-Verstärkungen einschließlich Overcharge skalieren über denselben Schadenswert; First Spark bleibt direkt-only. Sofort sichtbarer orangefarbener Flächenimpuls und heller Rand, vorhandenes Trefferfeedback. Keine rekursiven oder doppelten Explosionen; visuelles Limit unverändert. Bestehende F1-Regler/Profile bleiben, keine Zahlenmigration: gespeicherte Profile behalten alte Werte, Reset defaults stellt neue Startwerte her.

**Champion:** Bestehende Guardian-Logik um kleine Zustandsfolge ergänzt, nur für Bosse 5/15/etc. Nach lebenden und ausstehenden Escorts: 0,7-s-Warnlinie zur festgehaltenen Richtung, bis 0,4 s Ansturm mit 850 Einheiten/s, 0,8 s stationäre Erholung, danach normale langsame Verfolgung und 3 s Cooldown. Maximal 340 Reichweite, gerader Stopp an der Arena-Kante mit skalierter Körpermarge; kein Nachzielen oder Wandgleiten. Kontakt über Bewegungssegment, höchstens ein Versuch pro Rush mit vorhandenem Schaden/Trefferschutz. Warnung/Erholung ohne Kontaktschaden. Rüstung, gewöhnliche Guardians und bestehende Begegnungsbelohnung erhalten. Pause/Freeze/Tod geprüft; fünf charge_*-Inspector-Werte ohne neues F1-Profilformat.

**Inventar:** Ein Fenster mit links festen Equipment-/Taschenfeldern und scrollbaren Vergleichsdetails, rechts tatsächlichen Kampfwerten und scrollbarer Karten-/Effektliste. Stacks, aktuelle Regeln, Burst-Schaden, Overcharge-Ladung/READY, Second-Wind-Dauer und bedingte Talent-Auslöser getrennt benannt. Kein theoretischer DPS-Wert. Itemvergleich nennt gewonnenen/verlorenen Effekt und unverändert aktive Karten/Talente; direkte, Splash-, Burst- und geladene Schäden sowie effektives Intervall verwenden vorhandene Build-Berechnung beziehungsweise gemeinsam mit Combat genutzte Helfer. Aktionsfooter bleibt sichtbar, Maus/Tastaturbedienung und sämtliche Inventaraktionen erhalten. Kein UI-Framework oder neue Persistenz.

**Echte Prüfung:** Godot 4.7.2, isoliertes APPDATA und -- --test-mode: 64 Arena + 54 Loot/Konsole + 46 Inventar + 69 Stadt/Baum + 19 Begegnung + 28 Rarity + 74 Counterplay + 249 Ascent + 128 Card-Synergy + 35 Combat-Polish = **766 Checks, 0 Fehler**. Neue Suite prüft Burst-Grenze/Trefferfeedback, lebende und ausstehende Escorts, Boss 5/15, feste Richtung, Sidestep, Esc/I/F1/Freeze, Kontakt zwischen Frame-Endpunkten, Rüstung/Erholung, Cooldown, Arena-Kante/Tod, gewöhnliche Guardians sowie echte UI-Werte/Stacks/Gearvergleich/Buffs/Scroll/Reset. CE3-Synergie- und Stressprüfungen auf 105/70 aktualisiert, Kettenausschluss weiter geprüft. Vier Gameplay-Scripts via Godot MCP script_check gültig. Progress bleibt v2; F1 v8 mit 74 Feldern.

**Medien / Lernpunkte:** Drei native D3D12-Aufnahmen 1152×720 gesichtet: build_overview, build_effects, champion_charge unter Progress/captures. Karten, voller Bag, Talentschlüssel und temporärer Buff bewusst gestellt; Effektansicht gescrollt. Bosswarnung durch tatsächliche neue Logik gestartet und eingefroren, kein menschlicher Sieg oder Clip. Im ersten Layout verschob Scroll-Fokus die Equipmentüberschrift aus dem Blick; Equipment/Bag danach fest angeordnet und nur Details scrollbar. Ein neuer Scroll-Test setzte den Endwert vor Godots verzögerter Text-Neuberechnung; nach Layoutabschluss geprüft, unterste Effekte erreichbar. Headless-Editor meldete erneut Safe-save-Fehler seiner Umgebungseinstellungen, Import trotzdem erfolgreich und UID erzeugt; Spiel-/Profilspeichertests bestanden, keine Schutzoption deaktiviert.

**Offen / Git:** Menschlich neue Burst-Wirkung/Lesbarkeit, Ansturm-Reichweite gegen Solo-Kiting und Informationsdesign prüfen. Weitere Fenstergrößen, Export und Langzeitperformance bleiben offen. Keine zusätzliche Gameplay-Abweichung vom Follow-up-Auftrag. Spiel-Commit **335327ed7111c208303d1f570e8ff7d07552d8f6** auf codex/combat-polish-build-overview, Spielbaum danach sauber. Masterplan §8.14/9/10, englische COMBAT_POLISH_PLAYTEST.md und Galerie aktualisiert; Chronik erhält zugehörigen lokalen Commit. Kein Push ausgeführt: Freigabe vor GitHub ausdrücklich im Auftrag verlangt.

---

## 2026-10-19 – CE3: Build Discovery & Card Synergies

**Auftrag / Planabgleich:** Separater eingefügter CE3-Auftrag erteilt Umsetzung: überraschende Run-Kombinationen durch sechs Karten und zufällige Angebote. Bestätigte Abweichung vom festen Dreierangebot im Chat ausgewiesen. Wellenzeitpunkte, Bosskarten, Loot, Echoes, Baum und Persistenz unverändert. Keine Freigabe für Champion-Ansturm, neue Gegner/Items oder Verwertung; diese offenen Themen aus §8.12 bleiben geparkt. Ponytail-Workflow genutzt; beide Git-Bäume vor Beginn sauber.

**Karten / Effekte:** Bis zu drei verschiedene gültige Karten mit vorhandenem RNG ohne Build-Gewichtung; Angebote werden bei UI-/Build-Refresh nicht neu gezogen. Ausgeschöpfte und wirkungslose Karten ausgeschlossen, bei leerem Pool Weiterlauf. Neue Karten einmal pro Run wählbar: Ember Burst (direkter Kill, Radius 65, 40 % Projektilschaden, keine indirekten Ketten), Piercing Flame (zwei unterschiedliche direkte Ziele, auch im selben Physikschritt), Overcharge (vier direkte Treffer laden nächsten Hauptschuss, +75 %, normale Seitenschüsse, keine Vorratsstapelung). Bestehendes Splash/Armor/First-Spark-Verhalten bewahrt; Burst+Codex je Ereignis, verstärkter Projektilschaden skaliert abgeleitete Fläche. Ladung über Ring, Hand, READY und Projektil sichtbar. Karten und Ladung resetten zwischen Runs.

**Technik / Debug:** Bestehende Arena/Player/Projectile-Logik gezielt erweitert, keine universelle Effekt-Engine. Drei F1-Werte für Burst-Radius/-Anteil und Overcharge-Bonus, insgesamt 74. Profile v8 lesen v1–v7 validiert ohne Umschreiben. Progress weiterhin v2, keine Save-Migration. Drei CE3-Test-Builds verwenden vorhandene isolierte Seed-42-Gegneranordnung; nur mit --test-mode, keine echten Spielstände. Englische Regeln und Anleitung in CE3_PLAYTEST.md; Kartenzufall reproduzierbar bei gleicher vorheriger RNG-Nutzung. Effektanzeige auf 512 kurzlebige Einträge begrenzt, Schaden wird weiter berechnet; bestehendes 256-Projektil-Cap erhalten.

**Echte Prüfung:** Acht bestehende Suites: 64 Arena + 54 Loot/Konsole + 46 Inventar + 69 Stadt/Baum + 19 Begegnung + 28 Rarity + 74 Counterplay + 249 Ascent = 603; neue Card-Synergy-Suite 128: insgesamt **731 Checks, 0 Fehler** unter Godot 4.7.2, isoliertes APPDATA und -- --test-mode. Neue Tests prüfen Seed-Replay, Angebote/Einzigartigkeit/erschöpfte Auswahl, echte Kartenbuttons, Power/Ember-Burst, Codex/Burst, zweifaches Piercing im selben Schritt und kein Wiederholungstreffer, Seer/Guardian, Overcharge-Haupt-/Seitenschüsse, Nullschaden, Caps, Esc/I/F1, Tod/Reset, Legacy v7 und drei Presets. Bestehende Fixtures erzwingen ihre geprüften Statistik-Karten nun ausdrücklich; eine zukünftige Profilversion ist v9 statt v8. Vier Gameplay-Scripts via Godot MCP script_check gültig.

**Performance / Medien:** Kontrollierter Batch mit 256 Projektilen und 64 Gegnern bei allen Mechaniken bestanden; letzter Lauf ca. 1,21 ms für den manuell ausgeführten Physikbatch. Kein kontinuierlicher FPS-Benchmark und kein menschlicher Run. Zwei native D3D12-Vorschauen 1152×720 gesichtet und unter Progress/captures archiviert: ce3_cards und ce3_combat. Absichtlich gestellte Kartenauswahl, eingefrorene Kampfanordnung und READY, tatsächlicher geladener Hauptschuss über Attack-Pfad. Kein neuer Clip. Galerie und Medienherkunft aktualisiert.

**Lernpunkte / Umfang:** Erste Validierung fand einen lokalen Variablennamenskonflikt im bestehenden F1-Aufbau; umbenannt. Neue Test-Fixture stand zunächst vor Seer-Freigabewelle und erzeugte daher einen Chaser; korrigiert. Guardian-Erwartung musste den 20-%-Mindestschaden für Splash beachten (6 → 1,2, nicht 2); keine Rüstung für den Test verändert. Ein Power-Test zielte vom falschen Spieler-Startpunkt an der Gruppe vorbei; Testposition korrigiert. Headless-Editor meldete einen Safe-save-Fehler für seine Umgebungseinstellungen, beendete Import dennoch erfolgreich; isolierte Spiel-/Profil-Speichertests bestanden, keine Schutzoption deaktiviert. Keine zusätzliche Gameplay-Abweichung vom CE3-Auftrag.

**Offen / Git:** Drei bis fünf natürliche Runs auf tatsächlich unterschiedliche Spielweisen prüfen; Balance, Langzeitperformance, weitere Fenstergrößen und Export offen. Seer-Gewichtung und Champion allein bleiben separate Aufgaben. Spiel-Commit **715a3443cf6a434d383bbc7ddfdbf7fdb87bf733** auf codex/build-discovery-card-synergies, Spielbaum danach sauber. Chronik erhält zugehörigen lokalen Checkpoint. Kein neuer GitHub-Push beauftragt oder ausgeführt; GitHub-Spiel-main bleibt CE2 3ccb604.

---

## 2026-10-19 – CE2 auf GitHub und Spieltestfeedback für die weitere Planung

**Auftrag / Änderung:** Nutzer beauftragt Commit und Upload des aktuellen Stands beider Repositories, damit ChatGPT auf GitHub mitplanen kann. CE2-Spiel-Commit `f6d1be7` um die nachträglich vom Editor erzeugte Script-UID der Ascent-Tests ergänzt: `3ccb604`. Spiel-main per Fast-forward aktualisiert und beide Branches main / codex/ascent-boss-milestones gepusht. Keine Gameplay-Änderung, keine Caches, Spielstände oder lokalen Zugangskonfigurationen aufgenommen.

**Planung:** Masterplan §8.12 bündelt die jüngsten Nutzerbeobachtungen: Seer zu wenig relevant für Schnellfeuer, gezieltes Maus-Aiming ohne Änderungswunsch, motivierender Gearwechsel mit Risiko einer festen Routine, Champion allein zu leicht und Bewegungsgeschwindigkeit als offene Idee. Keine neue Mechanik beschlossen oder implementiert. §§9/10 aktualisiert; kein sichtbarer Meilenstein und keine neue Aufnahme.

**Prüfung / Grenzen:** Beide Repository-Zustände geprüft, neue UID mit bestehender UID-Konvention verglichen, staged Diff und Whitespace geprüft. Spiel-Push erfolgreich; abschließender Remote-Hash-Abgleich beider main-Branches nach Chronik-Push. Keine neuen Gameplay-Tests; letzter technischer Stand bleibt 603 bestandene Checks. Spielbalance bleibt nach dem Nutzerfeedback offen. Keine automatische Synchronisierung eingerichtet.

---

## 2026-10-19 – CE2: Ascent & Boss Milestones

**Auftrag / Planabgleich:** Separater eingefügter CE2-Auftrag erteilt die Umsetzung und ersetzt den erwähnten CE2A-Entwurf. Bestätigte Abweichungen: regulärer Sechs-Wellen-Sieg entfällt, Karten wiederholen sich, Bosse alle fünf Wellen, neue Echoes-Kurve nach Welle 6. Ziel 15–20 Minuten als Hypothese, kein Zeitlimit. Scope bewahrt: vorhandene drei Karten und Gegnermechaniken, kein neuer Skill, keine Klasse, Währung, Verwertung oder neue Boss-KI. Ponytail-Workflow genutzt. Zwei Git-Bäume vor Beginn sauber; kein neuer Push beauftragt.

**Ablauf / Bosse:** Aufstieg bis Tod oder technischer, einstellbarer Sicherheitsgrenze 100; ausdrücklich kein Spielsieg. Karte nach jeder Stufe 2/4/5 im Fünferblock. Champion nutzt Guardian bei 5/15/etc., Prophet nutzt Seer bei 10/20/etc. Zwei Sekunden Vorankündigung, größerer Körper/Krone, goldener eigener HP-Balken. Ein Boss plus vier Escorts im gleichen Gesamtcap, Abschluss erst wenn Budget und alle Gegner weg sind. Pflichtboss auch bei normalem Rollen-Cap 0; Gesamtcap 1 bleibt lösbar. Champion 6×, Prophet 9× bestehendes Rollenleben; Angriff 1,5× Wellenwert, Prophet größerer aber weiterhin korrekt angezeigter Welt-Trefferradius. Nach Unterbrechung nächster Boss-Cast als STEADY CAST geschützt, weiterhin ausweichbar. Keine zusätzlichen Boss-Auszahlungen/garantierten Drops.

**Skalierung / Grenzen:** Normalbudget maximal 28 statt endloser Warteschlange; HP ab Welle 7 ×1,14 je Welle, Schaden +4 % je Welle, Spawnintervalle ×0,97 bis Minimum 0,18 s. Häufigere Rollen-Kandidaten je Zehnerblock unter bestehenden Caps. Wellen 6/11/16/etc. Erholungsfaktor 0,8 und seltenerer Rollenmix, doppelte Pause nach Boss. HP maximal 1.000.000, Schaden/Geschwindigkeit maximal 200. Effektives Feuerintervall mindestens 0,08 s auch mit Second Wind, maximal neun Projektile/Cast und 256 lebende Projektile. Gesättigte Quick-/Fan-Karten deaktiviert, Power verfügbar.

**Echoes / Kompatibilität:** Bis 6 unverändert; danach +25, +27, +29 usw., ergibt 322/507/742 bei 10/15/20. Auszahlung weiterhin einmalig sicher am Run-Ende, nur abgeschlossene Wellen; Wallet/Bestwelle/Talentledger unverändert Progress v2. Der vorhandene Bestwellenbereich bis 100 passt zur Sicherheitsgrenze. Profile v7 mit 71 Werten akzeptieren v1–v6 vorab validiert, mit Startup-Defaults für neue acht Felder. Alte Wellenlimits bleiben numerisch erhalten und sind jetzt Sicherheitsstopps; Ladehinweis erklärt Reset defaults. Inventar/Items/Karten resetten, Echoes/Talente bleiben, erneuter Start ab 1. Bestehender 1080-Echoes-Baum bewusst nicht neu bepreist.

**Zeit / Debug:** Wall-Zeit über monotone Uhr einschließlich Karten, Inventar, Pause/F1, endet am Ergebnis; aktive Zeit separat. Laufende Combatzeit und letzte fünf abgeschlossene Wellen mit HP-Verlust/Rollenmix in F1. Nur temporäre Run-Aufzeichnungen. Isolierter Wave-Jump über bestehenden F1-Tools-Tab setzt Testrun mit Seed 42 zurück und vergibt keine Belohnung für übersprungene Wellen. Anleitung mit Wellen 1–20 und Protokolltabelle: englisches `CE2_PLAYTEST.md` im Spielprojekt.

**Echte Prüfung:** Acht Suites seriell unter Godot 4.7.2, isoliertes APPDATA und `-- --test-mode`: 64 Arena + 54 Loot/Konsole + 46 Inventar + 69 Stadt/Baum + 19 Begegnung + 28 Rarity + 74 Counterplay + 249 Ascent = **603 Checks, 0 Fehler**. Vollständiger beschleunigter Ablauf 1–20, Bosse bei 5/10/15/20, Kartenfolge/Stale-Clicks, ausstehende Escorts, Cap 1/0, Boss-Schutzcast/Ausweichen, Pause/Inventar/F1, Echoes/Persistenz/Town/Restart, alle 100 Skalierungsstufen und maximale Reglerwerte, Upgrade-/Projektilgrenzen und Legacy-v6-Profil geprüft. Sechs geänderte Gameplay-Scripts via MCP gültig. Technische Simulation ist kein überlebter menschlicher Run.

**Unterbrechungsvergleich:** Echte Projektile der drei CE1-Profile Rapid/Heavy/Area bei 3/4/5 Treffern: Bei 3 und im kontrollierten Timing bei 4 unterbrechen alle drei; bei 5 nur Rapid. Vier ist eine Timinggrenze, keine garantierte Spielregel. Neuer Default 3 gemäß Auftrag übernommen; Soft-Counter wird dadurch erkennbar schwächer. Keine zusätzlichen Stats als Scheinlösung eingeführt.

**Lernpunkte / Korrekturen:** Historische Tests nahmen 108 Kills, genau zwei Karten und Sieg nach 6 an; Fixtures auf wiederkehrende Boss-/Kartenbudgets angepasst, bestehende Inventar-/Baumprüfungen erhalten. Neuer Abschlussguard verlangt tatsächlich leeres Budget/Arena und verhindert doppelte Wellenabschlüsse. Ein Test setzte versehentlich einen Seer-Cooldown auf einem Guardian; Fixture korrigiert. Der Editor meldete trotz frischer bestandener Engine-Läufe einen gecachten fehlenden Basisklassenbezeichner boss_name. Gezielte neue MCP-Refresh-Tools waren nach Aktivierung nicht callable; identischen Basisscript-Inhalt über vorhandenes script_write indexiert, danach abhängige Scripts gültig. Kein Addon verändert. Prophet-Warnkreis musste Figurenskalierung ausgleichen; native Vorschau kontrolliert.

**Medien / offen / Git:** Vier native D3D12-Vorschauen, 1152×720, gesichtet: `2026-10-19_ce2_intro.png`, `_champion.png`, `_prophet.png`, `_reward.png`. Eingefrorene gestellte Testbegegnungen, Prophet-Schutzcast gestellt, Bosskartenansicht durch bereinigte Fixture erzeugt; kein menschlicher Playthrough/Clip oder 15–20-Minuten-Test. Dauer, Spannung statt Zähigkeit, konkrete Todesursachen, Langzeitperformance und Baumtempo offen. Spiel-Commit `f6d1be7b12413ac50616a818a9ddebbe5a6e06ce` auf `codex/ascent-boss-milestones`, Spielbaum danach sauber. Zugehöriger Chronik-Checkpoint enthält diese Dokumentation/Medien. GitHub bleibt bis separater Freigabe unverändert.

---

## 2026-10-18 – Spiel und Chronik mit GitHub verbunden

**Auftrag:** Nutzer wünscht öffentliche GitHub-Repositories für Spiel und Chronik. Kontoname nach Klärung `karlospeter464-hub`; Geräteanmeldung durch Nutzer selbst bei GitHub bestätigt. Beide Repositories über authentifizierte GitHub-API neu öffentlich angelegt: `lootfall-2.0` und `lootfall-2.0-devlog`. Keine Zugangsdaten in Dateien oder Protokolle übernommen.

**Prüfung / Veröffentlichung:** Vor Upload beide Arbeitsverzeichnisse sauber, keine bisherigen Remotes. Historische versionierte Pfade auf private Konfigurationen geprüft; 399 Spiel-Blobs und 70 Chronik-Blobs samt zwei ZIP-Sicherungen auf ausgewählte Zugangsdatenmuster geprüft, ohne Treffer. Das ist keine vollständige Geheimnis-/Medienprüfung. Spiel-README um Repository-Links ergänzt, Commit `4c4f917753ecb7f216d03cc9250447eddf290f1a`. Spiel nach `origin/main` und `origin/codex/counterplay-feedback` gepusht; remote Commit-IDs stimmen exakt überein. Chronik veröffentlicht diesen begleitenden Checkpoint auf `main`; abschließender Remote-Abgleich erfolgt nach Push.

**Umfang:** Vorhandene Git-Historie und versionierte Chronikmedien veröffentlicht; ignorierte Spielstände, Caches und lokale Codex-/MCP-Konfigurationen ausgeschlossen. Keine Gameplay-Änderungen, keine neuen Spieltests oder Aufnahmen. Letzter Gameplay-Teststand bleibt 349 Checks. Lokale Repositories/Projektpfade unverändert. Keine automatische Synchronisierung oder pauschale Freigabe künftiger Pushes eingerichtet.

---

## 2026-10-18 – CE1-Spieltest: Unterbrechung zugänglich, Rüstung sichtbar

**Grund / Auftrag:** Nutzer bestätigt Guardian-Spielspaß, vermisst aber erkennbare Build-Wechselwirkungen. Seer sterben zu früh oder sind zu schwer häufig zu treffen. Zwei zähere Guardians und Zahlen für abgefangenen Schaden gewünscht. Umsetzung als Abstimmung von CE1 (Masterplan 8.10), ohne weitere Kampfstatistik oder neues Schild-HP-System. Ponytail-Workflow weiter angewandt.

**Änderung:** Guardian-Cap 2 statt 1, alle sechs statt acht Spawnkandidaten, Leben 6× statt 4× Wellenbasis. Gesamtcap 12 erhalten. Seer-Leben 6× statt 3×, Vorbereitungsfenster 1,4 statt 1,1 s, Erholung 2 statt 2,8 s; Start-Cooldown 0,35 statt 1 s, bevorzugter Abstand 210 statt 280. Fünf direkte Treffer bleiben erforderlich; Splash bleibt ausgeschlossen. Das soll Swift + eine Quick-Karte bereits nach erster Kartenauswahl nutzbar machen. Sichtbares INTERRUPT n/5 plus längeres BROKEN. Weitere Angriffstasten, Karten und Items unverändert.

**Rüstungsfeedback:** Guardian meldet den tatsächlich absorbierten Betrag nach Mindestschadenberechnung. Gesonderte blaue BLOCKED-Zahl und Schildkontur, echte HP-Schadenszahl daneben mit Zehnteln statt Aufrunden. 14 → 6 + 8 blocked; 4 → 0,8 + 3,2 blocked. Kein zusätzlicher Schaden, kein falscher voller Rüstungsabzug bei Floor/Overkill, keine Änderung an Metriken oder Loot. Dead-/Null-/Negativtreffer ohne Feedback. 63 F1-Werte, Profile v6 und Legacy-Validierung erhalten; alte geladene Werte bleiben bewusst erhalten, Reset defaults stellt neue Startwerte her.

**Echte Prüfung:** Sieben Suites seriell, isoliertes APPDATA und `-- --test-mode`: 59 + 54 + 46 + 69 + 19 + 28 + 74 = **349 Checks, 0 Fehler**. Neue Assertions für absorbierten Anteil, Minimum, Nulltreffer, Metriktrennung und frühes Schnellfeuer; natürliche zwei-Guardian-Cap unter Gesamtlimit geprüft. Echtprojektile im neuen Fenster gegen 204 HP: Rapid sieben Treffer / ein Interrupt / 106 HP; Swift + nur eine Quick sechs Treffer / ein Interrupt / 120 HP; Heavy vier Treffer / kein Interrupt / 42,16 HP; Standard vier Treffer / kein Interrupt / 148 HP. Vier geänderte Gameplay-Scripts via MCP gültig. Native D3D12-Vorschau 1152×720 gesichtet; keine menschliche Matchup-Abnahme.

**Aufnahme / Lernpunkt:** `Progress/captures/2026-10-18_ce1_feedback.png` zeigt zwei Guardians mit echten inszenierten 14-Schadens-Testtreffern sowie gestellten Seer-Konzentrations-/BROKEN-Zuständen. Im ersten Capture fehlten Zahlen, weil der eingefrorene Preview-Aufbau nach Signaländerungen keinen neuen Arena-Draw anforderte. Capture fordert jetzt einmal queue_redraw an; native Neuaufnahme zeigt 6.0 und 8.0 BLOCKED. Keine reale Gameplay-Aufnahme oder neuer Clip; alte Aufnahmen erhalten.

**Offen / Git:** Menschlich prüfen, ob Unterbrechung unter Nahkämpferdruck gelingt, die Schildzahlen lesbar bleiben und mehr Leben nicht nur den Run verlangsamt. Keine Verwertung, neuen Belohnungen, Itemlevel oder Save-Änderungen. Die zwei nachträglich vom Godot-Editor erzeugten UID-Dateien des initialen CE1-Pakets mit übernommen. Spiel-Commit `ce3744d00eaa3279ce7ae0e9397c76fd18dc1303` auf `codex/counterplay-feedback`, Spielbaum danach sauber.

---

## 2026-10-18 – CE1: Combat Counterplay

**Freigabe / Planabgleich:** Separater eingefügter CE1-Auftrag erteilt die ausdrückliche Umsetzung. Nutzerfassung des Masterplans 1.1 aus Downloads als aktuelle Konzeptbasis übernommen, einschließlich Nordstern/Soft-Counter und 8.9; eingebetteter historischer Startauftrag nicht ausgeführt. Vorhandene eigene Planungsnotizen aus 8.8 bleiben enthalten. Enger Scope: Guardian, Seer-Unterbrechung, vorhandene Builds und einfache Testbarkeit. Verwertung/Itemlevel geparkt.

**Ist-Stand und Begründung:** Standard 0,36 s; Swift und zwei Quick-Karten 0,18432 s ohne Flow. Fünf direkte Treffer können das 1,1-s-Fenster unterscheiden, aber der alte Seer stirbt vor Treffer fünf. Daher konfigurierbares dreifaches Seer-Leben als transparenter CE1-Testwert; keine neue Fähigkeit und kein erfundener Unterbrechungsbonus.

**Umsetzung:** Guardian verwendet den bestehenden Nahkampf, ab Welle 3 jeder achte Kandidat, maximal einer lebend im Gesamtcap, 4× HP und 55 % Geschwindigkeit. Flache Rüstung 8 mit 20-%-Minimum pro positivem Direkttreffer oder Splash; kein Primärziel-Doppelsplash. Direkte Projektile benutzen einen kleinen eigenen Trefferaufruf; Splash bleibt normaler Schaden. Fünfter direkter Treffer während Seer-Warnung cancelt einmalig und setzt volle Erholung, Trefferpunkte und BROKEN visualisieren den Zustand. Trefferzahl 0 deaktiviert; neue Warnung/Tod räumen den Zustand auf. Pause/Freeze bleiben erhalten.

**Debug / Kompatibilität:** Neun neue F1-Gegnerwerte, insgesamt 63. Profile v6 akzeptieren v1–v5 validiert und ohne Umschreiben; neue Werte erhalten Startup-Defaults. Fortschrittsformat unverändert. F1-Testauswahl kombiniert drei vorhandene Builds mit drei Gegnerarrangements; nur `--test-mode`, Run-Neustart mit Seed 42, ohne aktive Talente oder Änderung am gespeicherten Besitz. Bestehendes Tuning, Budget und Caps bleiben wirksam. Normale Wellen laufen nach dem isolierten Encounter weiter. Debug-Defeat berücksichtigt die tatsächlich gespawnte Guardian-Rüstung, auch nach späterer Regleränderung.

**Echte Prüfung:** Alle sieben Suites seriell mit isoliertem APPDATA und `-- --test-mode`: 59 Arena + 54 Loot/Konsole + 46 Inventar + 69 Stadt/Baum + 19 Begegnungen + 28 Rarity + 67 Counterplay = **342 Checks, 0 Fehler**. Neue Suite prüft direkte/Splash-Rüstung und Minimum, Nonpositivschaden, Gruppen-Splash, Unterbrechungsfenster/Counter/Recovery, Pause/Freeze/Tod/Run-Neustart, frühe/späte Wellen, Rollen-/Gesamtcaps, v5/v6-Profile und alle neun Arrangements. Echte Player-Cooldowns und gesweepte Projektile: Rapid unterbricht lebenden Seer bei fünf Treffern/32 Rest-HP, Heavy tötet mit drei Treffern; Standard unterbricht nicht. Sechs Gameplay-Scripts via Godot MCP `script_check` ohne Diagnosen. Zwei native D3D12-Vorschauen (1152×720) gesichtet: Guardian/Seer-Trefferpunkte und F1-Testauswahl. Kein menschlicher Durchlauf und kein neuer Clip.

**Aufschlussreiche Fehlversuche:** Ein kurz verwendeter `in`-Versionsvergleich lehnte aus JSON gelesene numerische Legacy-Versionen ab; durch bestehende explizite numerische Vergleiche ersetzt, Legacy-Suite danach bestanden. Erstes Testarrangement wollte nach verbrauchtem Budget einen Guardian spawnen und hielt anschließend eine Chaser-Referenz; Fixture korrigiert. Ein Heavy-Projektiltest griff nach erfolgreichem Kill auf den freigegebenen Seer zu; Test beendet nun bei Tod. Kein Gameplay-Workaround für Testfehler.

**Umfang / offen:** Kein neuer Spielerangriff, Gear, Armor Penetration, Statussystem oder Änderung an Karten, Inventar, Loot, Echoes, Hideout, Run-Länge und Persistenz. Soft-Counter, Lesbarkeit, ungünstige Matchups und Build-Dominanz erfordern menschliche Spieltests; Kostenkurve/Langzeitbalance weiterhin offen. Spiel-Commit `da58b4327e7ba82a5035d1ad7c3cf8503e41fe7c` auf `codex/combat-counterplay`; Spielbaum danach sauber. Chronik-Checkpoint enthält auch die zuvor noch uncommitteten eigenen Verwertungs-/Recherche-Notizen; keine privaten Chat-Transkripte aufgenommen.

---

## 2026-10-18 – Standortbestimmung, Verwertungsentwurf und Wyatt-Cheng-Recherche

**Auftrag / Feedback:** Nutzer bewertet Fernkämpfer und Seltenheiten positiv, wünscht statt ersatzloser Vernichtung Echoes abhängig von Seltenheit und später eventuell Itemlevel. Jetzt Fazit, Planabgleich und weitere recherchierte Entwicklertipps; keine Gameplay-Implementierung.

**Planung:** Masterplan 8.8 hält die gewünschte Richtung fest. Direkter Item-Ertrag ausdrücklich als Abweichung vom bisherigen wellenbasierten Echoes-Modell markiert. 1/2/4/10 Echoes und vorgemerkte Auszahlung am Run-Ende sind Vorschläge. Timing, App-Schließen und Restitems offen. Keine automatische Verwertung, Itemlevel-Implementierung oder neue XP-Fortschrittsregel beschlossen.

**Recherche:** Veröffentlichte GDC-Transkripte und direktes Diablo-Interview von Wyatt Cheng gelesen; Quellen und eigene Lootfall-Ableitungen in `WYATT_CHENG_NOTES.md` getrennt. Besonders relevant: ausgelöstes statt beabsichtigtes Spielverhalten, buildabhängige ideale Items, frühe Spieltests und verlässliche Kontrolle. Das konkrete Kaskaden-Short weiter nicht identifiziert.

**Prüfung / Umfang:** Vorhandenen Masterplan und Repository-Status geprüft, keine Gameplay-Dateien geändert. Keine neuen Spieltests oder Aufnahmen; zuvor dokumentierte 275 Checks bleiben der letzte technische Teststand. Galerie unverändert, da kein sichtbarer Spielmeilenstein. Neue Zahlen sind ungetestete Balancing-Hypothesen.

---

## 2026-10-18 – Rarity-Kaskade nach separatem Itemwurf

**Freigabe / Planabgleich:** Nutzer beantwortet beide Produktfragen: Seltenheitsprozente pro erfolgreichem Itemdrop, Lootmenge separat; feste Itemtypen pro Stufe statt Qualitätsvarianten. Die bestätigte Erweiterung ersetzt die alte separate Codex-/Dreierpool-Regel. Keine neuen Itemeffekte, Ressourcen, Affixe, Auto-Vernichtung oder Persistenzänderungen. Grundwerte als in F1 veränderbare Startwerte im Chat ausgewiesen.

**Ablauf:** Berechtigter Kill → 10 % Itemchance → eigener Legendary-Wurf 2 % → bei Fehlschlag Rare 25 % → bei Fehlschlag Magic 50 % → Normal als Rest → Item aus passendem Pool. Erster verfügbarer Erfolg beendet die Kaskade. Normal Ember Scepter weiß, Magic Swift Scepter blau, Rare Focus Grimoire gold, Legendary Cinder Codex orange. Seltenheit in Icons, Bodenname/Glühen, Taschen-/Equipmenttext sowie ausgewähltem Item als ausgeschriebene Stufe sichtbar. Boden zeigt weiter nur den Namen. Itemeffekte unverändert.

**Wahrscheinlichkeiten / bewahrte Regeln:** Vor dem Codex Anteile pro Item 2 / 24,5 / 36,75 / 36,75 %, je Kill bei 10 % Itemchance 0,2 / 2,45 / 3,675 / 3,675 %. Bestehendes Limit eines natürlichen Codex pro Run bewahrt: ausgeschöpfter Legendary-Pool fällt zur Rare-Prüfung durch, dann 0 / 25 / 37,5 / 37,5 % je Item. Debug-Drops bleiben gezielt möglich. Groundcap 16, kein Aufheben bei voller Tasche, Run-Reset, Karten und Echoes unverändert. Neuer Codex ist seltener als zuvor; bewusste Folge des bestätigten Per-Item-Modells, noch kein abgenommenes Balancing.

**F1 / Profile:** Jetzt 54 Felder, Gesamt-Itemchance getrennt von drei Rarity-Würfen, Normal implizit als Rest. Metriken berechnen effektive Anteile pro Item und Chancen pro berechtigtem Kill für den aktuellen Codex-Pool. Profile v5 lesen v1–v4; alte Zahlen bleiben erhalten und neue Felder erhalten Startup-Defaults. Ein sichtbarer Status erklärt, dass Loot/Codex-Werte nun Per-Item-Kaskadenregeln verwenden. Kein stiller Anspruch, das frühere Dropverhalten durch Laden alter Zahlen wiederherzustellen. Wallet und gespeicherter Skilltree unverändert.

**Echte Prüfung:** Godot 4.7.2, isoliertes APPDATA, zwingend `--test-mode`: Arena 59 + Loot/Konsole 54 + Inventar 46 + Stadt/Baum 69 + Begegnung 19 + Rarity 28 = **275 Checks / 0 Fehler**. Neue Suite prüft vorgegebene Zufallsfolgen/Abbruch nach erster erfolgreicher Stufe, 0-/100-%-Grenzen, 100.000 Ziehungen mit festem Seed gegen berechnete Häufigkeiten, reale Dropchance/Groundcap/Codex-Verfügbarkeit, inaktive Tasche, unveränderte Itemwirkung und v4-Profil-Roundtrip/Validierung. Fünf geänderte Gameplay-Scripts und neue Suite via Godot MCP ohne Diagnosen validiert. Kein menschlicher Run als bestanden behauptet.

**Aufschlussreicher Fehlstart:** Der erste Rarity-Test versuchte eine native RNG-Methode zu überschreiben; Godot behandelt das als Fehler. Durch einen kleinen skriptbasierten Test-RNG ersetzt, sodass Reihenfolge und Endpunkte exakt geprüft werden können. Während parallel laufender alter Suites meldete das MCP-Addon einmal einen Registry-Tempdatei-Konflikt im isolierten Testordner; Spielprüfungen bestanden trotzdem. Betroffene Begegnungssuite anschließend allein ohne Warnung erneut bestanden. Keine Änderung am Addon oder an normalen Nutzersaves.

**Medien / Git:** Drei native D3D12-Vorschauen, 1152 × 720, gesichtet: `Progress/captures/2026-10-18_rarity_inventory.png`, `2026-10-18_rarity_ground.png`, `2026-10-18_rarity_metrics.png`. Inventar/alle vier Bodenfunde sind inszenierte Testitems, keine zufällig erspielten Legendary-Funde. Metrikenaufnahme zeigt berechnete Raten, die kurze Aufnahme-FPS ist kein Benchmark. Kein neuer Clip. Spiel-Commit `5caea96b3393780ba1b616189a493e22979d0b44` auf `codex/rarity-cascade`; Spielbaum nach Commit sauber. Chronik referenziert diesen Stand, kein Upload.

**Offen:** Menschlich prüfen, ob 10 % Lootmenge und die erheblich seltenere Codex-Begegnung für sechs Wellen passen. Derzeit genau ein Itemtyp je Stufe; künftige zusätzliche Legendaries benötigen auch eine allgemeinere Pool-Verfügbarkeitsberechnung der Metriken (im Code als shortcut markiert). Keine Qualitätsvarianten und keine neue Inhaltsmenge aus Rarity allein ableiten.

---

## 2026-10-18 – Cinder Seer und Platz in der Tasche; Rarity-Kaskade angefragt

**Auftrag / Abgrenzung:** Nutzer bestätigt das vorgeschlagene Begegnungs-/Entsorgungspaket und ergänzt kaskadierende Seltenheitswürfe. Fernkampfrolle und manueller Destroy-Button sind unabhängig umgesetzt. Vor der Seltenheitsänderung Rückfragen zur Bezugsgröße (pro Kill oder erfolgreichem Itemdrop) sowie festen Seltenheitspools versus Qualitätsvarianten gestellt. Noch keine Antworten, daher bisherige Dropregeln bewahrt. Automatisches Löschen bleibt aus; Varianten könnten trotz gleichen Namens verschieden wertvoll sein.

**Umsetzung:** Cinder Seer als zweite Gegnerrolle ab Welle 2. Jede vierte Spawnposition kann bei freiem Cap ein Seer sein; maximal zwei, Gesamtcap als erster Balancingwert von 18 auf 12 reduziert. Wellenbudgets, Kartenereignisse und Echoes-Regeln unverändert. Seer hält Abstand, markiert die aktuelle Spielerposition fest, warnt 1,1 s und trifft danach einmal Radius 38 mit normalem Gegnerschaden; Erholung 2,8 s. Ausweichen oder vorheriges Ausschalten verhindert den Treffer. Inventar/Pause/F1-Freeze stoppen den Timer. Keine neue Angriffstaste, Klasse oder zusätzliche aktive Spielerfähigkeit.

**Entsorgung / Debug:** Destroy selected im pausierten Inventar entfernt einen ausgewählten Taschenfund ohne Bodenitem oder Währung; ausgerüstete Slots sind geschützt. Fünf Schaltflächen passen nach Größenanpassung in die bestehende Ansicht. F1 jetzt 52 Regler einschließlich Seer-Cap/Warnzeit/Erholung/Radius, neue Profile v4; alte v1/v2/v3-Profile behalten Werte und bekommen Defaults für neue Felder. Bestehende Gegner werden durch Regler nicht gelöscht/verändert, neue Spawns übernehmen neue Werte.

**Prüfung:** Isoliertes APPDATA und `--test-mode`, Godot 4.7.2: Arena 59 + Loot/Konsole 54 + Inventar 46 + Stadt/Baum 69 + Begegnung/Entsorgung 19 = 247 Checks / 0 Fehler. Neuer Test prüft reale Physik-Timer, feste Zielposition, Ausweichen, Einzeltreffer/Erholung, Abbruch beim Tod, Pause/Freeze, volle Tasche → Destroy → wartenden Fund aufnehmen, kein Währungsgewinn, Slot-/Index-/Zustandsschutz und v3-Profilmigration ohne Quelldatei-Umschreibung. Zufallsdrops im neuen Test ausgeschaltet, damit der Kill keine flüchtigen zusätzlichen Testitems erzeugt. Vier Gameplay-Scripts und neue Suite via Godot MCP validiert, keine Diagnosen. Noch kein menschlicher Test der neuen Begegnungen.

**Medien / Git:** Zwei native D3D12-Vorschauen gesichtet: `Progress/captures/2026-10-18_encounter_v01.png` (inszenierte gemischte Welle mit festgehaltenen Warnkreisen) und `2026-10-18_destroy_v01.png` (Inventar mit Destroy selected), jeweils 1152 × 720. Kein neuer Clip. Spiel-Commit `78dcaaff214fc4e22d394859385885de17c4f4b6` auf `codex/encounters-disposal`. Bestehende Planungsänderungen und neue Medien im begleitenden Chronikstand erhalten.

**Rarity-Plan:** Legendary zuerst, nur bei Fehlschlag Rare, dann Magic/Normal, beim ersten Erfolg stoppen. 2 % / beispielsweise 25 % sind keine gleichzeitigen absoluten Dropanteile: Rare effektiv 24,5 % je Kaskadenversuch. Magic/Normal, Gesamtlootmenge, Qualitätsmodell und Behandlung des bisherigen einmaligen Codex bleiben abzugrenzen. Candlesan als Wyatt Cheng über sein Eigenprofil mit YouTube-Verweis identifiziert (https://x.com/candlesan/with_replies); konkretes Kaskaden-Video nicht gefunden und keine WoW-Algorithmusbehauptung daraus gemacht. Keine Seltenheiten nur farblich vorgetäuscht.

---

## 2026-10-17 – P2-Spieltest: tragender Loop, fehlende Kampftiefe und Loot-Stau

**Nutzerfeedback:** Spielspaß und Nutzung des Skilltrees funktionieren gut; der Kreislauf wirkt interessanter. Sorge bezüglich der langfristigen Richtung: immer mehr Gegner und immer schnelleres Schießen könnten in eine bekannte, oberflächliche Eskalation münden. Gewünscht sind mehr Tiefe und eigene Identität. Zusätzlich sammeln sich unerwünschte Items am Boden und in der vollen Tasche; Vernichten oder eine andere sinnvolle Entsorgung gewünscht. Dies ist keine Rücknahme des bestätigten Skilltrees.

**Codebefund:** Aktuell ein Gegnertyp, der direkt verfolgt und bei Kontakt schadet. Wellen unterscheiden sich hauptsächlich durch Menge/Werte. Alle vier Itemtypen haben feste Werte; identische regelmäßige Drops bleiben möglich. Ablegen erzeugt denselben Gegenstand erneut am Boden, löst also den Stau nicht.

**Planung, noch keine Umsetzung:** Nächster sinnvoller Test wäre gemischter Gegnerdruck mit einer neuen klar angekündigten Fernkampfrolle bei begrenzter gleichzeitiger Gegnerzahl. Erfolgskriterium: Zielpriorität und Positionierung ändern sich schon bei wenigen Gegnern; Magierangriff/Karten/Baum bleiben. Später kommen Räume/Ziele als mögliche weitere Tiefe infrage, aber nicht automatisch im selben Paket. Für Loot: Destroy selected ohne zusätzliche Währung als kleiner erster Schritt; eine optionale automatische Entsorgung exakt identischer Dubletten wäre gesondert zu bestätigen. Keine zufälligen Affixe, Crafting oder zusätzlichen Echoes für Itemvernichtung beschlossen.

**Prüfung / Grenze:** Git-Zustände, Gegner-, Drop- und Inventarcode sowie aktuellen Masterplan gelesen. Nur Feedback/Planung dokumentiert; keine Gameplay-Änderung, neuen Tests oder Aufnahmen. Kein neues Paket aus dem Feedback allein als freigegeben behandelt.

---

## 2026-10-17 – P2: Run → Emberhaven → Skilltree → nächster Run

**Auftrag / Planabgleich:** Nutzer bestätigt das konkret vorgeschlagene Paket: Stadtmenü, 15 verbundene Knoten mit Power/Vitality/Flow und drei Abschlussboni, vollständiger Ausbau, kostenloser Reset, F1-Regler und Bodenloot nur mit Namen. Bezug Masterplan Loop C/P2, Details jetzt in Abschnitt 8.5. Bestätigte Scope-Erweiterung gegenüber dem ursprünglichen P2-Minimum zweier Verbesserungsreihen; keine weitere Gameplay-Abweichung im Paket. Klassenwahl und Item-Persistenz bleiben separat.

**Loop geschlossen:** App startet im Stadtmenü Emberhaven. Start Run beginnt den Magier-Run; nach Tod/Sieg erhält man unverändert einmalig Echoes für abgeschlossene Wellen. Return to Town räumt den beendeten Run auf und führt zum Baum/erneuten Start. Karten, Tasche und Equipment werden zurückgesetzt, Wallet/Bestwelle/Talente bleiben gespeichert. Ein fehlgeschlagener Payout blockiert weiter die Rückkehr bis zum erfolgreichen Speichern. Stadt erzeugt keine eigene Auszahlung und ist keine begehbare Karte.

**Baum / Startwerte:** Pro Ast drei kleine Knoten, ein stärkeres Zwischenziel und ein Abschlussbonus. Power: je +4 % Schaden, Zwischenziel +8 %, First Spark +35 % direkter Schaden gegen unversehrte Gegner. Vitality: je +5 % Maximalleben, Zwischenziel +10 %, Renewal einmal je abgeschlossener Welle 6 % Maximalleben heilen. Flow: je 3 % kürzeres Intervall, Zwischenziel 5 %, Second Wind nach nichttödlichem Lebensverlust weitere 20 % kürzeres Intervall für 3 s; erneuert Dauer, stapelt nicht. Querverbindungen erlauben Wechsel von Ast II zu benachbartem Ast III. Jede ausgewiesene Vorgänger-Verbindung genügt. Preise je Tiefe 30/45/65/90/130, Gesamtpreis aller 15 Knoten 1080 Echoes.

**Gemeinsame Berechnung:** Grundwertboni eines Asts addieren sich, wirken anschließend mit Karten und Gear multiplikativ. Vollausbau +20 % Schaden, +25 % Leben, 14 % kürzeres Intervall plus drei Abschlussboni. Flow auf maximal 60 % Reduktion begrenzt. Effektives Maximalleben von der F1-Basis getrennt, kein Aufstapeln bei Neuberechnung. First Spark verstärkt nicht zusätzlich den Splash; Second Wind pausiert mit dem Spiel. Run-Start übernimmt eine Kopie des gekauften Talentbesitzes. F1-Effektwerte aktiver Talente sind live abstimmbar.

**Speichern / Balancing:** Wallet und Talent→bezahlter-Preis-Ledger in einer gemeinsamen Progress-v2-Transaktion. Fehlgeschlagener Kauf oder Reset verändert keinen In-Memory-Besitz und kein Guthaben. Reset erstattet echte bezahlte Preise, auch nach F1-Preisänderung. Legacy-v1-Wallets laden mit leerem Baum und werden erst beim nächsten erfolgreichen Speichern migriert. Ungültige IDs, nicht verbundene Talente, ungültige Preise und Überlauf bei möglichem Refund werden abgewiesen; ungültige Originale bewahrt. F1 jetzt 48 Werte, neuer Skill-tree-Tab mit 15 Feldern; Profile v3 lesen alte v1/v2-Profile mit Defaults für neue Felder.

**Tatsächliche Prüfung:** Godot 4.7.2, isoliertes APPDATA und `--test-mode`: Arena 59 + Loot/Konsole 54 + Inventar 46 + Stadt/Baum 69 = **228 Checks / 0 Fehler**, Exit 0. Stadt/Baum zusätzlich mit nativer D3D12-Ausgabe 69 / 0; ein Kauf durch simulierte Mausereignisse am Viewport, weitere Aktionen über Button-Signale. Echte Projektile prüfen Ersttreffer/Splash; reale Schadenssignale prüfen Second Wind und dessen Ablauf; Wellenabschluss prüft Heilung ohne Duplikation. Transaktionen, Legacy-Migration, alle 15 Käufe, Querverbindung, Reset nach Preisänderung, Roundtrip in neuer Store-Instanz, fehlerhafte/überlaufende Daten sowie Schreibfehler und Payout-Retry geprüft. Neun Gameplay-Scripts durch Godot MCP `script_check` ohne Diagnosen validiert. Kein menschlicher Gesamtdurchlauf oder Abnahme der Balance behauptet.

**Fehlversuch / Umgebung:** Erster neuer Stadt-/Baumtest meldete drei fehlgeschlagene Checks: simulierte Mauskoordinaten wurden als Fensterkoordinaten statt lokale Viewport-Koordinaten übergeben (dadurch Folgezustand falsch); ein Dictionary-Gleichheitstest verglich gespeicherte JSON-Floats mit In-Memory-Integern. Testvorbereitung korrigiert, anschließend headless und nativ erfolgreich. Headless-Editor-Import erzeugte die neuen Godot-UIDs und endete mit Exit 0, meldete aber einen Safe-save-Fehler im Editor-Kontext. Deshalb nicht als vollständig fehlerfreien Editorstart ausgegeben. Spieleigene Schreibfehlerbehandlung wurde unabhängig in den Suites geprüft; keine Editor-Sicherheitsoption geändert.

**Medien:** Vier native D3D12-Vorschauen unter `Progress/captures/2026-10-17_{town_v01,skilltree_v01,tree_tuning_v01,loot_name_only}.png`, jeweils 1152 × 720, gesichtet. Stadt/Baum inszenieren 500 Test-Echoes und vier Käufe; sichtbar bleiben 270 Echoes, Querverbindung Power II → Vitality III und das Ziel Renewal. Keine menschlich erspielte Progression und kein neuer Clip. Vorher-/Historienmaterial erhalten, Galerie aktualisiert; 63 lokale Verweise geprüft, keine defekt.

**Git / Umfang:** Spiel-Commit `a1d2241342690a17f62c3cf1c1e04acdfe96a43d` auf `codex/town-skilltree`, `Close the run loop with town and permanent Echoes skill tree`. Quellen, Tests, README/Regeln und sechs von Godot erzeugte UID-Dateien versioniert (einschließlich drei bisher ungetrackter INV1-UIDs). Arbeitsbaum nach Commit sauber. Begleitender Chronik-Commit enthält auch die seit INV1 entstandene Planungs-/Recherchehistorie, ohne private Chattranskripte. Keine neuen Abhängigkeiten, kein Push/Upload, altes Lootfall unangetastet.

**Offen / nächster Spieltest:** Ein regulärer Loop mit Kauf und Neustart; danach prüfen, ob die nächste Freischaltung motiviert, ob Querverbindungen verständlich sind und wann sechs Wellen zu leicht werden. Preise/Boni bleiben Testwerte. Weitere Fenstergrößen, Release-Export und langfristige Progression noch nicht manuell geprüft. Keine neuen Klassen, Items, aktiven Skillmechaniken oder begehbare Stadt gebaut.

---

## 2026-10-17 – Meta-Loop und Echoes-Skilltree verbindlich festgelegt

**Nutzerentscheidung:** Das Spiel erhält einen dauerhaften vernetzten Passivbaum mit Grundwerten und besonderen Boni nach PoE-Vorbild; Klassenwahl bleibt separat. Jetzt den Kreislauf schließen: Run bei Tod/Sieg beenden → Ergebnis und Echoes → zur Stadt / ins Hideout zurück → Echoes für den Skilltree ausgeben → mit erworbenen Boni wieder starten. Die grundsätzliche Richtung ist bestätigt und nicht erneut zur Abstimmung zu stellen.

**Planabgleich:** Loop C, P2-Umfang, aktuelle Richtung und Status/Entscheidungslog aktualisiert. Bestätigte Abweichung vom früheren P2-Minimum: vernetzter Baum statt lediglich zweier Verbesserungsreihen. Bestehende Echoes-Auszahlung, wellenbasierte Karten und Reset der Run-Ausrüstung bleiben bewahrt. Konkrete Boni/Kosten, kompletter Ausbau versus begrenzte Spezialisierung und Respec sind weiterhin offen. „Stadt“ legt noch keine begehbare Basis oder weitere NPC-/Handelssysteme fest.

**Auftragsumfang / Prüfung:** Entscheidung auf ausdrücklichen Wunsch festgehalten. Nur Dokumentation geändert; kein neuer Gameplay-Code, keine Tests oder Medien. Nächstes Paket soll einen funktionsfähigen vollständigen Kreislauf liefern; technische Umsetzung ist noch ausstehend.

---

## 2026-10-17 – Spielerpräferenzen für einen dauerhaften Echoes-Baum

Nutzer bevorzugt Grundwertfortschritt mit besonderen Boni in einem komplexeren Baum nach PoE-Vorbild; Klassenwahl ausdrücklich separat. Recherche um konkrete positive und negative Community-Berichte erweitert und Quellen/Selektionsgrenzen in `HIDEOUT_RESEARCH.md` dokumentiert. Ergebnis: erkennbare Zielgruppenunterschiede bei reinen Werteboni; interessante Zielknoten, Synergien und spürbares Tempo sind wiederkehrende Motive, teure Korrekturen und langes Wiederholen für kaum fühlbaren Fortschritt Gegenmotive. Keine repräsentative Aussage über alle Gamer. Masterplan hält die Präferenz und offene Regeln fest. Keine Gameplay-Änderung, neuen Tests oder Aufnahmen; keine Baum-Implementierung freigegeben.

---

## 2026-10-17 – Vergleichsrecherche zur Rolle des Hideouts

Auf Nutzerwunsch Hades, Dead Cells, Rogue Legacy 2 und Halls of Torment anhand Entwicklerquellen und ergänzender Community-Wikis verglichen. Mechaniken, Quellen und Abrufgrenzen in `HIDEOUT_RESEARCH.md` festgehalten. Wesentliche Erkenntnis: Permanente Stärke, Entdeckung und Vorbereitung werden häufig kombiniert. Für Lootfall Forschungs-/Lootpool-Freischaltungen und Sammlung/Startauswahl als unterschiedliche Modelle diskutieren; konkrete Item-Persistenz bleibt unentschieden. Keine Änderung an Masterplan-Entscheidungen, Gameplay oder Belohnung; keine neuen Tests oder Aufnahmen. Rechercheergebnis ist kein eigener Spieltest.

---

## 2026-10-16 – Hauptangriff bewahren, Vielfalt später über Klassen

**Entscheidung des Nutzers:** Vorerst keine zusätzliche Komplexität für den Hauptskill. Das Spiel mit dem vorhandenen Magier weiterentwickeln. Spätere Auswahl zwischen Krieger, Bogenschütze und Magier, zunächst je ein unterscheidbarer Build; Karten und Items bleiben die bestehenden Build-Systeme. Den vorgeschlagenen aufgeladenen Feuerball für jetzt verwerfen. Keine sofortige Umsetzung weiterer Klassen oder eines Klassenframeworks aus dieser Richtungsentscheidung ableiten.

**Planpflege:** Masterplan 8.3 sowie Status/Entscheidungslog angepasst. Der Wunsch, am Boden nur den Itemnamen zu zeigen, bleibt für das nächste Paket vorgemerkt. P2-Hideout/Echoes-Ausgaben sind weiterhin offen; konkrete Käufe oder Klassenmechaniken wurden nicht festgelegt.

**Prüfung / Umfang:** Git-Zustände und relevante Dokumentstellen gelesen; nur Dokumentation geändert, keine neuen Gameplay-Tests oder Medien. Die drei von Godot erzeugten ungetrackten UID-Dateien im Spielprojekt unverändert belassen.

---

## 2026-10-16 – Spieltestfeedback INV1 und Hauptskill-Idee

**Nutzerbeobachtung:** Inventar und Ausrüstung erhöhen den Spielspaß deutlich; Systeme greifen gut ineinander und wirken im bisherigen Spieltest relativ ausbalanciert. Die Neugier auf weitere Items trägt. Das ist positives subjektives Feedback, keine vollständige Abnahme aller Randfälle oder der Balance.

**UI-Wunsch:** Bodenloot soll seinen Namen zeigen; die Beschreibung darunter kann entfallen, weil im Kampf keine Zeit zum Lesen bleibt. Ausführliche Wirkung und Vergleich bleiben im pausierten Inventar sinnvoll. Für das nächste beauftragte Paket vormerken; in dieser Diskussionsrunde kein Gameplay geändert.

**Diskussion / noch keine Freigabe:** Hauptskill interessanter machen. Zwei mögliche Richtungen: verändertes Projektilverhalten über bestehende Karten/Items oder zusätzliche aktive Entscheidung beim Zaubern. Kleinster vorgeschlagener Kampftest: optional aufgeladener Feuerball mit sichtbarem Aufladen und stärkerem Treffer; normales Feuern bleibt verfügbar, Aufladen kostet Angriffszeit. Vorhandene Ausrüstungseffekte sollen mit dem geladenen Treffer funktionieren. Eingabe, Werte und Priorität gegenüber dem noch offenen P2-Hideout sind nicht entschieden. Keine neue Ressource, Skilltree oder Fortschrittsleiste vorgesehen.

**Prüfung / Grenzen:** Nur aktuellen Git-Stand, Angriff und Projektilcode sowie Masterplan gelesen; keine neuen Laufzeittests oder Aufnahmen. Godot hat nach dem letzten Commit drei neue `.gd.uid`-Dateien erzeugt; unverändert belassen. Kein neuer Hauptskill implementiert.

---

## 2026-10-16 – INV1: Ein Fund wird zur Ausrüstungsentscheidung

**Auftrag / Planabgleich:** Nutzer startet das zuvor bestätigte INV1-Paket nach dem Git-/Screenshot-Checkpoint. Bezug: Masterplan 8.4, gezielte Erweiterung des P1-Loot-Tests. Bestätigte Abweichung vom ursprünglichen „ein Drop, kein Inventar“: Aufheben aktiviert keinen Bonus mehr, sondern legt ein Run-Item in die Tasche. Karten bleiben wellenbasiert; Echoes-Auszahlung und dauerhafter Speicher bleiben unverändert. Keine weitere Scope-Abweichung im Abschlussdiff.

**Grund und Änderung:** Der Codex fühlte sich laut Feedback wie ein automatischer Power-up an und erklärte sich zu wenig. Nun acht Taschenfelder, Zepter-/Buchslot, englische Namen/Icons/Wirkungen und Vergleich vor dem Wechsel. I öffnet das pausierte Equipment, Escape schließt zur vorherigen Ansicht; der Pausenbildschirm bietet ebenfalls Equipment. Ein-/Auswechseln und Ablegen per Schaltfläche. Volle Tasche lässt Bodenloot liegen; ein fehlgeschlagener Drop am Bodenlimit behält das eigene Item. Ein belegter Slot tauscht sein altes Item in genau das ausgewählte Taschenfeld zurück.

**Vier feste Testitems:** Ember Scepter +30 % Schaden, Swift Scepter 20 % kürzeres Intervall, Cinder Codex Radius 85 / 60 % Splash, Focus Grimoire +40 % Schaden statt Splash. Schadensboni der Ausrüstung addieren sich vor Multiplikation mit dem Kartenschaden; Swift multipliziert das Intervall nach Karten. Codex weiterhin 2 % / maximal ein natürlicher Fund pro Run; sonst separater 10-%-Wurf gleichverteilt auf die drei anderen Items. Bodenlimit 16. Startwerte für den Spieltest, kein abgenommenes Balancing. Tasche/Ausrüstung werden beim nächsten Run geleert, nicht gespeichert.

**F1:** 33 statt 28 Regler, neue Itemboni/Dropverteilung/Bodenlimit, gezielt auswählbare Testfunde und Bag-/Equipment-Metriken. Inventarvergleich und Kampf nutzen dieselbe Berechnung. Neue Profile v2 enthalten 33 Werte; alte v1-Profile laden ihre 28 Werte und verwenden für fünf neue Felder Startup-Defaults mit Statushinweis. Keine automatische Umschreibung alter Dateien beim Laden. Vollständige Validierung vor Anwendung, Profil und Wallet weiterhin getrennt.

**Tatsächliche Prüfung:** Godot 4.7.2, isoliertes APPDATA und zwingend `--test-mode`: Arena 58 + Loot/Konsole 54 + Inventar 46 = **158 checks / 0 failures**, alle Exit 0. Unter anderem echte Pickup-/Projektilabläufe, inaktive Tasche, Entfernen alter Boni, volle Tasche und verlustfreie Swaps, abgewiesenes Ablegen, Wiederaufnahme blockierter Funde, I/Escape/F1-Input durch den Viewport, ausstehende Wellenkarte, Ergebnis/Restart und alte Profilformate. Die Equip-Schaltflächen wurden über echte Button-Signale geprüft, kein menschlicher Mausklick-Durchlauf. Fünf Gameplay-Scripts außerdem via verbundenem Godot MCP `script_check` ohne Diagnosen validiert; Projektname lesend bestätigt. Galerie: 52 lokale Verweise geprüft, keine defekt. Gestagte eigene Quelldateien/Diff geprüft.

**Aufschlussreicher Fehlversuch:** Erster Inventartest: 46 Checks, vier Fehler. Zwei kamen aus einer Testvorbereitung, die die Wellenabschluss-Funktion im falschen Zustand aufrief; Fixture korrigiert. Die übrigen zeigten einen echten Fehler der neuen Profil-Versionsprüfung: Godot parst JSON-Zahlen als Float, strikte Array-Mitgliedschaft erkannte Version 1 nicht. Die gezielte Fehlermeldung grenzte das ein; numerischer Vergleich behoben, anschließend alle Suites erfolgreich. Keine Änderung an normalen Nutzersaves.

**Medien:** Drei inszenierte native D3D12-Vorschauen, jeweils 1152 × 720, erzeugt mit `tests/capture_preview.gd -- --test-mode` und visuell geprüft: `Progress/captures/2026-10-16_inventory_v01.png`, `2026-10-16_ground_item_inv1.png`, `2026-10-16_item_tuning_inv1.png`. Die Inventaransicht zeigt bewusst den Tradeoff des Focus Grimoire: mehr Schaden, Splash ON → OFF. Keine neue Videoaufnahme oder menschliche Gameplay-Aufnahme. Vorher-Bild und alte Medien bewahrt.

**Git / Herkunft:** Spiel-Commit `215f601645ba35b2765389fee0411c4dee7e23f1` auf `codex/inventory`: `Add run inventory equipment choices and item balancing`. Spiel-Arbeitsbaum nach Commit sauber. Chronik erhält diesen begleitenden Eintrag, aktualisierten Masterplan und Galerie samt drei Bildern. Aus dem alten Lootfall nur das Prinzip Tasche/Slots/Vergleich als Referenz genutzt; keine Komplettübernahme und keine Änderung am Original. Keine neuen Abhängigkeiten, kein Push/Upload.

**Offen / nächster Spieltest:** Fund vor dem Ausrüsten erklären, beide Bücher und Zepter vergleichen, Wirkung im Kampf erkennen. Danach beurteilen, ob der Tausch interessant ist und wie häufig Loot fallen sollte. Andere Fenstergrößen, manueller Gesamtdurchlauf und Release-Export noch nicht geprüft. Dauerhafte Items, Affixe, Drag-and-drop, Hideout/Käufe und zusätzliche Progressionswege bleiben außerhalb des Pakets.

---

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
