# LOOTFALL — Masterplan für Game Design & Entwicklung

**Version:** 1.0 · **Stand:** 16. Oktober 2026  
**Dokumenttyp:** Lebendes Masterdokument / einzige fachliche Planungsquelle  
**Status:** Konzeptentwurf zur gemeinsamen Weiterentwicklung – **kein** vollständiger Implementierungsauftrag  
**Verantwortung:** Nutzer = Creative Director und finale Produktentscheidungen · Codex = technische Analyse, Entwicklung, Tests und Dokumentationspflege  
**Technologie:** Godot 4, GDScript, PC, zunächst Singleplayer; lokale, möglichst kostenlose Werkzeuge

> **Leitsatz:** Eine große Vision, aber immer nur der kleinste sinnvolle nächste Test. Systeme werden gebaut, um ein gewünschtes Spielerlebnis zu beweisen – nicht weil eine Feature-Liste existiert.

---

## 0. So wird dieses Dokument verwendet

Dieses Dokument ist der **gemeinsame Bezugspunkt für das neue Codex-Projekt**. Es ersetzt die bisher angesammelten, teils widersprüchlichen Einzelprompts und Roadmaps. Es ist ein Planungsdokument, kein Beleg dafür, dass etwas technisch bereits umgesetzt ist.

**Entscheidungsstatus im gesamten Dokument:**
- **[ENTSCHEIDUNG]** Inhaltlich gemeinsam festgelegt; Änderungen nur nach Rücksprache.
- **[HYPOTHESE]** Sinnvoller Entwurf, muss durch Playtests oder weitere Diskussion geprüft werden.
- **[OFFEN]** Noch keine Produktentscheidung; Codex darf sie nicht selbst als endgültig treffen.
- **[SPÄTER]** Interessante Option ohne Umsetzungsfreigabe.
- **[IMPLEMENTIERT]** Technisch vorhanden **und überprüft**; nur so kennzeichnen, wenn nachgewiesen.

**Verbindliche Arbeitsweise für Codex:**
1. Zu Beginn feststellen, ob das neue Projekt leer ist oder bereits Godot-Dateien enthält. Nichts voraussetzen.
2. Zuerst Vision, aktuellen Scope, Projektstatus und die für die Aufgabe relevanten Abschnitte lesen; nicht automatisch jedes Mal das gesamte Dokument und Repository erneut einlesen.
3. **Keine** neuen Features allein aus diesem Masterplan implementieren. Implementierung erst nach ausdrücklichem, abgegrenztem Auftrag.
4. Bei größeren Änderungen zuerst Ist-Stand, minimalen technischen Ansatz, betroffene Komponenten, Aufwand/Risiken und Tests vorschlagen. Dann Freigabe abwarten.
5. Nach jeder freigegebenen, getesteten Arbeit die Abschnitte **9 (Projektstatus)** und **10 (Entscheidungen/Änderungslog)** knapp aktualisieren. Ungeprüfte Ergebnisse nicht als fertig melden.
6. Änderungen an Vision, Design Pillars, Core Loops, Reset-Regeln oder Scope nur als **Vorschlag** notieren, bis der Nutzer sie bestätigt.
7. Bestehenden Code respektieren, klein und wiederverwendbar entwickeln; keine spekulativen Frameworks, keine neuen kostenpflichtigen APIs oder Dienste ohne Zustimmung.
8. Vor Gameplay-Paketen Ziel, Planbezug, Umfang und offene Entscheidungen kurz ausweisen. Abweichungen bei Core Loops, Belohnungsauslösern oder Persistenz ausdrücklich benennen und vor Umsetzung bestätigen lassen; technische Details im freigegebenen Umfang eigenständig lösen. Abschluss gegen den beauftragten Umfang prüfen.

---

## 1. Vision und Zielspieler

### 1.1 Spielerfantasie

**[HYPOTHESE]** *Experimentieren. Entdecken. Grenzen überwinden.*

In **Lootfall** baut der Spieler während eines kurzen, zunehmend intensiven Action-Runs aus einfachen Fähigkeiten einen ungewöhnlichen, mächtigen Build. Er trifft Entscheidungen zwischen Verbesserungen, erlebt überraschende seltene Funde und versucht, eine neue Bestmarke zu erreichen. Wenn ein Run endet, entsteht im Hideout dauerhafter Fortschritt, der neue Versuche, Experimente und höhere Rekorde ermöglicht.

**Ein-Satz-Versprechen:** *„Ich will noch einen Run spielen: Ich habe eine neue Build-Idee und glaube, dass ich damit höher komme.“*

**[ENTSCHEIDUNG] Persönliche Spielerprioritäten des Creative Directors:**
- **Entdeckung / Experimentieren:** gern immer wieder neue Klassen, Fähigkeiten und Kombinationen ausprobieren, statt nur einen Charakter maximal zu optimieren.
- **Herausforderung:** eigene Rekorde knacken, nächste Wellenstufe erreichen, an einer Schwierigkeit wachsen.
- **Belohnungsüberraschung:** besondere Gegenstände sollen sich wie ein außergewöhnlicher Fund anfühlen (Inspiration Diablo/Path of Exile).

**Referenzspiele als Prinzipien, nicht als Feature-Kopien:**
- *Vampire Survivors:* Eskalation, Power-Growth, häufiges Feedback.
- *Nova Drift:* aus wenigen Grundlagen viele Build-Varianten erzeugen.
- *Brotato:* kurze Herausforderungen mit bedeutungsvollen Belohnungsentscheidungen.
- *Tap Titans 2:* Prestige/Neustart, Ressourcen mitnehmen, höher pushen.
- *Rogue Legacy 2 / Soulstone Survivors:* langfristige Freischaltungen nach Runs.
- *Diablo / Path of Exile:* aufregende, unverwechselbare seltene Drops.

