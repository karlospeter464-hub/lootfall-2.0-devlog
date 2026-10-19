# LOOTFALL — Masterplan für Game Design & Entwicklung

**Version:** 1.3 · **Stand:** 19. Oktober 2026
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

**[ENTSCHEIDUNG, 18.10.2026] Design-Nordstern / Systeminteraktion:** *„Jeder Run ermöglicht eine eigene Strategie, deren Stärken und Schwächen ich gegen unterschiedliche Gegner auf die Probe stelle.“* Karten, Equipment, Gegnerrollen und dauerhaftes Talentwachstum sollen **situationsabhängige Entscheidungen** erzeugen, nicht nur parallel Zahlen erhöhen.

**[ENTSCHEIDUNG] Soft-Counter statt harter Immunitäten (A mit Elementen von B):** Unterschiedliche Builds dürfen klare Stärken/Schwächen haben; alle sollen mit Geschick, Positionierung und klugen Entscheidungen grundsätzlich spielbar bleiben. Spezialisierung ist erwünscht, Misch-Builds sind eine Option, keine Pflicht. Kein einzelner Build soll **unter allen Testbedingungen** offensichtlich überlegen sein. Das ist ein **Designziel**, kein bereits bestätigter Balancing-Zustand.

**[ENTSCHEIDUNG] Vorgehensweise:** Erst vorhandene Wirkungsklassen (Schaden/Treffer, Angriffstakt, Fläche) gegen konkrete Gegnerrollen testen. **Kein umfassendes Kampfstatistik-/Resistenz-/Rüstungsdurchdringungs-System vor dem Ergebnis dieses Tests.** Weitere Werte nur ergänzen, wenn dadurch eine nachweisbar neue Entscheidung entsteht.

### 1.3 Nicht-Ziele für den Anfang

Kein Multiplayer, keine Online-Ökonomie, keine vollständige ARPG-Kampagne, keine neun Klassen-/Spezialisierungsbäume, keine große Crafting-Ökonomie, kein ausgebautes Life-Skilling. Diese Ideen dürfen die ersten Experimente nicht verzögern.

---

## 2. Die drei ineinandergreifenden Gameplay-Loops

### Loop A — Kampf (Sekunden)
**Gegner wahrnehmen → Positionieren & Angreifen → Trefferrückmeldung → Gegner besiegen → nächste Bedrohung.**

*Qualitätsfrage:* Ist die Aktion selbst verständlich, kontrollierbar und befriedigend – auch ohne viele Effekte oder Items?

### Loop B — Build-Run (Minuten)
**1–3 Wellen bestehen → 1 aus 3 Belohnungskarten wählen → den Build verändern → stärkere Wellen bewältigen → seltenen Loot finden → eigenen Rekord herausfordern.**

**[ENTSCHEIDUNG / IMPLEMENTIERT – CE2, 19.10.2026]** Kein regulärer Sieg nach Welle 6. Aufstieg bis Tod oder technischem Sicherheitsstopp (Standard 100), Boss bei jeder fünften Welle. Karten nach Stufe 2/4/5 jedes Fünferblocks; Bosskarten nutzen vorerst dieselben drei Mechaniken. Ziel ungefähr 15–20 Minuten pro typischem Run, keine Zeitgrenze und noch kein gemessener Balancezustand. Details und bestätigte Abweichungen in §8.11.

- **[HYPOTHESE]** Drei Kartentypen: **Statuswerte**, **Fähigkeiten/Skill-Modifikatoren**, **Items**. Nicht zwingend in jeder Auswahl eine Karte jeder Art; zunächst verständlich präsentieren.
- **[IMPLEMENTIERT – aktueller Stand 18.10.2026]** Zufällige Run-Items ergänzen die wellenbasierten Kartenentscheidungen. Gegenstände werden in einer Run-Tasche gesammelt und erst beim bewussten Ausrüsten aktiv; beim Neustart werden sie zurückgesetzt. Vier feste Testgegenstände (Ember Scepter, Swift Scepter, Focus Grimoire, Cinder Codex) mit Rarity-Kaskade und einem Itemwurf von 10 % pro berechtigtem Kill gemäß §8.4/§8.7. Die frühere isolierte 2-%-Codex-Dropregel wurde **abgelöst** und darf nicht erneut verwendet werden. Langfristige Item-Persistenz bleibt offen. Seltene Funde können helfen, mehr Wellen zu schaffen und so am Run-Ende mehr Echoes zu erhalten.
- **[ENTSCHEIDUNG]** Entdeckung und Herausforderung sind wichtiger als endloses numerisches Grinden.

*Qualitätsfrage:* Entstehen durch Kartenentscheidungen erkennbar verschiedene Spielstile? Hat man Lust, eine andere Kombination auszuprobieren?

### Loop C — Prestige / Meta-Fortschritt (viele Runs)
**[ENTSCHEIDUNG, aktualisiert CE2] Run beenden (Tod oder ausdrücklich technischer Sicherheitsstopp) → Ergebnis und Echoes erhalten → zur Stadt / ins Hideout zurückkehren → Echoes im dauerhaften Skilltree ausgeben → nächster Run ab Welle 1.**

- **[ENTSCHEIDUNG / IMPLEMENTIERT]** Der Hideout-Fortschritt erfolgt über einen vernetzten dauerhaften Passivbaum nach PoE-Vorbild mit Grundwertknoten, größeren Zwischenzielen und spielstilprägenden Boni. Eine erste Fassung mit **15 vernetzten Knoten** und kostenlosen Resets ist umgesetzt (§8.5); ihre langfristige Balance/spielerische Wirkung bleibt zu prüfen. Klassenwahl ist ein separates späteres System.

- **[ENTSCHEIDUNG]** Eine Meta-Ressource mit vorläufigem englischem Namen **„Echoes“** (Namenswahl für jetzt an Codex delegiert). Belohnung erfolgt am Run-Ende auf dem Ergebnisbildschirm, keine Ressourcen-/XP-Sammelleiste als Ersatz für die wellenbasierte Kartenauswahl. **[HYPOTHESE – erstes Belohnungsmodell]** Höherer Wellenfortschritt soll mehr Echoes ergeben; zufällige Run-Items helfen indirekt, diesen Fortschritt zu erreichen. Keine zusätzliche direkte Echoes-Belohnung für den bloßen Itemfund vorgesehen. Aktuelles CE2-Modell: Bis Welle 6 unverändert 10 × Summe der abgeschlossenen Wellenstufen; danach zusätzliche 25 Echoes je Welle mit +2 je Folgewelle (§8.11), einmalig bei Tod oder technischem Sicherheitsstopp am Ergebnisbildschirm. Eine nur erreichte Welle zählt nicht zur Auszahlung; App-Schließen während des Runs zahlt nichts aus. Der Faktor ist in F1 einstellbar. Diese Werte sind Balancing-Startwerte, keine endgültige Balanceentscheidung.
- **[ENTSCHEIDUNG, P2]** Erste Stadt als Menü: Emberhaven, Skilltree und Run-Start. Keine begehbare Stadt, zusätzlichen NPCs, Händler oder Archiv-Freischaltungen in diesem Paket.
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

