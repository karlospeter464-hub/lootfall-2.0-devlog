# Lootfall 2.0 – Entwicklungsprotokoll

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