**[ENTSCHEIDUNG] Eigenständige Richtung:** aktives 2D-Action-RPG statt Idle-Game oder reines Auto-Attack-Spiel. Visuelle Richtung: **Stylized Dark Fantasy**, handgemalt wirkende 2D-Grafik, klare Silhouetten und lesbare, starke Zaubereffekte.

### 1.2 Drei Design Pillars

| Pillar | Versprechen an den Spieler | Was wir beobachten wollen |
|---|---|---|
| **1. Build-Entdeckung** | Mein nächster Durchlauf kann sich deutlich anders spielen. | Entscheidungen erzeugen neue Kombinationen, nicht nur größere Zahlen. |
| **2. Herausfordernder Aufstieg** | Jede zusätzliche Welle ist ein nachvollziehbarer Erfolg. | Der Spieler will seinen Bestwert übertreffen; steigende Schwierigkeit bleibt fair und lesbar. |
| **3. Belohnender Neuanfang** | Auch ein gescheiterter Run bringt echte Möglichkeiten für die Zukunft. | Seltene Drops und dauerhafte Fortschritte erzeugen Vorfreude auf den nächsten Versuch. |

**Übergreifende Qualität:** Treffer, Machtanstieg, Item-Drops und Rekorde brauchen klares **Game Feel** (visuelles und akustisches Feedback), ohne unnötige Effektflut.

### 1.3 Nicht-Ziele für den Anfang

Kein Multiplayer, keine Online-Ökonomie, keine vollständige ARPG-Kampagne, keine neun Klassen-/Spezialisierungsbäume, keine große Crafting-Ökonomie, kein ausgebautes Life-Skilling. Diese Ideen dürfen die ersten Experimente nicht verzögern.

---

## 2. Die drei ineinandergreifenden Gameplay-Loops

### Loop A — Kampf (Sekunden)
**Gegner wahrnehmen → Positionieren & Angreifen → Trefferrückmeldung → Gegner besiegen → nächste Bedrohung.**

*Qualitätsfrage:* Ist die Aktion selbst verständlich, kontrollierbar und befriedigend – auch ohne viele Effekte oder Items?

### Loop B — Build-Run (Minuten)
**1–3 Wellen bestehen → 1 aus 3 Belohnungskarten wählen → den Build verändern → stärkere Wellen bewältigen → seltenen Loot finden → eigenen Rekord herausfordern.**

- **[HYPOTHESE]** Drei Kartentypen: **Statuswerte**, **Fähigkeiten/Skill-Modifikatoren**, **Items**. Nicht zwingend in jeder Auswahl eine Karte jeder Art; zunächst verständlich präsentieren.
- **[HYPOTHESE – vorläufiges Testmodell, 16.10.2026]** Seltene Items droppen zufällig während des Runs und verstärken den aktuellen Build. Sie sollen helfen, höhere Wellen zu erreichen und dadurch am Run-Ende mehr Echoes zu erhalten. Für diesen ersten Entwurf gelten die Items nur im aktuellen Run; sie werden nicht als Ausrüstung in den nächsten Run übernommen. Sie bleiben **zusätzliche Überraschungen** neben den wellenbasierten Kartenentscheidungen. Technischer Teststand: Cinder Codex, 2 % Dropchance pro berechtigtem Kill, maximal ein Exemplar pro Run. Aufheben ergänzt Feuerball-Explosionen (Radius 85, 60 % Geschossschaden an benachbarte Gegner, kein doppelter Primärtreffer). Startwerte in F1 einstellbar; spielerische Abnahme offen.
- **[ENTSCHEIDUNG]** Entdeckung und Herausforderung sind wichtiger als endloses numerisches Grinden.

*Qualitätsfrage:* Entstehen durch Kartenentscheidungen erkennbar verschiedene Spielstile? Hat man Lust, eine andere Kombination auszuprobieren?

### Loop C — Prestige / Meta-Fortschritt (viele Runs)
**An die Grenze kommen / Run beenden → Ergebnis und Bestmarke sehen → zum Hideout zurückkehren → dauerhafte Ressource einsetzen → neue Spielmöglichkeiten/kleine Vorteile freischalten → neu starten → bisherigen Rekord schlagen.**

- **[ENTSCHEIDUNG]** Eine Meta-Ressource mit vorläufigem englischem Namen **„Echoes“** (Namenswahl für jetzt an Codex delegiert). Belohnung erfolgt am Run-Ende auf dem Ergebnisbildschirm, keine Ressourcen-/XP-Sammelleiste als Ersatz für die wellenbasierte Kartenauswahl. **[HYPOTHESE – erstes Belohnungsmodell]** Höherer Wellenfortschritt soll mehr Echoes ergeben; zufällige Run-Items helfen indirekt, diesen Fortschritt zu erreichen. Keine zusätzliche direkte Echoes-Belohnung für den bloßen Itemfund vorgesehen. Implementiertes Startmodell: 10 × Summe der abgeschlossenen Wellenstufen (1 + 2 + … + n), bei Sieg und Tod einmalig am Ergebnisbildschirm. Eine nur erreichte Welle zählt nicht zur Auszahlung; App-Schließen während des Runs zahlt nichts aus. Der Faktor ist in F1 einstellbar. Diese Werte sind Balancing-Startwerte, keine endgültige Balanceentscheidung.
- **[HYPOTHESE]** Zunächst ein sehr simples Hideout als **Menü**: Portal / Altar / Archiv; keine begehbare Stadt nötig.
- **[HYPOTHESE]** Meta-Fortschritt kombiniert **begrenzten vertikalen Fortschritt** (kleine dauerhafte Vorteile) und **horizontalen Fortschritt** (weitere Builds, Startoptionen, Relikte).
- **[OFFEN – langfristig]** Ob seltene Items später dauerhaft ausrüstbar bleiben oder einen Archiv-/Freischalteintrag hinterlassen. Das vorläufige Testmodell verwendet ausschließlich Run-Items ohne Übernahme in den nächsten Run; spätere Persistenz ist damit nicht endgültig entschieden.
- **[OFFEN]** Ob Reset nur beim Tod/Abschluss oder auch freiwillig möglich ist.
- **[OFFEN]** Wie Spieler bereits bezwungene Wellen beschleunigen oder überspringen dürfen.