**Bestätigter Zusatzumfang, 17.10.2026:** 1 Meta-Währung, Ergebnisbildschirm, Rückkehr ins Stadtmenü Emberhaven, 15 verbundene Skilltree-Knoten mit Echoes-Käufen und gespeicherten Boni, erneuter Run-Start. **Bestätigte Abweichung vom ursprünglichen Plan:** Der Baum ersetzt den zunächst vorgeschlagenen Umfang von nur 1–2 permanenten Verbesserungen. Alle Knoten gleichzeitig ausbaubar; kostenloser vollständiger Reset erstattet tatsächlich gezahlte Preise. Details und Startwerte in Abschnitt 8.5. Keine begehbare Stadt oder weiteren Stadt-Systeme.

**Belohnungsmodell bewahrt:** Echoes bei Tod/Sieg einmalig am Ergebnis, 10 × Summe der abgeschlossenen Wellenstufen. Seltene Run-Items helfen indirekt, weiterzukommen. Die Stadt zahlt nicht erneut aus; bei fehlgeschlagener Belohnungsspeicherung bleibt die Rückkehr bis zum erfolgreichen Retry gesperrt.

**Abnahme:** Run abschließen → Ressource erhalten → Verbesserung erwerben → neuer Run → Effekt nach Neustart tatsächlich vorhanden; keine fehlerhaften Doppelbelohnungen.

**Technischer Stand:** Vollständiger Loop samt Stadt, Käufen, kostenlosem Reset und nächstem Run umgesetzt und automatisiert geprüft. Alt-Wallets bleiben ladbar; Wallet und Talente werden gemeinsam gespeichert. P2 technisch geschlossen; manuelle Abnahme von Motivation, Baumverständnis und Schwierigkeit steht aus.

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

**Bestätigte Hideout-Richtung (17.10.2026):** Dauerhafter vernetzter Echoes-Passivbaum als Grundlage des Spiels: Grundwerte, größere Zwischenziele und besondere Boni, inspiriert von Path of Exile. Erstes P2-Paket gemäß Abschnitt 8.5 bestätigt und technisch umgesetzt. Klassenwahl separat. Aktuell direkter Echoes-Kauf, alle Knoten gleichzeitig ausbaubar, vollständiger kostenloser Reset. Langfristige Erweiterungen bleiben offen; Spielerrecherche und Quellen in `HIDEOUT_RESEARCH.md` sind keine zusätzliche Feature-Freigabe.

**Bestätigte Klassenrichtung (16.10.2026):** Spätere Auswahl zwischen Krieger, Bogenschütze und Magier; zunächst je ein unterscheidbarer Build als Ausgangspunkt. Weitere Spielweisen und Komplexität sollen über diese Klassen und bestehende Karten/Items entstehen. Vorerst das Spiel mit dem Magier weiterentwickeln und seinen aktuellen Hauptangriff beibehalten. Der vorgeschlagene aufgeladene Feuerball wird für jetzt verworfen. Dies ist eine Richtungsentscheidung, kein Auftrag, die anderen Klassen oder ein Klassenframework sofort zu implementieren; konkrete Klassenmechaniken bleiben offen.

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
### 8.5 P2 – Stadt und erster dauerhafter Skilltree

**Freigabe:** Nutzer bestätigt das konkret vorgeschlagene Paket mit „yes lets go“: Stadtmenü, 15 vernetzte Knoten, drei Äste/Abschlussboni, alle Knoten gleichzeitig nutzbar, kostenlose vollständige Rückerstattung, F1-Regler, Loot-Kürzung und Dokumentation/Git. Startwerte technisch innerhalb dieses Pakets gewählt, noch kein abgenommenes Balancing.

**Implementiert:** App startet in Emberhaven → Start Run → Tod/Sieg/gespeicherte Echoes → Return to Town → Talente kaufen → Start Run. Pro Ast drei Grundwerte, ein stärkeres Zwischenziel und ein Abschlussbonus. Kauf eines Knotens verlangt einen beliebigen seiner ausgewiesenen Vorgänger; Querverbindungen Power II → Vitality III, Vitality II → Flow III und Flow II → Power III. Preise je Tiefe 30/45/65/90/130, vollständiger Baum 1080 Echoes.

| Ast | Drei Grundwerte / Zwischenziel | Abschlussbonus |
|---|---|---|
| Power | Je +4 % Schaden / +8 % Schaden | First Spark: +35 % direkter Trefferschaden gegen unversehrte Gegner; kein zusätzlicher Splash-Multiplikator |
| Vitality | Je +5 % Maximalleben / +10 % Maximalleben | Renewal: einmal pro abgeschlossener Welle 6 % des effektiven Maximallebens heilen, maximal bis voll |
| Flow | Je 3 % kürzeres Angriffsintervall / 5 % kürzeres Intervall | Second Wind: nach nichttödlichem Lebensverlust für 3 s ein weiteres 20 % kürzeres Intervall; erneuter Treffer erneuert Dauer, stapelt nicht |

**Verrechnung / Persistenz:** Vollausbau +20 % Schaden, +25 % Leben, 14 % kürzeres Intervall plus Abschlussboni. Boni innerhalb eines Asts addieren; Schaden/Intervall multiplizieren anschließend mit Karten und Gear. Flow gesamt auf 60 % Reduktion begrenzt. Kaufbesitz als Snapshot beim Run-Start übernehmen, F1-Werte aktiver Talente live abstimmbar. Zurücksetzen erstattet bezahlte Ledger-Preise, unabhängig von aktuellen Kosten. Progress v2 speichert Wallet/Bestwelle/Talente gemeinsam, liest v1-Wallets ohne automatische Umschreibung. Profile v3 (48 Werte) unterstützen v1/v2 mit Defaults für neue Felder. Run-Items bleiben ungespeichert.

**Prüfung / offen:** 59 Arena + 54 Loot/Konsole + 46 Inventar + 69 Stadt/Baum = 228 / 0 Fehler; Stadt/Baum zusätzlich nativ unter D3D12 mit simuliertem Viewport-Mauskauf geprüft. Neun Gameplay-Scripts via Godot MCP validiert. Vier neue Engine-Vorschauen archiviert. Kostenkurve, Langzeitmotivation und die Stärke gegenüber sechs Wellen bleiben im menschlichen Spieltest zu beurteilen. Keine Klassen, neuen Items, zusätzlichen Angriffseingaben oder begehbare Stadt umgesetzt.

---

### 8.6 Folgeplanung nach P2-Spieltest – Entscheidungen im Kampf und Loot-Stau

**Freigabe / Stand 18.10.2026:** Nutzer bestätigt das Begegnungs-/Entsorgungspaket und wünscht zusätzlich Seltenheiten mit kaskadierenden Würfen. Unabhängig umsetzbarer Teil fertig: Cinder Seer ab Welle 2, jede vierte Spawnposition wenn Cap erlaubt, maximal zwei gleichzeitig; Gesamtlimit als Testwert 12. Seer markiert eine feste Position für 1,1 s, trifft Radius 38 mit konfiguriertem Gegnerschaden und erholt sich 2,8 s. Bewegung aus dem Kreis vermeidet den Treffer, Tod cancelt den vorbereiteten Angriff, Pause/Freeze halten ihn an. Destroy selected entfernt ausschließlich ausgewählte Taschenitems ohne Bodenfund oder Belohnung. Keine automatische Vernichtung. F1 52 Regler, Profile v4 lesen v1/v2/v3. 247 Checks ohne Fehler; vier Scripts und neuer Test via MCP validiert, zwei native Vorschauen archiviert. Rarity-Erweiterung wartet auf offene Regeln.

