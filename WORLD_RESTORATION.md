# LOOTFALL 2.0 – World Restoration: Reclaim Life

**Stand:** 20.10.2026 · **Status:** erste zusammenhängende spielbare Umsetzung lokal implementiert und technisch geprüft; menschliche Progressionsabnahme offen.
**Gilt ergänzend zum** [LOOTFALL_MASTERPLAN.md](LOOTFALL_MASTERPLAN.md). Der gesonderte Auftrag „World Restoration & Progression Overhaul“ hat die folgenden Umsetzungen ausdrücklich freigegeben; der zufällige Kampf-/Build-Run bleibt erhalten.

> **Every run makes you stronger. Every run brings the world back to life.**

## 1. Warum sich Lootfall verändert hat

**Vorher (spielbarer Prototyp):** Kampf, Welleneskalation, zufällige Karten-/Item-Synergien, Bosse und Echoes mit dauerhaftem Skilltree funktionieren. Ein externer Playtester erreichte Welle 7 und in einem zweiten Run Welle 12. Er fand die ersten Minuten und die Build-Experimente unterhaltsam, vermisste aber ein längerfristiges Ziel und eine Story. Die Arena blieb eine wiederholte Kampfkulisse. Der Meta-Fortschritt verbesserte primär den Helden und den eigenen Wellenrekord.

**Neue Identität [ENTSCHEIDUNG]:** Jeder Run hilft, eine verseuchte Welt Stück für Stück **dauerhaft zu renaturieren**. Das Land wird sichtbar gesünder, Regionen werden befreit, neue Grenzgebiete öffnen sich. Die Spielhandlung ist mit dem persönlichen Wertekanon Wachstum, Mut, Meisterschaft und Fürsorge verknüpft: Stärke wird für etwas Größeres erworben. Die Story bleibt Fantasy, mit subtilen Parallelen zu realer Umweltzerstörung, **ohne moralisierenden Ton oder Naturbelehrung**.

**Warum dies ein Wendepunkt ist:** Der erfolgreiche Kern-Loop erhält eine zweite, emotional sichtbare Langzeitdimension, ohne die zufälligen Builds zu ersetzen. Vom reinen Überlebens-/Rekord-Prototyp hin zu „mein Erfolg heilt einen Ort“.

## 2. Vier Design-Pillars

1. **Build Discovery:** Jeder Run entsteht aus neuen, nicht fest vorgeschriebenen Karten- und Itemkombinationen.
2. **Challenging Ascent:** Möglichst hohe **lokale Wellenzahlen pro Region und pro Run** erzielen; auch Welle 35 und darüber soll ein echtes Ziel sein.
3. **Rewarding Restart:** Echoes in einem dauerhaften, langfristig komplexeren Skilltree ausgeben. Die zunehmende Macht trägt spätere Runs schneller durch ihre leichten ersten Wellen.
4. **Persistent World Restoration:** Jede Expedition trägt zur dauerhaften Renaturierung der Welt bei, unabhängig davon, ob sie einen neuen Rekord erreicht.

Die **Run-Qualität** muss zählen: Höhere erreichte bzw. abgeschlossene Wellen geben deutlich mehr Restoration-Fortschritt. Aber auch kürzere legitime Runs leisten einen positiven Beitrag. Die erste implementierte Mindestleistung und Anti-Abbruch-Regel steht in Abschnitt 6.

## 3. Welt, Story und Ton

**[ENTSCHEIDUNG – erzählerische Richtung]:** Die Welt ist **verseucht, beschädigt oder infiziert**, nicht durch Siegel magisch „gefangen“ oder „stillgestellt“. Vorläufiger Begriff: **The Blight**. Verdorbene Böden, Müll/Verschmutzung, abgestorbene Vegetation und geschädigte Gewässer geben später unterschiedlichen Gebieten eigene Gesichter. Der Apprentice schützt und regeneriert das Land durch seine Expeditionen. **Emberhaven** bleibt der Ausgangspunkt.

**[OFFEN]:** Ursprung der Verseuchung, genaue Art der Magie, Gegnerherkunft, Hauptantagonist, Charakterhintergrund, genaue Ortsnamen und Regionenanzahl. Die Namen Ashen Fields / Withered Grove / Rotwater Marsh sind lediglich Mood-Ideen. Keine Pflicht, für bestimmte Regionen ausschließlich Flächenschaden oder andere feste Builds zu wählen: unterschiedliche Gegnermischungen schaffen Abwechslung, aber keine Build-Pflicht oder harten Immunitäten.