*Qualitätsfrage:* Macht der Neustart neugierig, anstatt bereits bekannte Wellen nur mühsam wiederholen zu müssen?

### Beispiel eines möglichen Spielerlebnisses — **kein Balancing-Versprechen**

Run 1: Einfacher Feuerball → Karte mit zusätzlichem Projektil → seltenes Explosionsbuch → neue Bestmarke Welle 12 → Echos erhalten.  
Run 2: Mit kleinen permanenten Vorteilen und anderem Build starten → bisherige Wellen leichter bewältigen → Welle 17 erreichen.  
Run 3: Alternative Fähigkeit/Relikt-Kombination entdecken → ein anderes Kampfgefühl erleben → neue Rekordjagd.

Die Zahlen, Items und Namen sind **Beispiele**, keine festgelegten Drops, Raten oder Werte.

---

## 3. Produktstruktur – Vom Erlebnis zu den Systemen

**Regel:** Erst das Spielerlebnis benennen, dann die kleinste notwendige Mechanik. Ein neues „cooles Item“ allein ist noch kein Grund für neue Speziallogik.

| Spielerlebnis | Benötigte Fähigkeit des Spiels | Kleinstmöglicher Systembaustein | Erst später erweiterbar um |
|---|---|---|---|
| Mein Angriff fühlt sich gut an | Schaden, Trefferreaktion, Bewegung | Einfacher Combat Core | Weitere Waffen, Status-Effekte, Animationen |
| Es wird immer anspruchsvoller | Steigende Gegnerbelastung | Zeit-/Wellenbasierter Spawner mit Gegnerlimit | Encounter-Budget, Gegnerrollen, Elite-Affixe |
| Ich verändere meinen Build | Wahl zwischen Upgrades | Kleine 1-aus-3-Auswahl mit wenigen klaren Effekten | Freie Skill-Slots, Modifikator-Pools, Skilltrees |
| Ein Drop überrascht mich | Ein sichtbares seltenes Ereignis mit einzigartigem Effekt | Ein zusätzlicher seltener Drop, eine wiederverwendbare Wirkung | Item-Raritäten, prozedurale Affixe, Sammlung |
| Ein Neustart lohnt sich | Etwas bleibt über den Run hinaus erhalten | Eine Ressource, Speichern, eine Kaufmöglichkeit | Relikte, Freischaltpfade, Crafting, Hideout-Ausbau |
| Ich will meinen Rekord schlagen | Verfolgbarer persönlicher Fortschritt | Höchste Welle speichern und anzeigen | Bestenlisten, Modifikatoren, Challenges |

**Prinzip „System first, content second“:** Neue Mechaniken werden auf Wiederverwendbarkeit geprüft; neue Inhalte sollen vorhandene Mechaniken per Datenkonfiguration kombinieren. Aber erst dann verallgemeinern, wenn mindestens ein zweiter realer Anwendungsfall erkennbar ist. Keine universelle Effekt-Engine auf Verdacht.

---

## 4. Validierungs-Roadmap mit festem Komplexitätsbudget

**Wichtig:** Die Phasen bezeichnen aufeinanderfolgende **Experimente**, keine Versprechen über Implementierungsdauer. Eine Phase wird erst nach Spieltest abgeschlossen. Vorhandene Funktionen des lokalen Projekts reduzieren gegebenenfalls den Aufwand.

### P0 — Kampf & Machtanstieg (kleinster spielbarer Test)

**Hypothese:** Kämpfen gegen zunehmende Gegnerzahlen plus wenige Upgrade-Entscheidungen ist bereits für einige Minuten motivierend.

**Maximaler Scope:**
- 1 spielbare Figur: **Apprentice-Magier** (Zepter + Buch; zunächst Platzhalter zulässig).
- 1 Arena, kein Dungeon-Generator und kein Hub.
- 1 aktiv gesteuerter Angriff (z. B. Feuerball), 1 einfacher verfolgender Gegnertyp.
- Wellen-/Zeit-Spawner mit steigendem Druck und Limit für gleichzeitig aktive Gegner.
- 1-aus-3-Kartenoberfläche; zunächst höchstens **3 definierte Upgrade-Optionen**, **2 Auswahlereignisse** pro Test-Run.
- Ein klares Run-Ende, Neustart und angezeigte höchste Welle.
- Einfaches Trefferfeedback; Spawner/Schaden/Bewegung über Inspector oder kleines Debug-Menü einstellbar.

**Bewusst ausgeschlossen:** echtes Inventar, seltene Drops, Meta-Währung, persistente Itemsammlung, mehrere Klassen, Skilltrees, Crafting, zufällige Dungeons, vollständige Grafik-/Animationspipeline.

