# LOOTFALL 2.0 – World Restoration: Reclaim Life

**Stand:** 20.10.2026 · **Status:** bestätigte neue Spielerfantasie und Konzeptentscheidungen; **nicht implementiert**.  
**Gilt ergänzend zum** [LOOTFALL_MASTERPLAN.md](LOOTFALL_MASTERPLAN.md). Die alte technische Run-Struktur bleibt bis zu einem ausdrücklich beauftragten Umsetzungspaket bestehen.

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

Die **Run-Qualität** muss zählen: Höhere erreichte bzw. abgeschlossene Wellen geben deutlich mehr Restoration-Fortschritt. Aber auch kürzere legitime Runs leisten einen positiven Beitrag. Die Detailregel für Tod während der ersten unvollendeten Welle und Anti-Farming bleibt offen.

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

Diese Größen **nicht vermischen**: 100 % restauriert ist ein abschließbares Weltziel; die persönliche Best Wave bleibt auch danach offen und vergleichbar. Weitere Anzeigen können Restorationspunkte/-anteil **der aktuellen Region** betreffen. Die Zahlen sind UI-Ideen, keine bereits erstellten HUD-Elemente.

## 5. Festgelegter World-Restoration-Loop

1. Spieler wählt/spielt die aktuelle noch verseuchte Region. **Jeder reguläre Run** ist ein Versuch, möglichst weit in ihren lokalen Wellen zu kommen. Kein festes „Sechs Level und Region abgeschlossen“-Modell.
2. Im Run entstehen durch wellenbasierte Kartenentscheidungen und zufälliges Equipment unterschiedliche Builds; das Wellenziel bleibt **offen** (z. B. Welle 35 in Region 3).
3. Run-Ende: normale Echoes-Belohnung für den Skilltree **plus separate, nicht ausgebbare Restoration-Punkte** für den Weltfortschritt. Restoration-Punkte hängen von Wellenfortschritt ab, nicht von einem erzwungenen Regions-Boss-Clear.
4. Die Punkte erhöhen den **dauerhaften** Wiederherstellungsfortschritt der aktuellen Region. Der Fortschritt ist kumulativ **über mehrere Runs**, beispielsweise könnte die erste Region nach zwei bis drei Runs fertig sein – **nur eine Balancing-Hypothese**.
5. **Weltveränderung muss sichtbar sein**, nicht nur eine Prozentleiste: etwa bei 25 % Schmutz/Verseuchung reduziert, bei 50 % Erde erholt sich, bei 75 % erste Pflanzen, bei 100 % vollständige Renaturierung und ein besonderer Aha-Moment. Schwellen und Erscheinungsbild sind Testwerte, keine fertigen Art-Vorgaben.
6. Bei 100 % gilt die Region als dauerhaft restored; die nächste Region wird freigeschaltet und zur **aktuellen Frontier**. Bereits restaurierte Gebiete sind kein Pflichtkampf mehr.
7. **Überschüssige absolute Restoration-Punkte** aus einem guten Run werden der nächsten Region gutgeschrieben (nicht Prozentpunkte übertragen). Beispiel: erste Region 80/100, guter Run bringt 35 Punkte → erste Region 100/100, die nächsten 15 Punkte werden auf die neue Region angerechnet.
8. Neue Expedition in der nächsten Region: **lokale Welle 1**, keine vorausgewählten Starter-Items und kein verpflichtender Expedition Draft. Der Spieler startet mit seinen **permanenten Talenten**, aber Run-Karten und Run-Equipment beginnen frisch.
9. Andere Gegnermischungen/optische Biome geben jeder Region ein eigenes Gefühl. Schwierigkeit **nicht** so hoch resetten, dass die im Skilltree gewonnene Macht bedeutungslos wird; die ersten lokalen Wellen sollen mit wachsender Stärke schneller zur Build-Aufbauphase werden. Erst spätere Wellen sind die harte Herausforderung.
10. Bereits geheilte Regionen und ihre Bestwellen bleiben als getrennte Erfolge erhalten. Optionale Wiederholbarkeit für Highscores ist langfristig denkbar, keine Implementierungsfreigabe.

## 6. Balance-Leitlinien und echte offene Fragen