**[LANGFRISTIGE VISION]:** Das Spiel könnte nach Veröffentlichung reale Renaturierung unterstützen (z. B. finanzierte Bäume oder überprüfbare Ökosystemprojekte). Das ist eine persönliche Motivation und vorläufige Idee, **keine zugesagte Spende pro Kauf**, keine finanzielle Verpflichtung oder öffentliche Marketingbehauptung ohne Partner, Wirtschaftlichkeits- und Wirksamkeitsprüfung.

## 4. Drei klar getrennte Spieler-Metriken

| Metrik | Bedeutet | Beispiel |
| --- | --- | --- |
| **Current / Highest Unlocked Region** | Wie weit wurde die Welt befreit und was ist erreichbar? | Region 3 unlocked |
| **Best Wave in a Region** | Persönlicher Leistungsrekord in einem zusammenhängenden Run in **dieser** Region | Region 3 · Best Wave 35 |
| **Regions Restored** | Wie viele Regionen wurden dauerhaft vollständig renaturiert? | 2 Regions Restored |

Diese Größen **nicht vermischen**: 100 % restauriert ist ein abschließbares Weltziel; die persönliche Best Wave bleibt auch danach offen und vergleichbar. Weitere Anzeigen können Restorationspunkte/-anteil **der aktuellen Region** betreffen. Diese drei Metriken sind jetzt getrennt in Emberhaven/Regionskarten und lokalem Run-HUD sichtbar.

## 5. Festgelegter World-Restoration-Loop

1. Spieler wählt/spielt die aktuelle noch verseuchte Region. **Jeder reguläre Run** ist ein Versuch, möglichst weit in ihren lokalen Wellen zu kommen. Kein festes „Sechs Level und Region abgeschlossen“-Modell.
2. Im Run entstehen durch wellenbasierte Kartenentscheidungen und zufälliges Equipment unterschiedliche Builds; das Wellenziel bleibt **offen** (z. B. Welle 35 in Region 3).
3. Run-Ende: normale Echoes-Belohnung für den Skilltree **plus separate, nicht ausgebbare Restoration-Punkte** für den Weltfortschritt. Restoration-Punkte hängen von Wellenfortschritt ab, nicht von einem erzwungenen Regions-Boss-Clear.
4. Die Punkte erhöhen den **dauerhaften** Wiederherstellungsfortschritt der aktuellen Region. Der Fortschritt ist kumulativ **über mehrere Runs**, beispielsweise könnte die erste Region nach zwei bis drei Runs fertig sein – **nur eine Balancing-Hypothese**.
5. **Weltveränderung muss sichtbar sein**, nicht nur eine Prozentleiste: etwa bei 25 % Schmutz/Verseuchung reduziert, bei 50 % Erde erholt sich, bei 75 % erste Pflanzen, bei 100 % vollständige Renaturierung und ein besonderer Aha-Moment. Schwellen und Erscheinungsbild sind Testwerte, keine fertigen Art-Vorgaben.
6. Bei 100 % gilt die Region als dauerhaft restored; die nächste Region wird freigeschaltet und zur **aktuellen Frontier**. Bereits restaurierte Gebiete sind kein Pflichtkampf mehr.
7. **Überschüssige absolute Restoration-Punkte** aus einem guten Run werden der nächsten Region gutgeschrieben (nicht Prozentpunkte übertragen). Beispiel: erste Region 80/100, guter Run bringt 35 Punkte → erste Region 100/100, die nächsten 15 Punkte werden auf die neue Region angerechnet.
8. Neue Expedition in der nächsten Region: **lokale Welle 1**, keine vorausgewählten Starter-Items und kein verpflichtender Expedition Draft. Der Spieler startet mit seinen **permanenten Talenten**, aber Run-Karten und Run-Equipment beginnen frisch.
9. Optische Biome geben jeder Region ein eigenes Gefühl; unterschiedliche Gegnermischungen bleiben ein späterer Ausbau. Schwierigkeit **nicht** so hoch resetten, dass die im Skilltree gewonnene Macht bedeutungslos wird; die ersten lokalen Wellen sollen mit wachsender Stärke schneller zur Build-Aufbauphase werden. Erst spätere Wellen sind die harte Herausforderung.
10. Bereits geheilte Regionen und ihre Bestwellen bleiben als getrennte Erfolge erhalten. Optionale Wiederholbarkeit für Highscores ist langfristig denkbar, keine Implementierungsfreigabe.

## 6. Implementierte Regeln — erste Balancehypothese