**Mögliche technische Etappentests:** Zuerst Kampf + steigender Gegnerdruck **ohne** Upgrades testen; danach erst Kartenauswahl ergänzen. Kein System vor seiner Notwendigkeit verallgemeinern.

**Abnahme:** Ein kurzer Run lässt sich vollständig spielen; zwei Upgrade-Entscheidungen verändern spürbar das Spiel; Schwierigkeit steigt kontrolliert; ein neuer Run startet zuverlässig. Spieler kann nach einem Run benennen, welche Wahl ihn stärker gemacht hat.

### P1 — Seltenheitsmoment (Loot-Jackpot testen)

**Hypothese:** Ein sehr seltenes, klar erkennbares Item mit eigenständigem Effekt erzeugt mehr Begeisterung als nur eine weitere Zahlenerhöhung.

**Zusatzumfang:** 1 seltener Drop, 1 besonderer Effekt, sichtbare Inszenierung (Farbe/Ton/kurze Animation) und **ein** klar definierter Verwendungsfall. Zunächst kein allgemeines Inventar und keine umfassende Rarity-Ökonomie.

**Erste Idee (16.10.2026):** Das Item kann zufällig im Run droppen und verstärkt diesen Run. Der gewünschte Nutzen ist, höhere Wellen zu schaffen. Mit P2 soll daraus am Run-Ende eine höhere Echoes-Belohnung entstehen. P1 selbst benötigt dafür noch keine implementierte Meta-Währung. Beim nächsten Run startet der Spieler ohne das gefundene Item; dauerhafte Ausrüstung ist nicht Teil dieses Tests. Die bisherigen Wellenkarten bleiben erhalten.

**Abnahme:** Spieler bemerkt den Drop, versteht den Effekt und kann seine Änderung am Kampf nachvollziehen. Für Demonstrationszwecke muss der Drop im Debug-Modus gezielt auslösbar sein.

**Technischer Stand:** Cinder Codex zufällig/physisch aufhebbar, pro Run einmalig; Flächentreffer und Reset automatisiert geprüft. F1 kann den Drop gezielt erzeugen. Manuelle Bewertung des Seltenheitsmoments noch offen.

### P2 — Prestige-Test (langfristige Motivation)

**Hypothese:** Nach einem Reset motivieren dauerhafte, kontrollierte Verbesserungen zu einem weiteren Versuch.

**Zusatzumfang:** 1 Meta-Währung, 1 einfacher Ergebnisbildschirm, 1 Hideout-Menü, 1–2 begrenzte permanente Verbesserungen, Speichern/Laden. Keine begehbare Basis.

**Erstes Belohnungsmodell (16.10.2026):** Echoes erst am Run-Ende vergeben; höherer Wellenfortschritt soll eine höhere Belohnung ergeben. Seltene Run-Items können durch ihre Kampfwirkung helfen, weiter zu kommen. Konkrete Auszahlungskurve und Abschlussregeln bleiben vor der Implementierung festzulegen.

**Abnahme:** Run abschließen → Ressource erhalten → Verbesserung erwerben → neuer Run → Effekt nach Neustart tatsächlich vorhanden; keine fehlerhaften Doppelbelohnungen.

**Teilstand:** Echoes-Auszahlung, dauerhafte Speicherung und Bestwelle vorhanden; Doppelbelohnungen, Datei-Roundtrip und Fehlerbehandlung geprüft. Hideout, Kaufmöglichkeiten und permanente Verbesserungen sind noch nicht umgesetzt; P2 ist damit nicht abgeschlossen.

### P3 — Horizontale Entdeckung (erst nach erfolgreichem P2)

**Hypothese:** Neue Wahlmöglichkeiten motivieren langfristig stärker als unbegrenzt steigende Grundwerte.

**Zusatzumfang:** 1 dauerhafte neue Build-Option oder 1 freischaltbares Relikt, dessen genauer Persistenzmodus vorher entschieden wird. Bereits bekannte frühe Wellen dürfen später vereinfacht/beschleunigt werden, falls Tests Leerlauf zeigen.

**Abnahme:** Das neue Angebot verändert die nächste Run-Strategie erkennbar; bloß höhere Schadenszahlen genügen nicht.

### Jenseits von P3 — Nur nach neuer Entscheidung

Modulare lineare Dungeon-Räume, Encounter Director, Gegnerrollen, Elite-Modifikatoren, größere Skill-/Item-Systeme, mehrere Klassen, Spezialisierungen, größere Hideout-Strukturen. Crafting/Life-Skilling mit Ressourcen und Rezepten ist ein **spätes** Visionsthema, keine Startvoraussetzung.

---

## 5. Guardrails gegen Scope Creep

### 5.1 Scope-Gate vor jedem größeren Feature

Jedes neue Feature muss die folgenden Fragen kurz beantworten:

1. **Erlebnis:** Welcher Design Pillar oder Loop wird dadurch besser?
2. **Test:** Was können wir nach der Umsetzung beobachten, das vorher nicht möglich war?
3. **Minimalversion:** Was ist die einfachste Version, die diese Hypothese testet?
4. **Reuse:** Lässt sich vorhandener Code nutzen? Gibt es einen zweiten konkreten Anwendungsfall für neue Abstraktion?
5. **Gesamtkosten:** Berücksichtigen wir Programmierung **plus** UI, Grafiken, Balancing, Tests und Fehlerbehebung?
6. **Schnittkante:** Welche naheliegenden Folgeideen werden **explizit nicht** gebaut?