**Nutzerbeobachtung:** P2/Skilltree machen Spaß und greifen gut in den Loop. Für die langfristige Identität fehlt jedoch Tiefe jenseits größerer Gegnerzahlen und höheren Feuertempos. Unerwünschte Funde füllen Tasche und Boden; Entsorgung wird gewünscht.

**Hypothese:** Kampfentscheidungen benötigen unterschiedliche Bedrohungen. Der aktuelle einzelne Verfolger erzeugt vor allem Abstandhalten und Dauerschießen; reine Zahlen-/Baumerweiterungen ändern das kaum. Vorschlag für ein nächstes abgegrenztes Paket: ein klar angekündigter Fernkampfgegner zusammen mit bestehenden Nahkämpfern, begrenzte gleichzeitige Gegnerzahl, Test der Zielpriorisierung/Positionierung. Bezug Loop A und spätere Gegnerrollen; noch keine Freigabe oder feste Einordnung der Folgephase.

**Loot-Vorschlag:** Destroy selected im pausierten Inventar ohne direkte Echoes oder neue Ressource; Ablegen allein löst den Stau nicht. Weil alle vier Items feste Werte haben, sind identische Dubletten derzeit kein neuer Vergleich. Optional identische Dubletten beim Aufheben automatisch entsorgen, während mindestens ein Exemplar in Tasche/Ausrüstung erhalten bleibt. **Abweichung vom bisherigen Verhalten, noch nicht bestätigt:** Automatische Vernichtung würde bisher bewahrte Run-Items entfernen und verlangt eine bewusste Freigabe. Keine Item-Persistenz, neuen Belohnungsauslöser oder Crafting implizieren.

**Offen:** Konkretes nächstes Paket und Entsorgungsregeln gemeinsam festlegen. Räume mit Hindernissen/Zielen und stärker situative Items als spätere Ideen; nicht gemeinsam automatisch implementieren. Skilltree-Richtung bleibt bestehen.

### 8.7 Seltenheitskaskade – bestätigt und technisch umgesetzt

**Bestätigte Entscheidungen (18.10.2026):** Nutzer wählt separate Lootmenge und eine Seltenheitskaskade pro erfolgreichem Itemdrop sowie feste Itemtypen je Stufe. Keine Qualitätsvarianten oder zufälligen Affixe. **Bestätigte Abweichung vom bisherigen Lootmodell:** Die separate Codex-/Dreierpool-Regel wird dadurch ersetzt. Itemeffekte, Run-Reset, Karten und Echoes-Auszahlung bleiben bewahrt.

**Startwerte umgesetzt, in F1 änderbar:** 10 % Itemchance je berechtigtem Kill, danach Legendary 2 % → Rare 25 % → Magic 50 % → Normal als garantierter Rest. Jede Stufe erhält einen eigenen Wurf nur nach Fehlschlag höherer Stufen; erster Erfolg mit verfügbarem Pool gewinnt, höchstens ein Item pro Kill. Tatsächliche Anteile pro Item 2 / 24,5 / 36,75 / 36,75 %, pro Kill 0,2 / 2,45 / 3,675 / 3,675 %, solange der natürliche Codex verfügbar ist. Gesamterfolg an Bodenlimit und laufenden Kampf gebunden.

| Seltenheit | Fester Itemtyp | Kennzeichnung |
|---|---|---|
| Normal | Ember Scepter | Weiß |
| Magic | Swift Scepter | Blau |
| Rare | Focus Grimoire | Gold |
| Legendary | Cinder Codex | Orange |

**Bewahrte Grenze:** Ein natürlicher Codex pro Run. Ist er bereits gespawnt, kann der Legendary-Pool nicht mehr gewinnen; die Kaskade geht zu Rare weiter. Dann Anteile 0 / 25 / 37,5 / 37,5 % pro Item. Debug-Drops können weiterhin Duplikate erzeugen. Kein automatisches Löschen. Der Codex fällt mit diesem neuen Modell deutlich seltener als unter der alten 2-%-pro-Kill-Regel; Spielbalance ist noch zu prüfen.

**Darstellung / Profile:** Bodenname, Glühen, Icons und Inventartexte erhalten gemeinsame Rarity-Farben; Auswahl nennt die Seltenheit zusätzlich als Text. F1 jetzt 54 Felder und tatsächliche Anteile pro Item/pro Kill inklusive ausgeschöpftem Codex-Pool. Profile v5 lesen v1–v4 mit Defaults für Rare/Magic; alte Zahlen bleiben erhalten, der Hinweis erklärt den Wechsel zur Per-Item-Kaskade. Alte Profile stellen den alten Dropalgorithmus nicht wieder her. Walletformat unverändert.

**Prüfung:** Insgesamt 275 Checks ohne Fehler, davon 28 neue Rarity-Prüfungen einschließlich exakter Reihenfolge, Abbruch, 0/100-%-Grenzen, 100.000 deterministisch geseedeter Zufallsziehungen, realer Drops und Legacy-Profilen. Fünf Gameplay-Scripts plus neue Suite via Godot MCP validiert. Drei neue native D3D12-Vorschauen gesichtet; menschlicher Balance-/Lootspieltest offen.