**Ausdrückliche Freigabe:** Nutzerauftrag World Restoration & Progression Overhaul. Neue Fortschritts-/Resetregeln sind eine bestätigte **Abweichung vom früheren Plan**, keine bloße Umsetzung dieser Konzeptdatei. Bestehende Echoes-Kurve, zufällige Run-Karten/Items, 15 alte Talent-IDs, bezahlte Preise und exakter kostenloser Reset bleiben erhalten.

| Region | Restaurationsziel | Darstellung |
|---|---:|---|
| Ashen Fields | 600 | Asche/Erde → saubere Flächen → Gras und kleine Blüten |
| Withered Grove | 1400 | Dunkler Boden/tote Stämme → lebende Vegetation und grüne Baumkronen |
| Rotwater Marsh | 2800 | Trübe Tümpel/dunkler Boden → klareres Wasser, Schilf und Pflanzen |

Bei Tod oder Welle-100-Sicherheitsstopp: **2 × n × (n+1)** Restaurationspunkte bei n abgeschlossenen lokalen Wellen (max. 100). Beispiele 1/5/10/12/20 → 4/60/220/312/840. Keine Bestleistungs-Sonderprämie. Zwei Welle-12-Clears ergeben 624 Punkte und heilen die erste Region mit 24 Überhang; drei Welle-10-Clears ergeben 660. Dies ist ein Rechenmodell, keine gemessene menschliche Run-Dauer.

Ohne abgeschlossene Welle: 2 Punkte erst nach mindestens 30 aktiven Sekunden, drei Kills und drei direkten Treffern. Sofortiges Abbrechen, bloßes Warten, Neustart oder Schließen eines unvollendeten Runs zahlt keine Restoration aus. Kein neuer Abbruch-Farmbutton oder Crash-/Run-Resume. Gewöhnlicher Tod unter dieser Mindestleistung bleibt bei null; die Spielversprechen-Zeile ist keine garantierte Auszahlung für jedes Starten.

Punkte und Echoes werden am Run-Ende in **einer** atomaren Transaktion samt Regionsrekord und Settlement-ID gespeichert. Fehler: keine der Belohnungen ändert sich, Retry bleibt sichtbar. Doppelte Auszahlung desselben letzten Run-IDs wird auch nach Neuladen verhindert. Überhang bleibt absolut, kann mehrere Regionen fertigstellen und wird nach der dritten Region als nicht ausgebbarer Überschuss erhalten. Technische Grenze 1 Milliarde Überschuss; Überschreitung blockiert die Speicherung sichtbar statt zu verfallen. Keine vierte Region implementiert.

Die abgeschlossene Region bleibt gespeichert; automatisch neue Frontier, nächster Run lokale Welle 1, leere Run-Ausrüstung/Karten, bestehender Talent-Snapshot. Alte Regionen sind nicht zur Wiederholung auswählbar. Kein pauschaler regionaler Gegnerstärke-Multiplikator: das erarbeitete Wachstum hilft durch frühe lokale Wellen, bestehende späte Skalierung/Bosse bleiben. Regionale Gegnerkompositionen und separate Bossinhalte sind **geplant**, nicht implementiert.

## 7. Erweiterter Skilltree — implementiert

**45 statt 15 Knoten**, drei kombinierbare Pfade mit je 15 Tiers, zusätzliche Querwege bei VII und XI. Alte 15 Käufe bleiben byte-/preislogisch kompatibel; kein Klassenlock. Scrollbarer Baum mit Tastaturfokus, Tooltip/Detailwirkung und exaktem Reset. Tiers VI–XV kosten je Pfad 160/190/240/260/320/350/420/460/520/650 Echoes; alle 45 insgesamt **11790**. Bestehende Echoes-Auszahlung unverändert.

Neue spezielle Ziele:
- **Power:** Cinder Memory (Kindling +25 Prozentpunkte), Giant Slayer (+25 % direkter Bossschaden), Convergence (+6 % Basisschaden pro entdeckter Burst-/Pierce-/Overcharge-Karte, max. 18 %), Wildfire (+35 % Burst-/Codex-Flächenschaden ohne zusätzliche Ereignisse).
- **Vitality:** Bulwark (+0,2 s Trefferschutz), Living Spring (+25 % bestehende Wellen-/Emberguard-/Phoenix-Heilung), Warden Skin (12 % weniger eingehender Schaden), Last Light (ein tödlicher Treffer pro Run auf 1 HP abgefangen, 2 s Schutz; bestehende Heilung darf anschließend wirken).
- **Flow:** Afterglow (Momentum +2 s), Resonant Echo (+30 % direkter Echo-Schaden), Chain Current (Storm +40 % Reichweite/+25 % Schaden, weiterhin ein Versuch je Angriff), Unbound (während Momentum 12 % kürzeres Intervall).