**Wenn nicht klar beantwortbar → zurück ins Konzept oder in den Backlog.**

### 5.2 Verbindliche Umfangsgrenzen

- Innerhalb einer Phase **nur ein neues großes System gleichzeitig**.
- Bereits beschlossene Phasengrenzen nicht durch „kleine Extras“ aufweichen.
- Neu vorgeschlagene Features standardmäßig in **Ideen-Backlog**, nicht in die laufende Phase.
- Bei unvorhergesehenen Abhängigkeiten zuerst Umfang reduzieren oder vereinfachen.
- „Technisch umgesetzt“ und „spielerisch funktioniert“ sind unterschiedliche Meilensteine.
- Nach Bedarf Refactoring, aber keine umfassende neue Architektur ohne konkreten Nutzen.

### 5.3 Warnzeichen

Große Inventarverwaltung für ein einziges Test-Item; vollständiger Talentbaum für eine einzige Upgrade-Wahl; mehrere Ressourcen vor dem Test einer Meta-Währung; ein 3D-/Animation-Framework für einen einzigen 2D-Zaubereffekt; beliebig viele Item-Affixe ohne Test, ob der einfache Loot-Drop Freude erzeugt.

---

## 6. Technische Entwicklungsprinzipien (Codex + Godot)

1. **Ist-Stand vor Annahme:** Bei neuem Repository erst Verzeichnis/Szenen/Scripts/Resources prüfen. Alte Starterprojekte und frühere Implementierungen nicht voraussetzen.
2. **Godot 4 + GDScript; lokal, kostenlos:** Keine bezahlten APIs, kein verpflichtender MCP-Server, keine ungeprüften externen Scripts. Godot MCP optional nur bei echtem Editor-/Szenen-Mehrwert.
3. **Data-driven, aber pragmatisch:** Wiederkehrende Werte als `@export` oder Godot `Resource` (`.tres`); nicht jede einzelne Zahl in komplizierte generische Abstraktionen verwandeln.
4. **Debugbarkeit:** Häufiges Balancing ohne neue Codex-Runde ermöglichen. Ein kleines F1-Debug-Menü mit **nur vorhandenen** Variablen; sinnvolle Grenzen, Reset auf Standardwerte und Entwicklungsmodus-Grenze. Inspector kann anfangs genügen.
5. **Determinismus:** Wenn Zufall komplex wird, Seeds für reproduzierbare Fehler und Builds anbieten; keine aufwendige Seed-UI im ersten Test.
6. **Automatisierbare Tests:** Lokale Godot-Start-/Parseprüfung, gezielte Spieltests, keine falschen Erfolgsbehauptungen. Bei zwei erfolglosen Reparaturschleifen Fehler dokumentieren statt unendlich nacharbeiten.
7. **Feature-Pakete statt Mikromanagement:** Zusammengehörige Änderungen gebündelt implementieren; keine riesigen Multi-System-Aufträge.
8. **Git:** Vor riskanten Änderungen sichern, keine destruktiven Aktionen ohne Zustimmung.
9. **Kurze Kommunikation:** Nach Implementierung nur was geändert wurde, was geprüft wurde, was offen blieb und was der Nutzer in Godot testen soll.
10. **Assets:** Stylized-Dark-Fantasy-Referenzen und Game-Assets unterscheiden; generierte Bilder sind nicht automatisch geeignete Spritesheets. Vorerst Platzhaltergrafik und einfache Tween-/Partikeleffekte.

---

## 7. Playtesting – Lernen statt Feature-Sammeln

Für jeden neuen Test mehrere kurze Durchläufe spielen und knapp festhalten:

| Frage | Beobachtung / Messmöglichkeit |
|---|---|
| War der Kampf klar und befriedigend? | Notieren: Was fühlte sich gut/unklar an? |
| Wann entstand erstmals spürbare Macht? | Welle/Zeitpunkt und gewähltes Upgrade notieren. |
| War die Upgrade-Wahl interessant? | Gab es eine offensichtliche Pflichtwahl? |
| Wie entstand der nächste Versuch? | Wollte ich eine andere Kombination testen oder nur Zahlen erhöhen? |
| Was machte einen seltenen Drop besonders? | Wurde er erkannt und beeinflusste er eine Entscheidung? |
| Wie wirkte der Reset? | Motivation zu erneutem Run statt Pflichtwiederholung? |

**Feedback-Regel:** Immer zunächst **ein Erlebnisproblem** benennen, dann Hypothesen für die Ursache sammeln, dann nur **eine** kleine Änderung testen. Spieldaten und eigene Eindrücke haben Vorrang vor Feature-Wünschen.

---

## 8. Offene Entscheidungen und geparkte Ideen

### 8.1 Bewusst offene Designfragen – nicht ohne Rückfrage festlegen

1. Welche Item-Persistenz ist langfristig gewünscht? Vorläufiges Testmodell: zufällige seltene Items wirken nur im aktuellen Run und werden nicht mitgenommen. Dauerhafte Ausrüstung beziehungsweise Archiv-/Freischalteinträge sind spätere offene Entscheidungen.
2. Reset freiwillig, beim Tod oder beides? Was passiert mit bereits eingesammeltem Loot?
3. Welche Art Meta-Fortschritt überwiegt langfristig: begrenzte Werte, horizontale Optionen, Ausrüstung oder ein Mix?
4. Ab wann sind frühe Wellen langatmig, und wie kann das Spiel den Wiedereinstieg beschleunigen?
5. Wie sehr soll der Spieler im Run seine Karten gezielt beeinflussen dürfen (Neuwurf, Pools, seltene Synergien)?