**Quelle:** Nutzer nennt Candlesan. Recherche ordnet den Namen Wyatt Cheng zu (Eigenprofil https://x.com/candlesan/with_replies mit YouTube-Verweis); das konkrete Video über diese Kaskade wurde nicht identifiziert. Keine Aussage über eine exakte WoW-Implementierung aus dieser Referenz abgeleitet.

---

### 8.8 Feedback und Verwertung – Entwurf, noch keine Umsetzung

**Nutzerfeedback (18.10.2026):** Fernkämpfer und Seltenheiten machen den Run interessanter. Unerwünschte Items sollen künftig Echoes statt ersatzloser Vernichtung geben; seltenere Items sollen mehr wert sein. Itemlevel als spätere Wertdimension mitdenken, jetzt noch nicht implementieren.

**Abweichung vom Plan:** Verwertung ergänzt einen direkten Echoes-Ertrag aus Items; bisher zahlen ausschließlich abgeschlossene Wellen am Run-Ende. Richtung vom Nutzer gewünscht, konkrete Beträge und Auszahlungs-/Resetregeln noch offen. Bestehendes Spielverhalten bleibt bis zum abgegrenzten Implementierungsauftrag erhalten.

**[HYPOTHESE] Kleinster nächster Test:** Manuelle Verwertung eines ausgewählten Taschenitems ersetzt Destroy; ausgerüstete Items bleiben geschützt. Startwerte Normal 1 / Magic 2 / Rare 4 / Legendary 10 Echoes. Verwertungsertrag im Run vormerken und beim regulären Ergebnis einmalig zusätzlich auszahlen; keine automatische Verwertung und kein Ertrag allein durch Aufheben. Verhalten bei App-Schließen und nicht verwerteten Restitems ausdrücklich vor Umsetzung festlegen. Werte/Auszahlungszeitpunkt sind Vorschläge, keine bestätigte Balance.

**[SPÄTER] Itemlevel:** Seltenheit und Itemlevel getrennt behandeln. Denkmodell: Rarity-Grundwert × Itemlevel-Faktor; Level/Wert an die Fundquelle beim Drop binden, nicht an spätere Spielerwerte beim Verwerten. Keine Formel oder Zuordnung zu Wellen/Gebieten beschlossen; kein neues Spieler-XP-System, keine Affixe oder Qualitätsvarianten daraus ableiten.

**Prüffragen:** Wird Verwertung zur lästigen Pflicht, jeden Fund einzusammeln? Bleibt höhere Wellen schaffen attraktiver als leichte Wellen abzufarmen? Wie viele Runs soll der aktuelle Baum tragen? Unterschiedliche Item-Synergien und Begegnungen als folgende Vertiefung diskutieren. Recherche und eigene Ableitungen: `WYATT_CHENG_NOTES.md`.

---

### 8.9 CE1 – Combat Counterplay: Build-Stärken × Gegnerrollen

**Umsetzung nach separater ausdrücklicher CE1-Freigabe (18.10.2026): [IMPLEMENTIERT – technisch geprüft].** Rune Guardian ab Welle 3, jeder achte Spawnkandidat, maximal einer lebend innerhalb des Gesamtcaps. Bestehender Nahkampf, 4× Wellenleben, 0,55× Geschwindigkeit, Schaden `max(Eingang − 8, Eingang × 0,2)` einmalig auf direkte und Splash-Treffer. Seer: fünf direkte Projektiltreffer innerhalb der bisherigen 1,1 s brechen den Zauber ab; Splash zählt nicht, voller Erholungstimer 2,8 s, Trefferpunkte und BROKEN-Feedback. Seer-Leben als expliziter CE1-Testwert 3×: bisher wäre er vor fünf Treffern gestorben. Keine neuen Player-Stats oder Belohnungsregeln.

**Machbarkeit / Testbarkeit:** Ohne Talente 0,36 s Standard gegen 0,18432 s mit Swift + zwei Quick-Karten. Echter Projektiltest gegen Welle-3-Seer (102 HP): Rapid trifft fünfmal, unterbricht einmal, Seer lebt mit 32 HP; Heavy (40,46 Schaden, 0,36 s) tötet mit drei Treffern; Standard unterbricht nicht. F1 bietet alle neun Kombinationen aus bestehenden Builds und drei Gegnerarrangements nur mit isoliertem `--test-mode`, behält aktuelles Tuning und nutzt bestehendes Spawnbudget/Caps. Keine dauerhafte Talentänderung. F1 63 Werte, Profile v6 lesen v1–v5; neun neue Gegnerwerte gelten für neue Spawns.

**Verifikation:** 275 bisherige + 67 neue Checks = 342, keine Fehler. Rüstung/Minimum/Splash, echte Projektiltreffer, unzureichende Treffer, Pause/Freeze/Tod/Neustart, Caps, neun Arrangements und Legacy-Profile geprüft. Sechs Gameplay-Scripts via MCP gültig. Zwei native D3D12-Testvorschauen gesichtet und archiviert. **Offen:** Menschliche Abnahme der neun Matchups, Warnungslesbarkeit und ob Bewegung ungünstige Builds ausreichend ausgleicht. Technische Machbarkeit ist kein Nachweis, dass kein Build alle Begegnungen dominiert. Die nachfolgenden Designhypothesen bleiben Prüfziele.

**Status (18.10.2026): [ENTSCHEIDUNG – Designrichtung und Freigabe des eng begrenzten nächsten Experiments]; [HYPOTHESE – Matchups und Balancing].** Keine dieser Mechaniken ist allein durch diesen Eintrag bereits implementiert. Die einmalige konkrete Codex-Umsetzungsanweisung wird vom Creative Director separat erteilt; §0 und das Scope-Gate gelten weiterhin.

**Spielerlebnis / Hypothese:** Bei gleicher grundsätzlicher Spielbarkeit sollen drei aus **vorhandenen** Run-Karten/Gegenständen/Talenten gebildete Spielweisen in drei Kampfsituationen erkennbar unterschiedliche Vor- und Nachteile haben. Der Spieler versteht, wann und **warum** seine Entscheidungen einen Unterschied machen. Spielskill muss ungünstige Matchups kompensieren können (Soft-Counter), kein Gegner ist gegen eine Angriffsklasse immun.

**Build-Profile – Testfälle, keine neuen Klassen:**
- **Schnellfeuer:** kurze Angriffsintervalle und viele direkte Treffer, z. B. Swift Scepter / Flow; Stärke als Testhypothese: Zauber eines Seers unter Druck setzen.
- **Schwerer Einzeltreffer:** hoher direkter Schaden pro Treffer, z. B. Ember Scepter / Focus Grimoire / Power; Stärke: wirksam gegen Treffer-Rüstung.
- **Flächenschaden:** Cinder Codex / Explosionen gegen dicht stehende Gegner; Stärke: Schwärme. Legendärer Drop darf **nicht** als zufällige Voraussetzung für reproduzierbare Entwicklungstests fungieren – vorhandene F1-Testdrops nutzen.

| Begegnung / Gegnerrolle | Schnellfeuer | Einzeltreffer | Fläche | Status |
|---|---|---|---|---|
| **Verfolger-Schwarm**: viele kleine Gegner, Überkill bei Einzeltreffern | mittel | eher schwach | **stark** | Verfolger vorhanden; Schwarmkonfiguration zu testen |
| **Cinder Seer**: gefährlicher, angekündigter Zauber | **stark, falls unterbrechbar** | mittel (Tötung/Ausweichen) | eher schwach | Seer vorhanden; Unterbrechung als CE1-Test |
| **Runenwächter**: langsam, klar lesbare Treffer-Rüstung | eher schwach | **stark** | mittel / isoliert schwächer | **neuer** Gegner als CE1-Test |

**[HYPOTHESE] Kleinster mechanischer Entwurf:**
1. **Treffer-Rüstung beim Runenwächter:** Ein kleiner *flacher Abzug pro eingehendem Schadensereignis* (nicht pauschal % Schadensreduktion). Gegen kleine Treffer relativ stark, gegen große Treffer schwächer. **Kein Nullschaden:** Mindestrestdamage (z. B. 20 % des eingehenden Schadens) als konfigurierbare Testschranke. Konsistente Berechnung über direkte Treffer und Splash sicherstellen; keine Doppelberechnung und kein genereller Umbau aller Gegner/Schadensarten.
2. **Konzentrationsbruch beim Cinder Seer:** Eine ausreichende Anzahl **direkter** Projektiltreffer innerhalb seiner schon vorhandenen Angriffsvorbereitung kann einen angekündigten Zauber **einmalig abbrechen**. Splash zählt nicht als zusätzlicher Projektiltreffer; neue Angriffszyklen beginnen sauber von vorn. Schnellfeuer soll durch kürzere Intervalle im Vorteil sein, während andere Builds durch Töten, Ausweichen oder Positionieren bestehen. Vor Festlegung von Trefferzahl/Zeitfenster anhand **realer aktueller** Feuerintervalle prüfen, ob Standard- und Schnellfeuer damit tatsächlich unterscheidbar sind; bei unlösbarer Abstimmung als Blocker melden statt Zahlen zu erzwingen.
3. **Runenwächter-Spawn:** Frühestens in einer späteren Welle, niedrige Häufigkeit, höchstens einer gleichzeitig, existierendes Spawn-/Gesamtgegnerlimit, keine komplette Encounter-Director-Architektur. Seine Rolle und Rüstung müssen ohne aufwendige Assets durch Silhouette/Farbe/Trefferfeedback erkennbar sein.
4. **Parametrisierung:** Nur die tatsächlich nötigen Werte über vorhandene `@export`-/F1-Mechanismen konfigurierbar machen (Rüstungsabzug/Mindestrestdamage; Wächter-Spawn/Cap; Seer-Unterbrechungs-Trefferzahl/Zeitfenster/Schalter). Keine separate universelle Statistik-Engine.

**Bewusst NICHT Teil von CE1:** neuer Spielerwert `Armor Penetration`, Schadenstypen/Elementarresistenzen, Schilde, Status-Effekt-System, zusätzliche Skills/Klassen/Karten/Items, dauerhafte Talentänderungen, neue Währung oder Verwertungs-Echoes (§8.8 bleibt geparkt), Änderungen an Dropchance/Seltenheitskaskade, Inventar, Echoes-Auszahlung, Hideout, Run-Länge oder Persistenz. Auch kein generischer KI-/Rüstungs-/Effektbaukasten auf Verdacht.

**Validierung: zwei Ebenen**
- **Technisch:** Neue Schutzrechnung inkl. Minimum und Splash ohne doppelten Treffer; Seer unterbricht nur bei ausreichenden direkten Treffern im richtigen Zeitfenster und nur einmal; Nicht-Unterbrechung bei zu wenigen Treffern; Pausieren/Tod/Neustart setzen den Zustand sauber zurück; Spawn-Cap, bestehende F1-/Loot-/Save-/Run-Regeln bleiben intakt. Godot-Start/Parse- und fokussierte Regressionstests.
- **Spielerisch:** Möglichst gleiche Ausgangslage ohne Zufallsloot mittels vorhandenen Debug-Tools herstellen. Drei Build-Profile gegen Schwarm, Seer und Wächter spielen. Notieren: (a) ungefähre Kampfzeit bzw. Kills, (b) Schaden erlitten, (c) wie oft Seer unterbrochen wurde, (d) ob die Stärke/Schwäche sichtbar und verständlich war. **Erfolg:** unterschiedliche Vorteile werden spürbar, kein unlösbarer Konter, kein Build gewinnt alle drei Situationen offensichtlich. Ist dies nicht erfüllt, erst Parameter oder Begegnungen ändern, **keine** zusätzliche Stat-Ebene einführen.

**Arbeitsreihenfolge:** (1) Bestehende tatsächliche Combat-/Spawn-Berechnung kurz prüfen und Build-Werte ableiten; (2) minimalen Wächter und Rüstung integrieren; (3) Seer-Unterbrechung nur mit nachgewiesener Feasibility für Schnellfeuer implementieren; (4) Tests, manuelle Spieltest-Anleitung und Ergebnisse. Bei größerer Architekturabweichung oder neuen Player-Stats stoppen und Rücksprache halten. Alle vorgeschlagenen Defaultwerte sind reine Testwerte, nicht endgültige Balance.

**Nächste Entscheidung NACH dem Playtest:** Welche Interaktion erzeugte tatsächlich neue Entscheidungen? Erst dann über Armor Penetration, Rüstungsbruch, weitere Gegner, Encounter-Mixes oder horizontale Talente nachdenken.

---

### 8.10 CE1-Spieltest – Mechaniken früher erfahrbar und lesbarer machen

**Nutzerfeedback / Freigabe (18.10.2026):** Guardian funktioniert und macht den Kampf interessanter. Unterbrechung bleibt kaum erkennbar, weil Seer zu schnell sterben und schwer genug zu treffen sind. Zwei stärkere Guardians und sichtbarer abgeblockter Schaden gewünscht. Dies konkretisiert CE1; keine neuen Belohnungs-/Persistenzregeln.

**[IMPLEMENTIERT – technisch geprüft] Neue Testwerte, ersetzen die initialen Werte aus 8.9:** Guardian-Cap 2 (F1 0–2), jeder sechste Kandidat statt jedem achten, 6× statt 4× Wellenleben; Gesamtcap 12 bewahrt. Seer 6× statt 3× Wellenleben, Vorbereitung 1,4 statt 1,1 s, Erholung 2 statt 2,8 s, erste Vorbereitung nach 0,35 statt 1 s, bevorzugter Abstand 210 statt 280. Schwelle bleibt fünf direkte Treffer; Splash zählt nicht. Swift plus eine Quick-Karte kann nun bereits vor der zweiten Kartenwahl unterbrechen. INTERRUPT n/5 und einsekündiges BROKEN machen den Zusammenhang deutlicher.

**Schilddarstellung:** Bestehende flache Rüstung, kein neues Schild-HP-/Aufladesystem. Kontur leuchtet bei Treffern auf. Getrennte Zahlen zeigen tatsächlichen Schaden und absorbierten Anteil (14 Eingang → 6 Leben / 8 BLOCKED; 4 Eingang am Minimum → 0,8 Leben / 3,2 BLOCKED). Keine falsche Block-Zahl durch Overkill, keine zusätzlichen Treffer oder Ertragsmetriken. F1 weiterhin 63 Werte, Profile v6 unverändert und bestehende Werte bleiben beim Laden erhalten; Reset defaults stellt neue Startwerte her.

**Prüfung:** Alle sieben Suites: 275 bisherige + 74 Counterplay = 349 Checks ohne Fehler; vier geänderte Gameplay-Scripts via MCP gültig. Echter Projektiltest bei Welle 3 / 204 Seer-HP: Rapid unterbricht, sieben Treffer gesamt / 106 Restleben; Swift + eine Quick unterbricht, sechs Treffer / 120 Restleben; Heavy und Standard vier Treffer ohne Unterbrechung. Zwei natürliche Guardians unter Gesamtcap nachgewiesen; Block-Anzeige, Minimum und unveränderte dealt-damage-Metrik geprüft. Neue native D3D12-Vorschau gesichtet. Spielerische Wirkung bleibt erneut zu testen: weniger frühe Seer-Tode, erreichbare Unterbrechung unter Gegnerdruck, zwei Guardians ohne bloßen Zähigkeits-Grind.

---

### 8.11 CE2 – Ascent & Boss Milestones

**Freigabe:** Separater Nutzerauftrag vom 19.10.2026 erteilt die Umsetzung und ersetzt den dort erwähnten CE2A-Entwurf (kein eigener CE2A-Eintrag im lokalen Plan). **Bestätigte Abweichungen vom bisherigen Modell:** Sechs-Wellen-Sieg entfällt, wiederkehrende Karten/Bosse, zusätzliche Konfiguration und neue Echoes-Kurve nach Welle 6. Keine pauschale Freigabe anderer Masterplan-Features oder eines GitHub-Pushes.

**[IMPLEMENTIERT – technisch geprüft] Ablauf:** Standard-Sicherheitsgrenze 100, F1 5–100. Erreichen zeigt PROTOTYPE LIMIT REACHED / ausdrücklich kein Sieg; sichere einmalige Ergebnis-Auszahlung bleibt erhalten. Maximalstand weiterhin im vorhandenen Progress v2 (bis 100) am Run-Ende gespeichert, alte Wallets bleiben ladbar. Tod → Ergebnis → Emberhaven → bestehender Baum → Start bei Welle 1; alle bisherigen Reset-/Inventar-/Lootregeln erhalten.

**Karten / Grenzen:** Normal nach 2/4, Bosskarte nach 5 jedes Fünferblocks (bis 20: 2,4,5,7,9,10,12,14,15,17,19,20). Nur Power, Quick, Fan, Bosspräsentation ausdrücklich benannt. Effektives Intervall mindestens 0,08 s einschließlich Second Wind; höchstens neun Projektile pro Cast und 256 gleichzeitig. Quick/Fan am Limit gesperrt statt nutzloser Auswahl; Power bleibt verfügbar. Keine zusätzliche Kartenrarity.

**Bossrhythmus:** Rune Champion bei 5/15/25 usw. mit Guardian-Verhalten, Ash Prophet bei 10/20/30 usw. mit Seer-Verhalten. Zwei Sekunden Ankündigung, Krone/größere Figur, goldener Lebensbalken. Je ein Boss plus vier Begleiter als Standardbudget; derselbe Gesamtcap gilt auch bei 1. Rollen-Caps betreffen Begleiter, der Pflichtboss bleibt bei Rollen-Cap 0 vorhanden. Abschluss erst nach vollständigem Budget und allen Gegnern. Keine Extra-Echoes, garantierten Bossdrops oder zusätzliche Lootwürfe. Bosskill ist ein regulärer berechtigter Kill im bestehenden Lootmodell.

**Bosswerte / Anti-Dauerunterbrechung:** Champion 6× Guardian-Wellenleben, Prophet 9× Seer-Wellenleben; Bossangriff 1,5× Wellenwert (höchstens 200). Prophet-Radius 1,4× normal; Warnzeichnung gleicht Figurenskalierung aus, damit sichtbarer Kreis und Welt-Trefferradius übereinstimmen. Nach einem unterbrochenen Bosszauber ist der nächste angekündigte Cast als STEADY CAST geschützt, bleibt aber ausweichbar und durch Tod abbrechbar. Nach dessen Auflösung wieder unterbrechbar. Kleine Boss-Sonderregel, kein neues Statussystem.

**Schwierigkeitsmodell / Testwerte:** Normalbudget höchstens 28 (bestehende Basis 8 + 4 je Welle). Wellen 6/11/16/... verwenden Erholungsfaktor 0,8 auf Budget/Leben/Schaden und größeren Abstand zwischen Rollen-Kandidaten; Pause nach Boss doppelt. HP = (Basis + früher linearer Zuwachs bis Welle 6) × 1,14 je Folgewelle × Erholung; Seer/Guardian weiterhin 6× Rollenleben. Schaden +4 % je Welle; Spawnintervall ×0,97 je Welle, mindestens 0,18 s. Seer-/Guardian-Kandidaten in Zehnerblöcken häufiger, aktive Caps weiterhin 2/2 und Gesamtcap 12. Geschwindigkeit höchstens 200, Gesundheit höchstens 1.000.000 auch bei Bossmultiplikatoren; keine unbegrenzte Gegnerwarteschlange.

**Echoes:** Bis 6 unverändert 10/30/60/100/150/210 bei Defaultfaktor 10. Ab 7 zusätzliche 25, 27, 29, ... je abgeschlossener Welle; Grundbetrag und Zuwachs in F1 einstellbar. Insgesamt Welle 10 = 322, 15 = 507, 20 = 742. Keine Auszahlung für nur erreichte Wellen, während Kartenwahlen oder beim App-Schließen. Ertragskurve des längeren Runs muss gegen den vorhandenen 1080-Echoes-Baum geprüft werden; Baumkosten nicht eigenmächtig verändert.

**Seer-Vergleich:** Neuer Standard drei direkte Treffer, sechsfaches Leben erhalten. Kontrollierte Echtprojektile mit Rapid/Heavy/Area bei 3,4,5: Alle drei unterbrechen bei 3 und im getesteten Timing auch bei 4; bei 5 nur Rapid. Vier ist eine Timinggrenze, keine allgemeine Zusage. **Beobachtung:** Drei erleichtert die Mechanik, schwächt aber den ursprünglichen Schnellfeuer-Soft-Counter. Kein neuer Stat als Kompensation eingeführt; weitere Entscheidung nach menschlichem Spieltest.

**Debug / Metriken:** F1 71 Werte, Profile v7 lesen v1–v6 vorab validiert und ohne Umschreiben. Neue acht Felder für HP-Skalierung, Schadenswachstum, Budgetcap, Spawntakt, Bossleben/Begleiter und späte Echoes. Alte numerische Wellenlimits bleiben erhalten und bedeuten jetzt Sicherheitsstopp; Ladehinweis/Reset defaults erklären das. Isolierter Wave-Jump mit Seed 42, keine Belohnung für übersprungene Wellen. Wall-Zeit umfasst Karten, Inventar, Pause und F1; aktive Zeit separat. Pro Welle Combatzeit, HP-Verlust, Rollenmix, letzte fünf Zeilen in F1, nur im Run-Speicher.

**Verifikation:** 64 Arena + 54 Loot/Konsole + 46 Inventar + 69 Stadt/Baum + 19 Begegnung + 28 Rarity + 74 Counterplay + 249 Ascent = **603 Checks ohne Fehler**. Vollständige beschleunigte Abfolge 1–20 samt Bossen/Karten; Weiterlauf, Cap 1/0, Schutzcast, Pause/Inventar/F1, Maximalwerte, Projektilgrenzen, Legacy-v6-Profil, langfristige Auszahlung/Persistenz/Rückkehr geprüft. Sechs Gameplay-Scripts via MCP gültig. Vier native D3D12-Vorschauen für Ankündigung, Champion, Prophet und Bosskarte archiviert. Anleitung und Werte: englisches `CE2_PLAYTEST.md` im Spielprojekt. **Offen:** menschliche Run-Dauer 15–20 Minuten, Langzeitperformance, faire Todesursachen, Aufstiegskurve und Baumtempo; technische Tests belegen keine Spielbalance.

---

### 8.12 CE2-Spieltest – offene Planung nach Nutzerfeedback

**Beobachtungen vom 19.10.2026, keine Implementierungsfreigabe:**
- Seer-Unterbrechung motiviert Schnellfeuer noch zu wenig: Nahkämpfer erzeugen die unmittelbare Gefahr, beim Weglaufen verlässt man nebenbei auch Seer-Angriffsflächen. Gegnergewichtung und alternativ eine andere Motivation für schnelle Treffer gemeinsam planen; noch keine neue Mechanik beschlossen.
- Direktes Zielen mit der Maus auf Gegner wird häufiger genutzt, um nicht zu verfehlen. Reine Beobachtung; ausdrücklich vorerst keine Aktion.
- Ausrüstungswechsel für den zähen Champion macht Spaß, etwa zum Ember Scepter für mehr Schaden. Sorge: Die feste Bossfolge könnte mit der Zeit eine immer gleiche Ausrüstungsroutine erzeugen. Abwechslung planen, keine Änderung an Wechsel-/Inventarregeln beschlossen.
- Champion allein nach dem Tod der Begleiter lässt sich zu leicht umlaufen und beschießen. Eine zusätzliche Gefahr beziehungsweise Fähigkeit gegen dieses Verhalten ist zu diskutieren; konkrete Ausführung offen.
- Bewegungsgeschwindigkeit als spätere Wahl erwägen. Schießen während des Laufens ist bereits möglich; ein direkter Mehrschaden durch schnelleres Laufen ist deshalb nicht belegt. Taktischen Nutzen und Komfort im Spieltest unterscheiden.

**Planungsauftrag:** Gegenmaßnahmen und kleinsten nächsten Test gemeinsam festlegen. Keine dieser Beobachtungen ändert bisher Gameplay, Belohnungen, Fortschritt oder Persistenz. Aktueller Code und englische Testanleitung liegen im Spiel-Repository; dieser Abschnitt liefert ChatGPT den offenen Designkontext ohne private Chat-Transkripte.

### 8.13 CE3 – Build Discovery & Card Synergies

**Freigabe / Ziel:** Separater CE3-Nutzerauftrag vom 19.10.2026: Im Run ungewöhnliche Karten-/Itemkombinationen entdecken. **Bestätigte Abweichung vom Plan:** Die drei immer angebotenen Statistik-Karten werden durch einen sechs Karten großen Pool mit zufälligen Angeboten ersetzt. Bestehende Wellenzeitpunkte und Bossbelohnungen unverändert; keine weiteren Fortschritts-/Belohnungs-/Persistenzänderungen.

**Umgesetzt:** Bis zu drei unterschiedliche gültige Karten ohne Gewichtung nach Build oder garantierte Synergie. Seed reproduziert Angebote bei gleicher vorheriger RNG-Nutzung. Angebote bleiben bei Inventar/F1/Build-Refresh bestehen, ausgeschöpfte oder wirkungslose Karten entfallen. Bei völlig leerem Pool kein blockierender Auswahlbildschirm. Power/Quick/Fan innerhalb bestehender Grenzen wiederholbar; neue Mechanikkarten einmal pro Run wählbar.

**Neue Karten:** Ember Burst: direkter Projektil-Kill explodiert am besiegten Gegner, Radius 65, 40 % Projektilschaden, einmal je Gegner; indirekte Kills lösen keinen Burst aus. Piercing Flame: bis zu zwei unterschiedliche direkte Ziele je Feuerball, auch innerhalb eines Physikschritts; keine wiederholten direkten Treffer desselben Ziels. Overcharge: vier tatsächliche direkte Treffer laden den nächsten Haupt-/ersten Feuerball für +75 % Schaden. Seitenschüsse normal; indirekte Ereignisse zählen nicht, während READY keine weitere Ladung auf Vorrat. Abfeuern verbraucht die Ladung auch bei Verfehlen, abgelehnter Spawn am Projektilcap nicht. Ring/Hand/READY/Projektil markieren Ladung. Alle neuen Karten und Ladungen resetten mit dem Run.

**Wechselwirkungen:** Codex pro direktem Piercing-Treffer möglich, Primärziel jeweils ausgeschlossen. Burst und Codex können beide denselben überlebenden Nachbarn treffen; Guardian-Rüstung gilt je Ereignis. Burst löst keine rekursiven Burst-Ketten aus. Overcharge skaliert den Projektilschaden und damit abgeleiteten Flächenschaden; First Spark bleibt wie bisher nur direkt. Keine neue Effekt-Engine. 256 Projektile und maximal 512 kurzlebige visuelle Effekte, Schaden wird am visuellen Limit weiter berechnet.

**Debug / Verifikation:** Drei neue F1-Werte: Burst-Radius/Schadensanteil und Overcharge-Bonus; 74 Werte, Profile v8 lesen v1–v7 validiert ohne Umschreiben. Vorhandene isolierte Testarrangements um drei Seed-42-Builds ergänzt; nur mit `-- --test-mode`. Englische Anleitung `CE3_PLAYTEST.md`. 128 neue + 603 bestehende = **731 Checks ohne Fehler**. Vier Gameplay-Scripts via Godot MCP gültig. Kurze kombinierte Stress-Fixture mit 256 Projektilen/64 Gegnern, kein dauerhafter FPS-Nachweis. Zwei gesichtete native D3D12-Vorschauen, gestellte Auswahl und Kampfanordnung, kein menschlicher Run/Clip.

**Offen / Scope-Abgleich:** Erfolgskriterium bleibt menschlich zu prüfen: drei bis fünf natürliche Runs mit tatsächlich anderen Spielweisen statt nur anderen Zahlen. Seer-Gewichtung, neuer Schnellfeuer-Gegner, Champion-Ansturm, neue Items/Klassen, Verwertung und Echoes-Ökonomie ausdrücklich nicht umgesetzt. Keine ungefragte Scope-Erweiterung und kein automatischer GitHub-Push.

## 9. Aktueller Projektstatus – von Codex fortzuführen

**Projektphase:** CE3 technisch umgesetzt; zufällige Build-Entwicklung auf dem CE2-Aufstieg, menschliche Abnahme offen.
**Spielprojekt:** `C:/Users/elias/Lootfall 2.0/lootfall-2.0/project.godot`; Chronik separat im OneDrive-Projektordner.  
**Neu umgesetzt:** Bis zu drei zufällige Angebote aus sechs Karten; Ember Burst, Piercing Flame und Overcharge als einmal wählbare Run-Mechaniken (§8.13).
**Dev-Konsole:** F1 74 Werte, drei isolierte CE3-Builds, Wave-Jump und Run-/Wellenzeiten; Profile v8 lesen v1–v7, Progress v2 bewahrt.
**Umfang/Sprache:** Wellenkarten und einmalige Run-Ende-Auszahlung bewahrt; Code/UI Englisch. Kein neuer Skill, neue Klasse, dauerhafte Items oder XP-Leiste.
**Prüfung:** Godot 4.7.2: 731 Checks ohne Fehler; vier CE3-Gameplay-Scripts via MCP gültig. Kurzer Stress-Test ersetzt keinen Langzeittest.
**Material:** Zwei native gestellte CE3-Vorschauen vom 19.10.2026 in `Progress/captures/`; frühere Medien erhalten, kein neuer Clip.
**Feedback/Offen:** Drei bis fünf natürliche Runs auf unterschiedliche Spielweisen prüfen; Seer-Gewichtung/Champion allein (§8.12), Dauer, Baumtempo, Export offen.
**Nächster Schritt:** CE3-Spieltest nach englischem CE3_PLAYTEST.md. Spiel lokal 715a344 auf codex/build-discovery-card-synergies; GitHub bleibt auf CE2 3ccb604 bis passendem Push-Auftrag. Verwertung/Itemlevel geparkt.
**Pflegeanweisung:** Diesen Abschnitt nach jeder tatsächlich abgeschlossenen Arbeit auf höchstens circa 10 kurze Zeilen aktualisieren. Nur verifizierte Ergebnisse als implementiert eintragen.

---

## 10. Entscheidungs- und Änderungslog – fortlaufend, knapp

| Datum | Typ | Änderung / Begründung | Status |
|---|---|---|---|
| 2026-10-19 | CE3 umgesetzt | Separater Auftrag bestätigt sechs Karten, zufällige gültige Angebote statt fixer Dreierauswahl sowie Burst/Piercing/Overcharge. Bestehende Wellenbelohnungen und Meta-Regeln bleiben | Spiel lokal 715a344; 731 Checks, vier MCP-Scriptprüfungen, zwei native Vorschauen; menschliche Build-Vielfalt offen, kein neuer Push |
| 2026-10-19 | Spieltest / GitHub-Abgleich | Nutzerfeedback zu Seer-Relevanz, Boss-Kiting, Ausrüstungswechsel und Bewegung in §8.12 festgehalten; ausdrücklich beide Repositories für weitere ChatGPT-Planung hochladen | Keine Gameplay-Änderung; Spiel 3ccb604 auf main und CE2-Branch veröffentlicht, Chronik begleitet auf main. Weitere Mechaniken offen |
| 2026-10-19 | CE2 umgesetzt | Separater Auftrag ersetzt CE2A: Aufstieg bis Tod/Sicherheitsstopp, wiederkehrende Bossbegegnungen/Karten, begrenzte Skalierung, neue späte Echoes-Kurve, 3-Hit-Seer und Anti-Dauerinterrupt beim Boss | 603 Checks ohne Fehler, sechs MCP-Scripts, vier native Vorschauen; Dauer/Balance offen. Spiel f6d1be7 lokal, kein Push beauftragt |
| 2026-10-18 | GitHub / Veröffentlichung | Nutzer autorisiert öffentliche Repositories für Spiel und Chronik, Konto nach Klärung karlospeter464-hub. lootfall-2.0 und lootfall-2.0-devlog angelegt; lokale Trennung und Ausschluss privater Konfigurationen bleiben erhalten | Spiel 4c4f917 auf main/aktuellem Entwicklungsbranch veröffentlicht und Remote-Hashes geprüft; begleitender Chronik-Checkpoint folgt auf main. Künftige Pushes benötigen passenden Auftrag |
| 2026-10-18 | CE1-Spieltest / Nachschärfung | Nutzer wünscht zwei stärkere Guardians, sichtbare Absorption und erfahrbare Seer-Unterbrechung. Cap 2, 6× HP beider Rollen; Seer näher, 1,4-s-Warnung, 2-s-Erholung; echter Block-Anteil als Feedback der bestehenden Rüstung | 349 Checks ohne Fehler, vier MCP-Checks, eine native Vorschau; Spielabnahme offen |
| 2026-10-18 | CE1 umgesetzt | Separater CE1-Auftrag: Rune Guardian, flache Rüstung mit Minimum, direkte Seer-Unterbrechung; 3× Seer-HP macht fünf Treffer erreichbar. Neun isolierte Testarrangements mit bestehendem Gear/Karten, F1 63 Werte, Profile v6 abwärtskompatibel | 342 Checks ohne Fehler, sechs MCP-Scriptprüfungen, zwei native Vorschauen; menschliche Matchups offen |
| 2026-10-18 | CE1 Design / Priorität | Soft-Counter als Spielphilosophie, bestehende Build-Stärken gegen Gegnerrollen prüfen; Runenwächter mit Trefferrüstung und konditionale Seer-Unterbrechung als enges Experiment. Erst testen, keine Armor Penetration/Stat-Engine. Verwertung nachrangig. | Konzept/Experiment freigegeben; **noch nicht implementiert**, Matchups hypothetisch, manuelle Tests folgen |
| 2026-10-18 | Feedback / Verwertungsrichtung | Nutzer bestätigt Fernkämpfer und Seltenheiten, wünscht Echoes nach Rarity statt Vernichtung; spätere Itemlevel mitdenken. Direkter Item-Ertrag ist eine Abweichung vom bisherigen Belohnungsmodell | Planung 8.8 und Wyatt-Cheng-Recherche; Werte/Timing/Reset offen, kein Gameplay geändert |
| 2026-10-18 | Seltenheiten umgesetzt | Nach Auswahl des Nutzers separate Itemchance und bedingte Rarity-Kaskade mit festen Itempools; bestehende Effekte/Run-Regeln und natürlicher Codex-Cap erhalten, F1/Legacy-Profile erklärt | 275 Checks ohne Fehler, fünf Gameplay-Scripts plus Suite via MCP, drei native Vorschauen; Balance offen |
| 2026-10-18 | Begegnung / Loot | Nutzer bestätigt neuen Gegnerdruck und Entsorgung, ergänzt Wunsch nach Legendary→Rare→Magic→Normal-Kaskade. Seer und manueller Destroy-Button umgesetzt, keine automatische Vernichtung oder Lootregeländerung | 247 Checks ohne Fehler und zwei native Vorschauen; Kaskadenbasis/Qualitätsmodell offen |
| 2026-10-17 | P2-Spieltest / Identität | Nutzer bestätigt Spaß und Skilltree, wünscht langfristig mehr Tiefe als Mengen-/Feuertempo-Eskalation; unerwünschte Items blockieren Tasche/Boden. Gegnerrollen und Entsorgung als nächste Diskussion | Feedback dokumentiert; kein neues Gegner-/Entsorgungspaket oder automatische Vernichtung freigegeben |
| 2026-10-17 | P2 umgesetzt | Nach konkreter Freigabe Emberhaven und 15 vernetzte Talente, alle ausbaubar, exakter kostenloser Reset, sichere gemeinsame Speicherung, alte Wallets/Profile kompatibel; Bodenbeschreibung entfernt | 228 Checks ohne Fehler, neun MCP-Scriptprüfungen, vier native Vorschauen; manuelle P2-Abnahme offen |
| 2026-10-17 | Verbindlicher Meta-Loop | Nutzer bestätigt dauerhaften Echoes-Skilltree mit Grundwerten und besonderen Boni als Spielgrundlage. Run beenden → Stadt/Hideout → Echoes im Baum ausgeben → neuer Run. Ersetzt P2-Minimalvorschlag mit nur 1–2 Verbesserungen; Klassenwahl separat | Richtung/Scope-Erweiterung bestätigt und dokumentiert; konkrete Baumregeln sowie Darstellung der Stadt offen, noch nicht implementiert |
| 2026-10-17 | Hideout-Präferenz / Recherche | Nutzer bevorzugt komplexeren dauerhaften Echoes-Passivbaum mit Grundwerten und besonderen Boni; Klassenwahl separat. Qualitatives Spielerfeedback zu Zielknoten, Synergien, Wertefortschritt, Grind und Respec recherchiert | Aktuelle Designpräferenz, Regeln/Umfang offen; keine Implementierungsfreigabe |
| 2026-10-16 | Klassenrichtung / Scope | Nutzer stellt zusätzliche Hauptskill-Komplexität zurück: aktueller Magier bleibt, spätere Vielfalt über Krieger/Bogenschütze/Magier und zunächst je einen Build. Aufladeangriff für jetzt verworfen | Richtung bestätigt; keine Implementierungsfreigabe für weitere Klassen oder Klassenframework |
| 2026-10-16 | INV1-Spieltest / Folgeplanung | Nutzer berichtet deutlich mehr Spaß und bisher stimmige Balance; Bodenbeschreibung im Kampf zeitlich kaum lesbar, nur Namen gewünscht. Hauptskill soll als nächster möglicher Ansatz diskutiert werden | Feedback dokumentiert; UI-Anpassung vorgemerkt, neue Kampfmechanik noch nicht beauftragt |
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

## 11. Ursprünglicher Startauftrag für das neue Codex-Projekt (historisch, nicht erneut ausführen)

> **Archivierter Erststart-Prompt, bei laufendem Projekt nicht erneut verwenden.** Lies `LOOTFALL_MASTERPLAN.md` und verwende die dort definierten Statuskennzeichnungen. Inspiziere zunächst das tatsächlich geöffnete Godot-Projekt beziehungsweise den leeren Projektordner. **Schreibe noch keinen Gameplay-Code.** Gib mir eine knappe Bestandsaufnahme: Was existiert, was fehlt für P0, welche zwei bis drei kleinsten nächsten Arbeitspakete schlägst du vor und welche Risiken siehst du? Bevor du neue Systeme implementierst, warte auf meine Freigabe. Ändere die Vision und die offenen Produktentscheidungen nicht selbstständig. Pflege anschließend dieses Masterdokument ausschließlich mit nachgewiesenen Projektfortschritten und freigegebenen Änderungen. Keine kostenpflichtigen Dienste.

---

### Abschließende Arbeitsregel

**Nicht die Anzahl der Features maximieren, sondern die Menge an nachgewiesenem Spielspaß pro Stunde Entwicklungsarbeit.**