18 neue Wachstumsknoten flankieren diese zwölf Ziele. Voller Baum an reinen Dauerwerten: +88 % Schaden, +110 % HP, 35 % kürzeres Intervall; im Test Basisschaden 14 → 26,32, HP 100 → 210, Intervall 0,36 → 0,234 s vor weiteren Karten/Items. Convergence/Boss-/Momentum- und andere konditionale Effekte kommen passend zum Build hinzu. Beschreibung/Inventarvergleich zeigt die durch Talente geänderten Itemwerte; kein garantierter Starter-Build.

## 8. Architektur, Speicherung und schnelle Abnahme

- `scripts/world_regions.gd`: deklarative Regionen, reine Belohnungs-/Übertrag-/Validierungsfunktionen; kein Gameplay-RNG.
- `scripts/world_art.gd`: deterministische prozedurale Biome, kontinuierliche Bodenheilung, vegetative Schwellen, ohne neue Kollision. Dieselbe Zeichnung wird als Regionsvorschau genutzt.
- `scripts/progress_store.gd`: Progress v3 mit world.points[3], world.best[3], world.overflow und last_settlement; liest v1/v2. Lesen verändert keine Datei. Vor erster Migration verifizierte bytegleiche .pre_world.json, danach bestehende Safe-JSON-Transaktion. Alte Bestwelle wird Region 1 zugeordnet; Echoes/Käufe bleiben erhalten.
- `arena.gd`: bestehender Runloop integriert Snapshot der Frontier, Auszahlung/1,5-s-Heilungsübergang und Erfolgsmeldung „Life Returns“. Keine Wiederbelebung/Runverlängerung durch Regionswechsel; Belohnung am Run-Ende.
- `town_panel.gd`: Regionsübersicht/Erfolge und scrollbarer Baum; `skill_tree.gd`, Player und bestehende Kampfereignisse tragen neue Talente. Keine allgemeine Effekt-Engine.

**Schnelltest in Godot:** F5 → Emberhaven → **Restoration sandbox — separate test save**. Kopfzeile muss SANDBOX zeigen. 0/25/50/75-%-Vorschau setzen und Explore starten oder **Heal + overflow / +3000 test Echoes** für fertige Region mit exakt 120 Punkten Überhang sowie Testgeld. Damit zweite/dritte Region und neue Talente schnell testen. Zurück in der Stadt über **Leave sandbox** normal gespeicherten Stand laden. Sandboxdatei getrennt und persistent, normale Datei unverändert; Tools in Release verborgen/abgewiesen. Englische vollständige Anleitung: WORLD_RESTORATION_PLAYTEST.md im Spielrepo.

## 9. Echte Verifikation und offener Ausbau

Spiel lokal **88861a2** auf codex/world-restoration. **1055 Checks in 15 Suites, 0 Fehler**: 95 neue Restaurationschecks plus 30 zusätzliche Baum-Detail-Layouts; Legacy-Suites weiterhin gültig. Neue 95er-Suite zusätzlich nativ mit D3D12 bestanden; Editorimport sauber. Geprüft: Migration/Backup, Reload, exakte alte und neue Erstattungen, atomare Schreibfehler/Retry, Überhang/Mehrfachabschluss, alle Frontiers/frische lokale Runs, voller Baum/Machtzuwachs, reale Storm-Reichweite/Schaden und Phoenix-Heilung, Kindling/Echo/Momentum/Bossmodifikator, einmaliger Lebensschutz sowie isolierte Sandbox.

Elf echte native Aufnahmen: Ashen Fields 0/25/75/100 %, Grove 0/75 %, Marsh 75 %, Stadt, tiefer Baum, Sandbox, tatsächlicher Run-Ende-Auszahlungs-/Unlockpfad mit kontrolliertem vorherigen 590/600-Stand und zwei simuliert geklärten Wellen. Gestellte Tests, kein Nachweis menschlicher 2–3-Run-Pace; keine „natürlich verdiente“ Heilung behauptet.

**Offen:** menschliche Langzeitkurve/Skillpreis-Tuning, Performance in sehr dichten späten Wellen, organischere Art, eigene regionale Gegnerzusammenstellungen/Challenges, optionale Wiederholbarkeit alter Regionen und Endgame nach drei Regionen. Storyherkunft und reale Naturschutz-Idee in §3 bleiben konzeptionell. Keine weiteren Klassen, Starter-Drafts, Währungen, Exporte, Clips oder GitHub-Pushes. Beide AGENTS modernisiert; innerhalb freigegebener Pakete eigenständige Umsetzung, Sicherheitsregeln bleiben.