Diese Punkte blockieren **P0 nicht**. Entscheidungen fallen erst, wenn der dazugehörige Loop konkret entworfen oder getestet wird.

### 8.2 Archiv: 22 frühere GDD-Ideen (Ideenpool, **nicht** automatisch verbindlicher Scope)

Die frühere Feature-Sammlung enthält: (1) Build-Vielfalt; (2) Synergie von Skills, Loot und Talenten; (3) Grundklassen Magier/Krieger/Bogenschütze mit späteren Spezialisierungen; (4) Freiheit innerhalb der Spezialisierung; (5) Skills per Level und Modifikatoren als Loot; (6) Skill-Slots plus Ausrüstungseffekte; (7) zufällige Items und Uniques; (8) Hub plus Dungeon-Runs; (9) klassischer Tod ohne Verlust bereits erworbener Beute; (10) endlose Schwierigkeit; (11) wählbare Startstufe und mehrere Ebenen pro Run; (12) modulare Raumszenen; (13) lineare Dungeons; (14) fließende Kämpfe und besondere Elite-/Bossarenen; (15) wachsende Power-Fantasy; (16) Mana/Ressourcen plus Cooldowns; (17) fünf bis sechs aktive Skills; (18) verzweigter Klassenbaum und Spezialisierungstalente; (19) Respec gegen Spielwährung; (20) zunächst Loot statt Crafting, später Life-Skilling; (21) Magier als Startklasse; (22) Stylized Dark Fantasy.

**Einordnung:** Manche Ideen passen weiterhin gut zur Vision. Andere – besonders Item-Persistenz, Tod, Dauerbuilds, feste Klassen, Hub-Komplexität – stehen möglicherweise im Konflikt mit dem neuen Run-/Prestige-Konzept. **Neuere Vision ersetzt hier keine offene Produktentscheidung; Codex darf Widersprüche nicht eigenmächtig lösen.**

### 8.3 Zukunfts-Backlog (ungeordnet, keine Implementierungsfreigabe)

- Modulare, zufällig aneinandergereihte Dungeon-Räume mit linearem Fortschritt.
- Encounter Director mit Gegnerbudgets und Rollen.
- Elite-Modifikatoren wie schnell, explosiv, vampirisch.
- Skills, die modular verändert werden; zufällige Gegenstandsattribute und wenige handgefertigte Uniques.
- Mehr Klassen/Archetypen; Talente und Spezialisierungen.
- Sichtbares Hideout, Schmied, gesammelte Ressourcen, Rezepte, Crafting und Life-Skilling.
- Hochwertigere Charakteranimationen, VFX, Sounds und UI.

---

### 8.4 INV1 – Gegenstände bewusst ausrüsten

**Feedback vom 16.10.2026:** Nutzer bewertet Look and Feel positiv und berichtet, dass Echoes funktioniert. Dev-Konsole noch nicht selbst geprüft. Die Wirkung des Cinder Codex ist beim Fund unklar; sofortige automatische Aktivierung wirkt wie ein Run-Power-up. Gewünscht ist ein stärkeres Item-/Equipment-Gefühl mit Inventar und Ausrüstungswechsel während des Runs.

**Status / Planbezug:** Vom Nutzer am 16.10.2026 bestätigt und nach Git-/Screenshot-Checkpoint implementiert, technisch geprüft; manuelle Spielabnahme offen. **Bestätigte Abweichung vom bisherigen Plan:** Erweitert den P1-Test über „ein Drop, kein Inventar“ hinaus: Aufheben bedeutet Besitz im Run, erst Ausrüsten aktiviert den Effekt. Karten nach Wellen und Echoes am Run-Ende bleiben erhalten. Beim nächsten Run werden Items weiterhin zurückgesetzt; dauerhafte Item-Persistenz ist damit nicht beschlossen.

**Erlebnisziel:** Einen Fund verstehen und zwischen nachvollziehbaren Ausrüstungsoptionen wählen können. Erfolgskriterium: Spieler kann vor dem Ausrüsten erklären, was der Gegenstand macht, einen bewussten Tausch vornehmen und die Änderung im Kampf erkennen.

**Umgesetztes bestätigtes Paket:**
- Kleine Run-Tasche mit acht Feldern und zwei Ausrüstungsplätzen: Zepter und Buch, passend zum Apprentice. Slotzahl und Größe sind für das bestätigte INV1-Paket vorgesehen.
- Vier feste Testgegenstände: Ember Scepter (+30 % Schaden), Swift Scepter (20 % kürzeres Zauberintervall), Cinder Codex (Radius 85 / 60 % Splash) und Focus Grimoire (+40 % direkter Schaden statt Splash). Ausrüstungs-Schadensboni addieren sich und multiplizieren anschließend den kartengestützten Schaden; Swift multipliziert das Intervall nach Karten. Startwerte zum Testen, in F1 veränderbar. Codex weiterhin 2 % pro berechtigtem Kill und maximal ein natürlicher Fund pro Run; ohne Codex-Drop separater 10-%-Wurf, gleichverteilt auf die anderen drei Items. Bodenlimit 16; volle Tasche lässt Funde liegen. Keine prozeduralen Affixe oder weitere Rarity-Stufen.
- Bodenfund zeigt beim Annähern Name, Gegenstandstyp und eine kurze Wirkung. Aufheben legt ihn in die Tasche, aktiviert ihn noch nicht und öffnet kein erzwungenes Kampffenster. Kurzer Fundhinweis verweist auf das Inventar.
- Inventar zeigt Icon/Name, passende Slotart, verständliche Wirkung, Effektwerte und Vergleich mit dem ausgerüsteten Gegenstand. Ausgerüstete Slots bleiben sichtbar. Beispielbeschreibung: „Your fireballs deal splash damage to nearby enemies.“ Entdeckung bleibt im Experimentieren mit Kombinationen möglich.
- I öffnet direkt das pausierte Inventar; das Escape-Pausenmenü besitzt einen Equipment-Zugang. Escape schließt zunächst die aktuelle Oberfläche und kehrt in den vorherigen Zustand zurück. F1 über dem Inventar und ausstehende Wellenkarten bewahren den vorherigen Zustand; das Run-Ergebnis schließt das Inventar.
- Ein-/Auswechseln und Ablegen mit klaren Schaltflächen; kein Drag-and-drop-Zwang. Volle Tasche lässt Bodenfunde liegen; Ausrüstungswechsel bewahrt das vorherige Item. Kein stilles Löschen.
- Gemeinsame tatsächliche Werteberechnung für Karten + Ausrüstung + F1, Vergleich und Kampf. Bestehenden Codex-Effekt weiterverwenden. F1 um vorhandene Itemwerte und gezielte Testfunde ergänzen, aktuelle Profile kompatibel migrieren beziehungsweise verständlich validieren.