**[ENTSCHEIDUNG]**
- Alle ernsthaften Runs leisten Restaurationsfortschritt; außergewöhnlich hohe Wellen deutlich mehr.
- Skilltree und Restaurationspunkte sind getrennte Belohnungsmechanismen. Kein Zwang zu zusätzlicher, ausgebbarer Währung.
- Region 2 soll anders spielen, aber nicht einen einzigen „richtigen“ Build vorschreiben.
- Der Skilltree darf **komplexer und tiefer werden**, um langfristige Charakterentwicklung und schnelleren Aufbau in frühen Wellen zu unterstützen. Konkrete Erweiterung ist **noch nicht beauftragt**.
- Wellen 1–5 bzw. 1–10 späterer Regionen dürfen sich dank erarbeiteter Stärke leicht anfühlen; sie sollen zügig den Build aufbauen. Der Boss-/Wave-Druck entsteht weiter oben.
- Bestehende zufällige Karten-/Item-Mechaniken bleiben das Herzstück und werden nicht durch einen vorgefertigten Startbuild ersetzt.

**[OFFEN]**
- Absolute Punkte pro abgeschlossener Welle / Wachstumsformel und Kostenkurve pro Region; ob neue Bestleistungen zusätzlich belohnt werden.
- Mindestleistung bei extrem frühem Tod, Regel gegen absichtliches Abbrechen, Speichern und genau ein Mal auszahlen.
- Visual-Transitions in der Arena sowie Darstellung der Gesamtkarte und eventueller „restored“-Hub-Reaktionen.
- Schwierigkeitszuwachs pro Region vs. Spieler-Talentmacht; Dauer der leichten Build-Aufbauwellen; Timing der Wellen.
- Zeitpunkt des Welt-Upgrades: erst auf der Ergebnis-/Hub-Seite oder schon beim Überschreiten der Schwelle im laufenden Run.
- Umgang mit mehr als einem Regionsabschluss durch einen einzigen außergewöhnlich hohen Punktevorrat.
- Legacy-Spielstandmigration/Übergang der bisherigen globalen Bestwelle zu region-lokalen Bestwellen.
- Ob man restaurierte Regionen freiwillig erneut spielen darf und wie sich das auf Progression auswirkt.
- Tieferer Skilltree, spätere horizontal interessante Freischaltungen und Endgame nach der Welt-Restoration.

Diese Fragen dürfen Codex zu **mehreren guten Varianten und einem bevorzugten technischen/spielerischen Vorschlag** führen, aber nicht ohne Produktautorisierung neue Economy-, Persistenz- und Reset-Regeln produktiv ändern.

## 7. Aktueller Implementierungsstatus und nächste Stufe

**IMPLEMENTIERT vor dieser Entscheidung:** Godot-Wave-Loop, bestehende zufällige Karten und acht Items, zwei Bosstypen, Echoes, Emberhaven, 15 Talentknoten, prozedurale Figuren/Arena; der aktuelle Aufstieg beginnt stets bei Welle 1 und läuft bis Tod oder Sicherheitsstopp.

**JETZT BESTÄTIGT, NICHT IMPLEMENTIERT:** Region-lokale Runs/Wellenrekorde, Restoration-Punkte, sichtbare Heilungsstufen, Punktübertrag, freigeschaltete Frontiers, regionale Gegnermischungen und späterer schnellere Build-Aufbau durch einen tieferen Skilltree.

**NÄCHSTER MÖGLICHER VERTICAL SLICE (nur Vorschlag):** Eine verseuchte Arena vor/nach zwei sichtbaren Heilungsstufen, kummulierende Restoration-Punkte über mehrere reale Runs, Ergebnisanzeige getrennt von Echoes, erster Frontier-Übergang mit Übertragung der überschüssigen Punkte, zweite Region mit eigenen Bestwellen und frischem Build. Kein Pflicht-Neubau von drei vollständigen Welten.

**Dokumentations-/Release-Regel:** Keine Gameplayänderung, kein Godot-Test und keine neuen Screenshots werden durch das bloße Festhalten dieser Vision behauptet. Codex soll bei künftig ausdrücklich freigegebenen Paketen Architektur, Refactoring und Tests eigenständig übernehmen dürfen, ohne die bestätigten Spielerziele zu verändern. Keine ungefragten GitHub-Pushes.