**Bewusst außerhalb:** Permanente Item-Sammlung, Handel, Händler/Hideout, Crafting, mehrere Klassen, neue Gegner, weitere Währungen und XP-/Sammelfortschritt. Neue Gegenstände sollen vorhandene Kampfwirkungen nutzen.

**Prüfung:** 58 Arena- + 54 Loot/Konsole- + 46 Inventarprüfungen = 158 / 0 Fehler. Darunter Aufnahme ohne Aktivierung, echte Splash-Treffer nach Ausrüstung, exaktes Entfernen alter Boni, volle Tasche/Swap/Ablegen, Pause/F1/Karten, Neustart-Reset und Save-/Profilvalidierung einschließlich alter 28-Werte-Profile. Fünf geänderte Gameplay-Scripts durch Godot MCP validiert. Drei native D3D12-Vorschauen gesichtet und archiviert. Technische Checks ersetzen nicht den manuellen Test des Verstehens/Entscheidens.

**Offen nach Implementierung:** Itemwerte und Dropverteilung im Spieltest abstimmen; versteht der Spieler den Fund vor dem Ausrüsten und fühlt sich der Tausch bedeutsam an? Langfristige Item-Persistenz bleibt eine separate Produktentscheidung. Das frühere Lootfall lieferte die Referenz für Tasche/Slots/Vergleich; sein komplettes Inventarsystem wurde nicht übernommen.

---
## 9. Aktueller Projektstatus – von Codex fortzuführen

**Projektphase:** P0/P1 technisch, P2-Belohnung/Speichern als Teilstand; bestätigtes INV1 technisch umgesetzt, Spielabnahme offen.  
**Spielprojekt:** `C:/Users/elias/Lootfall 2.0/lootfall-2.0/project.godot`; Chronik separat im OneDrive-Projektordner.  
**Neu umgesetzt:** Acht Taschenfelder, Zepter/Buch, vier feste Items, Beschreibung/Vergleich und sichere Wechsel; Aufheben aktiviert nichts.  
**Dev-Konsole:** F1, 33 Regler, Metriken/Testfunde, Standard-Reset, Profil v2 mit kompatiblem manuellem Laden alter v1-Profile; nur Debug-Builds.  
**Umfang/Sprache:** Wellenkarten und Echoes-Regeln erhalten; Code/UI Englisch. Kein Hideout/Kauf, dauerhafte Items, XP-Fortschritt oder neuer Gegnertyp.  
**Prüfung:** Godot 4.7.2: 58 Arena + 54 Loot/Konsole + 46 Inventar = 158, keine Fehler; fünf Scripts via MCP validiert.  
**Material:** Drei neue native D3D12-Vorschauen unter `Progress/captures/`; Vorher-Screenshot und bisherige Historie erhalten.  
**Feedback/Offen:** Bisheriges Look/Feel positiv, Echoes laut Nutzer funktional; INV1-Verständlichkeit, Balance, andere Fenstergrößen und Export noch manuell offen.  
**Nächster Schritt:** INV1 spielen: Fund erklären, Bücher/Zepter vergleichen, bewusst wechseln; anhand dieses Feedbacks nächstes Paket festlegen.
**Pflegeanweisung:** Diesen Abschnitt nach jeder tatsächlich abgeschlossenen Arbeit auf höchstens circa 10 kurze Zeilen aktualisieren. Nur verifizierte Ergebnisse als implementiert eintragen.

---

## 10. Entscheidungs- und Änderungslog – fortlaufend, knapp

| Datum | Typ | Änderung / Begründung | Status |
|---|---|---|---|
| 2026-10-16 | INV1 umgesetzt | Bestätigte Erweiterung des P1-Scopes: Run-Tasche und bewusstes Ausrüsten statt Aktivierung beim Aufheben; vier feste Items, F1-Erweiterung und alte Profile unterstützt. Wellenkarten/Echoes/Persistenz bewahrt | 158 Prüfungen ohne Fehler, MCP-Validierung, drei neue Engine-Vorschauen; manuelle Spielabnahme offen |
| 2026-10-16 | Designrichtung | Build-Experimentieren + Herausforderung + seltene Loot-Überraschungen als Kernmotivation | Entwurf, zur weiteren Validierung |
| 2026-10-16 | Konzept | Drei Loops: Kampf, Build-Run, Prestige/Hideout | Entwurf |
| 2026-10-16 | Scope | P0 bewusst klein; Meta-Loop erst nach erstem Spielspaß-Test implementieren | Entwurf |
| 2026-10-16 | Git / Archiv vor INV1 | Aktueller Spielstand lokal als bc2877f gesichert; Chronik erhält eigenen Commit, damit vorhandene Projektpfade bleiben. Laufzeit-Screenshot via MCP archiviert, 112 Prüfungen mit aktivem MCP erneut ohne Fehler | Spiel-Commit erstellt; zugehöriger Chronik-Checkpoint enthält diesen Eintrag |
| 2026-10-16 | MCP-Verbindung | Projektsettings aus geöffnetem Editor gelesen: Lootfall 2.0, Hauptszene arena.tscn; aktiven Szenenbaum erfolgreich gelesen (leere Node2D-Szene) | Live-Verbindung lesend bestätigt, keine Spieländerung |
| 2026-10-16 | MCP-Konfiguration | Auf ausdrücklichen Nutzerauftrag projektspezifischen Codex-Servereintrag angelegt; vorhandene Node-Brücke 1.0.4 nutzt das neue Spielverzeichnis. TOML/Pfade und Brückenstart geprüft | Konfiguriert; Codex-Neustart und lesender Editor-Verbindungstest ausstehend |
| 2026-10-16 | Feedback / Planung INV1 | Nutzer bestätigt Look/Feel und Echoes; Codex-Wirkung unklar, Fund fühlt sich wie Power-up an. Inventar und bewusste Ausrüstungswechsel als nächster Diskussionsvorschlag, explizite Erweiterung des bisherigen P1-Scope | Feedback dokumentiert; INV1 noch nicht zur Implementierung beauftragt; F1 manuell ungeprüft |
| 2026-10-16 | Loot / Echoes / Dev-Konsole | Nach Nutzerauftrag Cinder Codex, einmalige persistente Echoes-Auszahlung nach abgeschlossenen Wellen und F1 mit 28 Reglern/Metriken/Profilen umgesetzt; 112 Prüfungen ohne Fehler, native Vorschauen geprüft | Technisch geprüft; manuelle Abnahme offen; P2-Ausgaben noch ausstehend |
| 2026-10-16 | Erste Loot-/Belohnungsidee | Zufällige seltene Items verstärken den aktuellen Run, ermöglichen höhere Wellen und damit später mehr Echoes am Run-Ende. Für den ersten Test keine Item-Übernahme zwischen Runs; Karten bleiben wellenbasiert | Vorläufiges Konzept auf Nutzerwunsch, noch nicht implementiert; Werte und Langzeit-Persistenz offen |
| 2026-10-16 | Planbindung / Belohnung | Nutzer verwirft Sammelfortschritt statt Wellenkarten und legt Belohnung am Run-Ende fest; vorläufiger Ressourcenname Echoes durch Codex gewählt. Planabgleich und explizite Bestätigung von Designabweichungen verbindlich festgehalten | Designentscheidung, noch nicht implementiert; Item-Persistenz offen |
| 2026-10-16 | Spieltestfeedback | Nutzer berichtet bereits viel Spielspaß und wünscht einsammelbare Ressourcen sowie etwas mehr Komplexität. Keine vollständige Detailabnahme oder Festlegung der Ressourcenwirkung daraus ableiten | Positives Erstfeedback; Folgepaket in Diskussion |
| 2026-10-16 | P0 | Arena-Paket nach Nutzerfreigabe umgesetzt; Code/UI Englisch, sechs Wellen, zwei Upgrade-Ereignisse, Session-Bestwelle; 58 Prüfungen ohne Fehler und native Vorschauen | Technisch geprüft, manuelle Abnahme offen |
| 2026-10-16 | Dokumentation | Nutzer wünscht Entwicklungschronik für mögliches YouTube-Devlog; HTML-Gestaltung und fünf Medien aus dem früheren Lootfall lokal übernommen, klar als Historie markiert | Dateien vorhanden; kein neuer Gameplay-Stand |
| 2026-10-16 | Workflow | Dieses Dokument als einzige gepflegte Planungsquelle, Implementierungen nur nach freigegebenem Scope | Festgelegte Arbeitsregel |

**Bei Updates:** Nur wesentliche Produktentscheidungen, Scopeänderungen und überprüfte Meilensteine ergänzen. Keine täglichen Mini-Logs, langen Coding-Protokolle oder vollständigen Chat-Transkripte hier speichern.

---

## 11. Startauftrag für das neue Codex-Projekt (einmalig)

> Lies `LOOTFALL_MASTERPLAN.md` und verwende die dort definierten Statuskennzeichnungen. Inspiziere zunächst das tatsächlich geöffnete Godot-Projekt beziehungsweise den leeren Projektordner. **Schreibe noch keinen Gameplay-Code.** Gib mir eine knappe Bestandsaufnahme: Was existiert, was fehlt für P0, welche zwei bis drei kleinsten nächsten Arbeitspakete schlägst du vor und welche Risiken siehst du? Bevor du neue Systeme implementierst, warte auf meine Freigabe. Ändere die Vision und die offenen Produktentscheidungen nicht selbstständig. Pflege anschließend dieses Masterdokument ausschließlich mit nachgewiesenen Projektfortschritten und freigegebenen Änderungen. Keine kostenpflichtigen Dienste.

---

### Abschließende Arbeitsregel

**Nicht die Anzahl der Features maximieren, sondern die Menge an nachgewiesenem Spielspaß pro Stunde Entwicklungsarbeit.**
