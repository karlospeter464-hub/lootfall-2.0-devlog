# Lootfall 2.0 – Visual Slice: Schritt-für-Schritt-Checkliste

**Stand:** 26.10.2026 · **Status:** Isolierter Methode-A-Test technisch geprüft; finales Runtime-Artwork und vollständiges A1-Gate offen
**Arbeitsgrundlagen:** [ART_DIRECTION.md](ART_DIRECTION.md) (verbindlicher Stil C), [ASSET_ROADMAP.md](ASSET_ROADMAP.md) (A1/A2/A3), [LOOTFALL_MASTERPLAN.md](LOOTFALL_MASTERPLAN.md) (Vision/Gates), [WORLD_RESTORATION.md](WORLD_RESTORATION.md) (Weltheilung).
**Repos:** Dieses Devlog-Repo hält Plan, Freigaben und Vergleichsmaterial fest. **Runtime-Bilddateien und Godot-Integration gehören in das Spielrepo** `karlospeter464-hub/lootfall-2.0`. Keine neuen konkurrierenden Masterpläne anlegen.

## Blender-Einzeltest · 27.10.2026

Separater Blender→Godot-Test abgeschlossen: echtes Tripo-Mesh, gesichertes Original, ein 512×640-RGBA-Render, 64 logische Pixel und V-Fallback zu Produktions-v01/A+. 23 Headless-/26 native Checks plus 24 Player-Art-/39 bisherige Visual-Slice-Checks bestanden. Zwölf aktive Gegner, echte Bewegung/Angriffe, Idle-/Kampfbilder unter Progress/captures/2026-10-27_blender_mage. Technisch geeignet, Stil noch nicht abgenommen: schmale glänzende Figur, geschlossenes Seitenbuch kaum lesbar. Keine Freigabe eines vollen Rigs oder einer Richtungsserie; vor Ausbau Silhouette/Material/Buchpose entscheiden. F5 unverändert. Spiel 32ace03; Details DEVLOG und tests/fixtures/blender_mage/README.md im Spielrepo.

## Ziel und Schnittgrenze

**Ziel:** Eine reale, kurze Godot-Kampfszene soll aus einem Guss wirken: **Bold Graphic Anime Dark Fantasy**, starke 3/4-Top-down-Silhouetten, klar lesbares Kampfgeschehen und sichtbar lebendig werdende Welt. Nicht bloß ein hübsches Konzeptbild; das Ergebnis muss im tatsächlichen Spielmaßstab funktionieren und brauchbare, ehrliche Vorher/Nachher-Aufnahmen liefern.

**A1 bleibt absichtlich klein:** Apprentice, **ein** Chaser, **ein** Ember-Fireball, **ein** Impact/Burst, **ein** ruhiger Bodentest mit höchstens zwei Dekoelementen. Für World Restoration benutzen wir die **bereits vorhandene** Live-Veränderung derselben Region als Vergleichsszene (Vorschlag: Ashen Fields); ein umfassender Neuaufbau der drei Biome ist nicht Bestandteil von A1. **Seer/Guardian/Bosse, viele Bewegungsrichtungen, voll animierter Skilltree und komplettes HUD sind spätere Gates.**

**Aktueller Ausgangspunkt (historisch, 19.–21.10.):** Style C entschieden; ein frontaler Apprentice-PNG-Versuch und ein anschließender prozeduraler Visual Lift wurden bereits technisch erprobt. Die prozeduralen Visuals sind laut dokumentiertem Stand wieder Standard. **A1 als kohärente neue Spritefamilie wurde noch nicht visuell freigegeben.** Aktuellen tatsächlichen Godot-/Git-/Exportstand vor Umsetzung immer erneut prüfen.

## Designentscheidung – 25.10.2026 (Gate 1 begonnen)

**[ENTSCHEIDUNG: Stilreferenz für Apprentice ausgewählt]** Aus drei gemeinsam erzeugten Illustrationen wurde **Variante 2** gewählt und anschließend gezielt **vereinfacht**. Die vereinfachte Zeichnung dient als **visuelles Zielbild**, ist aber noch **kein** ausgemessener 3/4-Top-down-Gameplay-Sprite, noch nicht freigestellt und nicht in Godot eingebaut.

**Unbedingt erhalten:** großer breiter spitzer Hexen-/Magierhut, silberweißes Haar, dunkelgrau/schwarzer einfacher Umhang mit rostroten Innenseiten, schlichter Holzstab mit orange leuchtender Feuerkugel, sichtbar getragenes aufgeschlagenes Zauberbuch, wenige metallene Akzente. Die Figur soll als **unerfahrener Apprentice**, nicht als voll ausgerüsteter Erzmagier wirken.

**Weiter reduzieren für Gameplay:** Gesichtsdetails, Stofffalten, Gürtel-/Schmuckornamente und feine Flammenpartikel. Wichtig sind **erkennbare Silhouette, Stab, Buch, Hut, Feuerakzent und Bodenkontakt**. Die bisherige Illustration zeigt eine frontal/leicht erhöhte Figur mit dunklem Hintergrund; für das Spiel **neues Bild mit echter erhöhter Top-down-/3/4-Kameraperspektive, sauberem Alpha und richtigem Fußanker** herstellen, ohne wichtige Details oder Proportionen unabsichtlich zu verändern.

**[ENTSCHEIDUNG: Animations-Prototyp A]** Ein zunächst **statisches Runtime-Sprite**, das Godot mittels subtiler AnimationPlayer/Tween-Transformen für Idle/Bewegung/Cast/Hurt belebt. **Noch nicht technisch umgesetzt oder als ausreichend bestätigt.** Kein Frame-by-frame-Produktionsauftrag vor In-Engine-Abnahme.

**Asset-Quelle:** Die gewählte vereinfachte Illustration liegt bisher im Chat als generiertes Bild vor, **noch nicht als versioniertes Spielasset im Repo**; Herkunft und spätere exportierte Datei getrennt festhalten. Nicht aus einer veralteten früheren Illustration importieren.

## Arbeitsreihenfolge und Abnahme-Gates

### 0. Ausgangslage sichern – Codex, nur lesend
- [x] Style C und bestehende A1-Roadmap dokumentiert.
- [x] Früheren PNG-Teilversuch und prozeduralen Visual Lift dokumentiert.
- [x] Codex prüft den aktiven lokalen Godot-Stand (native Instanz; Editor-MCP nicht verbunden): Player-/Enemy-/Projectile-Szenen und `_draw()`, Kamera/Zoom, tatsächliche Bildschirmgröße, bestehende Animationen, Fallbacks, Speicher und Screenshot-/Testmöglichkeiten.
- [x] Codex erstellt **eine** reproduzierbare Referenz-Kampfszene (inkl. 12+ Gegnern / Build-Effekten) bzw. dokumentiert ein bereits vorhandenes Test-Fixture, ohne Game-Logik zu ändern.
- **Gate 0:** Vergleichsaufnahme des echten Ist-Zustands + gemessene Sprite-Bildschirmgröße liegen vor. Keine neuen Bilder erforderlich.

### 1. Visuelles Zielbild festlegen – gemeinsam, Creative Director entscheidet
- [ ] 2–3 **gezielte** Apprentice-Konzepte mit **derselben Kamera/Pose/Größe** erstellen; keine drei unabhängigen Fantasy-Porträts.
- [ ] Ausrichtung festlegen: leicht erhöhte Top-down-3/4-Ansicht, sichtbarer Bodenkontakt/Fußanker, Zepter + Buch, große Konturen, wenige erkennbare Details.
- [ ] Bei 100 % Gameplaygröße gegen den aktuellen Hintergrund prüfen: Gesicht/Kostüm dürfen zurücktreten, Silhouette/Zaubergeste müssen erkennbar sein.
- [x] **Stilreferenz** ausgewählt: vereinfachte Variante 2 (Hut, weiße Haare, Stab mit Feuer, Buch, dunkler Umhang/rote Akzente), siehe Entscheidung oben.
- [ ] **Gameplay-Referenz** in korrekter 3/4-Perspektive auswählen und kompakte Style-Karte fixieren: Konturstärke relativ zur Spritegröße, Schatten (2–3 Flächen), Palette, Kopf-/Körper-Proportionen, Lichtseite, Magiefarbe und Detailbudget.
- [ ] Chaser als **eine** Form-Gegenprobe im selben Stil konzipieren.
- **Gate 1:** Creative Director gibt ein Gameplay-Referenzbild, eine Gegner-Gegenprobe und die kleine Style-Karte ausdrücklich frei. **Noch kein Codex-Asset-Import ohne diese Freigabe.**

### 2. Produktionsmethode mit minimalem Proof festlegen – gemeinsam + Codex
- [ ] **Ein** echtes Sprite mit sauberem Alpha aus dem freigegebenen Zielbild herstellen; Illustrator-/KI-Konzeptbilder sind noch keine Runtime-Sprites.
- [ ] Quellen und Rechte notieren (eigenes Artwork/GenAI-Bearbeitung), editierbares Original getrennt vom Runtime-PNG behalten.
- [x] Für den **ersten Prototyp Animationsmethode A** ausgewählt (ein Sprite + AnimationPlayer/Tweens); die tatsächliche Tauglichkeit ist noch zu testen:
  - **A – Ein Frame + Godot-AnimationPlayer/Tweens** (Atmung, leichtes Bouncen, Cast-Recoil): **Startfavorit**, schnell und konsistent.
  - **B – Wenige getrennte Körperteile** (z. B. Mantel/Arm/Stab) im Scene-Tree animieren: wenn A zu steif ist.
  - **C – Frame-by-frame** mit `AnimatedSprite2D`/`SpriteFrames`: erst wenn für lesbare Bewegung nötig und Frames perspektivisch konsistent hergestellt werden können.
- [ ] Richtungen nur nach Testbedarf auswählen (zunächst eine 3/4-Ansicht, optional links/rechts per Flip wenn visuell korrekt; **keine** automatisch erzeugten 8 Richtungen).
- **Gate 2:** Ein importierbarer Apprentice-Prototyp + definierte Animationsmethode, Asset-Spezifikation und Herkunft liegen vor.

### 3. Produktionsdateien exportieren – Bildarbeit
- [ ] Je logischem Zustand **separate, freigestellte RGBA-PNGs** exportieren (zunächst z. B. `apprentice_idle.png`, bei Bedarf weitere Frames); transparente Ränder sauber, keine eingebrannte Arena, kein Text, keine Schatten als riesige Leinwand.
- [ ] Einheitliche Blickrichtung, relative Körpergröße, Licht, Farben, Fußposition und **identischen logischen Pivot** prüfen. Bei Frame-Animation Canvas/Foot Anchor über alle Frames konstant halten, sonst „Springen“.
- [ ] Schatten bei Bedarf als eigene Godot-Ebene statt im Körper-PNG, damit er am Boden bleibt; Hände/Projektilursprung bei bestehender Logik belassen.
- [ ] Grafik auf gewünschter Runtime-Größe **und** in einer vergrößerten Bearbeitungsansicht prüfen. Quelldatei ausreichend hochauflösend, aber keine willkürlichen 4K-Runtime-Sprites; Maße erst nach Gate 0 festlegen.
- [ ] Versionierte Quellen und Freigabebilder archivieren. **Kein** großflächiges Sprite-Sheet generieren, bevor Einzelbild/Pivot/Animation im Spiel validiert wurden.
- **Gate 3:** Kleinste notwendige, visuell konsistente transparente Bilddateien liegen vor, ohne vermeintlich „fertige“ Animationen zu behaupten.

### 4. Nach Godot bringen – Codex nach konkreter Freigabe
- [ ] Ausgewählte PNGs aus dem Chat/Designwerkzeug **explizit herunterladen und in den lokalen Spielprojektordner übernehmen** (oder auf bestätigtem Wege ins Spielrepo bringen). Ein Chat-Bild befindet sich **nicht automatisch** auf dem Windows-Rechner oder in Godot.
- [ ] Nach Prüfung der bestehenden Struktur beispielsweise unter `assets/art/characters/apprentice/` ablegen. **Quellillustrationen** optional separat unter `assets/source/`, Git-LFS/Größe bei großen Originalen prüfen; keine Nutzerdaten/Secrets ins öffentliche Repo.
- [ ] Godot importiert PNGs als `Texture2D`; zunächst 2D-geeignete verlustfreie Einstellungen. Filter `Linear` vs. `Nearest` am tatsächlichen Look prüfen; Mipmaps **nur**, falls Verkleinerung/Zoom von ihnen sichtbar profitiert. Alpha-Kanten prüfen.
- [ ] **Sprite2D** als visuelles Kind am bestehenden Player benutzen (bzw. **AnimatedSprite2D** nur für echte Framefolge). Position/Offset/Scale am bereits existierenden Bewegungsobjekt mit **Fußanker** einstellen; Render-Reihenfolge/Bodenschatten korrekt zuordnen.
- [ ] Bestehende `_draw()`-Körperdarstellung per klar benanntem Fallback abschaltbar lassen; Hitbox/CollisionShape2D, Bewegung, Projektile, AI, Progression und Speicherformat **nicht verändern**.
- [ ] Bewegung/Cast/Hurt möglichst über vorhandene **Gameplay-Signale/Zustände** visuell ansteuern. Keine zweite, konfliktträchtige Gameplayzustandsmaschine aufbauen.
- [ ] Dasselbe minimale Verfahren erst nach erfolgreichem Mage-Test auf Chaser, Fireball/Impact und ruhigen Bodentest übertragen.
- **Gate 4:** F5-Spielszene mit ersetzten Visuals funktioniert, Fallback funktioniert und alte Gameplay-/Save-Tests bleiben grün.

### 5. Im echten Spiel validieren – Codex + Creative Director
- [ ] Vorher/Nachher in **gleicher** Kameraposition, Testwelle, Seed soweit möglich und Ausgabeskalierung aufnehmen; keine Konzeptgrafik als In-Engine-Beweis ausgeben.
- [ ] Bei normalem Zoom und 12+ Gegnern Spieler vs. Chaser, Fireball/Impact, Spawn/Hitboxen und Warnflächen lesbar?
- [ ] Können Spieler, Gegner, Effekte und Boden auch bei vielen Treffern/Overcharge/Burst unterscheidbar bleiben?
- [ ] World-Restoration-Szene aus demselben Gebiet: 0 % vs. fortgeschrittener Heilungsgrad **als tatsächliches Gameplay** vergleichen; ist die Verwandlung klar?
- [ ] Technische Regressionen, Pivot-Jitter, Alpha-Fransen, falsche Occlusion, Scaling/Filter, Speicherverbrauch und Framerate prüfen. Kein Gameplay-/Balancing-Wechsel „nebenbei“.
- [ ] Creative Director prüft Aufnahme **in Spielgröße** und entscheidet: **freigeben / gezielt nachbessern / Pipeline verwerfen**.
- **Gate 5:** Sichtbar kohärenter Combat-Slice + echte Belege; technische und persönliche Abnahme getrennt protokolliert.

### 6. Erst dann erweitern und für GoGoEli nutzen
- [ ] A1-Ergebnis in `DEVLOG.md` (Änderung, echte Tests, Commit, Grenzen) und `Progress/index.html` (Screenshots/Clip) dokumentieren; wichtige Statusänderungen in Masterplan §9/10, **hier** erledigte Checkboxen aktualisieren.
- [ ] Ein echtes kurzes Gameplay-Video **ohne irreführende Retusche** für YouTube/TikTok aufnehmen; optional Vorher/Nachher als Marketing-Hook.
- [ ] Erst nach Gate 5 entscheiden: **A2** (Seer/Guardian/Telegraphs), **A3** (kompakte Animationsfamilie/VFX) oder gezielte Boden-/Restoration-Verbesserung.
- **Gate 6:** Produktionsweise ist wiederholbar, ohne je Asset einen neuen Stil zu erfinden.

## Asset-Übergabekarte – je Asset kurz ausfüllen

| Feld | Für Apprentice zunächst |
| --- | --- |
| Name/Datei | `apprentice_idle.png` (endgültig nach Export) |
| Verwendung | Gameplay-Körper, **kein** Porträt |
| Art Direction | Style C, Verweis auf freigegebene Referenz |
| Blick/Kamera | leicht erhöhte Top-down-3/4-Perspektive |
| Maßstab | **aus Gate 0 messen**; noch offen |
| Bezugspunkt | Füße/Bodenkontakt konstant; Godot-Offset anpassen |
| Transparenz | RGBA, kein Hintergrund; ggf. Schatten separat |
| Animation | zunächst Option A, nach Gate 2 bestätigen |
| Source/Version/Rechte | Herkunft + Quelldatei + Version dokumentieren |
| Godot-Ziel | bestehendes Player-Visual; Fallback erhalten |
| Abnahme | Screenshot bei echtem 100-%-Gameplaymaßstab |

## Zuständigkeiten und Grenzen

- **Creative Director (du):** entscheidet Look, wählt Bildvariante, nimmt tatsächliches Gameplay ab.
- **ChatGPT:** entwickelt Konzeptvergleiche/konkrete Asset-Briefs, kann freigestellte Einzelbilder vorbereiten oder bewerten, liefert Copys und Marketing-Kit; prüft keine lokale Godot-Laufzeit ohne Zugriff.
- **Codex:** prüft lokalen Ist-Stand, erstellt die testbare Integrationsstelle, importiert bereitgestellte Dateien, bindet Animationen an bestehende Zustände, automatisiert reproduzierbare Tests/Vergleiche und dokumentiert den verifizierten Fortschritt.
- **Git/Veröffentlichung:** Spielassets/Code im Spielrepo; Design-Gates hier; Commits/Pushes/öffentliche Uploads nur nach passenden Aufträgen. Keine stillen Spielregeländerungen.

**Nächste konkrete Aktion (aktualisiert):** Runtime-Kandidat v01 anhand der neuen Idle-/Live-Kampfbilder sichten. Methode A für den Apprentice abnehmen oder eine konkrete Einschränkung gezielt nachbessern; finales PNG ohne eingebrannten Bodenschatten liefern. Keine automatische weitere Assetserie oder dauerhafte Ersetzung.
## Verifizierter Zwischenstand – 25.10.2026, Methode A

Expliziter Nutzerauftrag erweitert Gate 0 um einen **isolierten** Sprite-/AnimationPlayer-Test, keine dauerhafte Ersetzung. Online-Checkliste aus origin/main (5b7ae5a) lokal übernommen; lokale übrige Chronik und unversionierte Nutzergrafik bewahrt. Kein pauschales Zusammenführen der auseinanderliegenden lokalen/Online-Chronik.

- Ist-Zustand im aktiven Spielprojekt 014793a geprüft: prozeduraler Player Standard; historisches Crimson-PNG optional, keine Camera2D, logisches Viewport 1280×800 und Standardfenster 1152×720.
- Transparenter Godot-SubViewport misst **50×55 logische Pixel** für den ruhenden Originalplayer inkl. Schatten/Zielanzeige nach rechts; im Standardfenster ca. **45×50 Bildschirm-Pixel**. Hitboxradius weiterhin 15, Schussstart 25 Einheiten vom Spieler.
- Neues geliefertes PNG tatsächlich bereits transparent: 1086×1448 RGBA, Alpha-Bounds 1037×1429. Es wird bytegleich **nur als Test-Fixture** benutzt; Front-/leicht erhöhte Perspektive und Detailverlust sind keine finale Gameplay-Art-Freigabe.
- Prototyp: 64 logische Pixel Alpha-Höhe (ca. 58 Bildschirm-Pixel), Sprite2D + separater VisualMotion-Knoten mit AnimationPlayer für Idle/Move/Cast; bestehende Atmung, Hurt-Färbung und Effekte bleiben. V blendet zur bisherigen Draw-Figur zurück. Normales F5 unverändert.
- Einzelframe-Grenze: keine unabhängigen Beine/Arme/Buchseiten, keine echten Richtungsansichten. Noch kein Grund, B/C oder eine neue Asset-Pipeline zu bauen.
- 26 neue Headless-Checks + 131 bestehende Checks bestanden; nativer D3D12-Vergleich mit 30 Checks, drei Szenenbildern und echtem 1x-Render. Gleicher Seed/Welle, zwölf positionierte Gegner und existierende Seer-Warnungen. Aufnahmen sind kontrolliert/stationär, kein Lastbenchmark oder menschlicher Kampf.
- Anleitung und genaue Asset-Übergabe im Spielrepo: VISUAL_SLICE_A_PLAYTEST.md. Vergleich: [Galerie](Progress/index.html#visual-a). Bestehende Gameplay-Skripte/Player-Szene, Kamera und Balancing unverändert.

**Gate-Status:** Gate 0 technisch belegt mit genannter Editorgrenze; Methode A technisch demonstriert. Gates 1–5 als vollständiges A1-Paket bleiben offen. Insbesondere keine finale Perspektiv-/Figurenabnahme, kein Chaser-/Bodenpaket und keine dauerhafte Integration behaupten.

**Nächster Schritt:** Creative Director sichtet echte Spielgröße und subtilen Bewegungstest. Erstes vereinfachtes erhöhtes 3/4-Runtime-PNG liefern: Vorschlag 256×320 RGBA, sichtbare Figur ca. 280 Pixel hoch, exakten Fußanker dokumentieren, Startziel 64 logische Pixel. Danach im vorhandenen Test ersetzen und abnehmen; keine weitere Assetserie vor diesem Vergleich.

## Runtime-Kandidat v01 – tatsächlicher In-Engine-Test, 25.10.2026

**Explizit freigegeben:** lootfall_apprentice_runtime_candidate_v01.png im bestehenden isolierten Test integrieren und mit mindestens zwölf aktiven Gegnern prüfen. Kein Gameplay-/Hitbox-/Balancing-/Progressionswechsel und kein Push. Spiel-Checkpoint **33424dc**.

- [x] Tatsächliche Einzeldatei bereitgestellt, geprüft und bytegleich als Test-Fixture übernommen; das mitgesendete German Mage Animation Sheet nicht als Runtime-Sheet verwendet.
- [x] 256×320 RGBA, Alpha-Bounds (18,26,212,274), Fußanker (128,300), Sprite-Offset (-128,-300), Skalierung 64/274 = 0,23357664. Ca. 49,5×64 logische Pixel / 44,6×57,6 Bildschirmpixel im unveränderten Standardfenster.
- [x] Sprite2D + AnimationPlayer weiterhin isoliert; Idle/Move/Cast und Hurt-Färbung, V-Fallback und ursprüngliches F5 erhalten. Keine Änderungen an produktiven Scripts/Szenen, Kamera oder Projektkonfiguration.
- [x] Nativer D3D12-Kampftest mit realer Bewegung, laufender KI und echten Projektil-/Schadenspfaden: 180 Physikframes, durchgehend zwölf Gegner, zehn Schüsse, acht Treffer, 80 tatsächlicher Schaden; Spieler-HP am Ende 54,5728. Automatisierte Eingaben/Zielwahl, kein menschlicher Playthrough; unveränderte Kampfwerte, isolierte Testdaten.
- [x] Tatsächlicher Idle-Screenshot und Live-Kampfscreenshot in normaler Ansicht erstellt und gesichtet: [Galerie](Progress/index.html#candidate-v01). Kampfbild bei zwölf aktiven Gegnern, kein eingefrorenes Tableau.
- [x] 27 Candidate-Headless-Checks, 20 bestehende Player-Art-Checks, zwölf bestehende Visual-Lift-Checks sowie 39 native Checks bestanden. Foot-Pivot, Pause, Animationswahl, Hurt, ursprünglicher Körper, Projektilursprung und Werte geprüft.

**Sichtbefund:** Kein sichtbarer rechteckiger Hintergrund oder auffälliger Alpha-Rand in den gesichteten Bildern. Hut/Feuer sind gut erkennbar; Gesicht, Finger und Buchdetails gehen bei 64 logischen Pixeln weitgehend verloren. Zielanzeige, Projektile und feindliche Warnkreise bleiben in der Stichprobe sichtbar. **Korrektur 26.10.:** Genauere Alpha-/Pixelprüfung zeigt keine separat abtrennbare Schattenellipse im Runtime-v01-PNG. Die frühere Doppel-Schatten-Einschätzung war zu pauschal; Original unverändert lassen und vorhandenen Godot-Schatten erhalten.

**Bewertung Methode A:** Für den ersten spielbaren Apprentice-Prototyp ausreichend. Ganze Figur atmet/wippt/reagiert; keine eigenständigen Schritte, Arme oder Buchbewegungen. Feste Bildrichtung passt nicht zu jeder Schuss-/Laufrichtung. Erst persönlich prüfen, ob diese Grenzen akzeptabel sind; keine automatische Umstellung auf B/C. Zeitliche Artefaktfreiheit, lange Kampf-/Performance-Abnahme und vollständige A1-Stilfamilie bleiben offen. Keine finale Produktions-/Perspektivabnahme aus einem kurzen Test ableiten.

**Quelle:** Nutzer-Download, 80179 Byte, SHA256 831023c026176d2949e3e8a085148ea1cb79d72d1684a0b7977fbbead3053128. Original erhalten. Anleitung im Spielrepo VISUAL_SLICE_A_PLAYTEST.md; Belege unter Progress/captures/2026-10-25_candidate_v01/.
## Visual Slice A+ – Animation Polish, 26.10.2026

**Entscheidung / Umfang:** v02 vom Nutzer verworfen; v01 bleibt visuelle Grundlage. Ein zusammenhängendes rein visuelles Paket in der vorhandenen isolierten Testumgebung; kein neues Charakterbild, kein Rig, keine neue Planungsdatei, keine dauerhafte F5-Ersetzung oder Veröffentlichung. Lokaler Spiel-Checkpoint **a4ebc62**.

- [x] Original-v01 und seine ursprüngliche A-Animationsbibliothek erhalten. **V** schaltet **A+ → Original-v01/A → prozedural → A+**. Normales F5, Spielwerte, Hitbox, Projektilstart und Progression unverändert.
- [x] A+-Idle: ruhiges Atmen und Gewichtsverlagerung; Feuer flackert separat über einen eng begrenzten Warmfarben-Shader und eigenen pausierbaren Takt. Keine neuen Rasterbilder oder externen Bilddienste.
- [x] Bewegung: geringe geschwindigkeitsabhängige Körperneigung und kleiner Rhythmus, keine vertikale Hüpftranslation. Fußanker (128,300) bei allen A+-Animationsschlüsseln unverändert auf dem Bewegungsobjekt.
- [x] Cast: kurze visuelle Vorbereitung im vorhandenen letzten 0,10-s-Cooldownfenster bei beabsichtigtem Folgeschuss, Energieimpuls am tatsächlichen unveränderten Schuss-Weltpunkt, 0,24-s-Rückbewegung. **Erster Schuss bleibt sofortig**; keine zusätzliche Cast-Verzögerung, keine veränderten Treffer oder Schadenswerte.
- [x] Schatten geprüft und frühere Einschätzung korrigiert: keine separate freistehende zusätzliche Schattenellipse im tatsächlichen v01-Runtime-PNG identifiziert. Keine destruktive Entfernung an Stiefeln/Kleidung versucht. Original bleibt bytegleiches Backup, SHA256 831023c026176d2949e3e8a085148ea1cb79d72d1684a0b7977fbbead3053128; nur Godots bestehender Bodenschatten bleibt.
- [x] Echter nativer Godot-Clip mit Original, A+-Idle, prozeduralem Vergleich, Aufwärts-/Links-/Abwärts-/Rechtsbewegung und mehreren Casts erstellt. Vergleichs-/Schlussphasen mit stationären Gegnern; im Kampf zwölf aktive Gegner, zehn Schüsse und zehn Treffer, 84 realer Schaden, Ende 54,5728 HP. Automatisierte Eingaben, kein menschlicher Durchlauf.
- [x] 106 Headless-Checks bestanden (39 A+, 20 Player Art, 12 Visual Lift, 35 Combat Polish); nativer Demoablauf neun Prüfungen ohne Fehler. Geprüft: Fußanker, V-Ereignis für alle drei Modi, Shader/Originalmaterial, Quelle unverändert, Pause inklusive Feuerclock, Reset/Hurt, tatsächlicher Projektilursprung und unveränderte Werte.
- [x] MP4 1152×720/30 fps, 7,7667 s/233 Frames, vollständig dekodiert, keine schwarzen Bildintervalle; acht tatsächliche Frames und native Idle/Kampfaufnahmen gesichtet. 0,1 s Startvorlauf entfernt, keine Gameplay-Zeitlupe oder Bildretusche. [Clip/Galerie](Progress/index.html#aplus).

**Bewertung:** A+ verbessert Präsenz, Bewegungsrhythmus und Schussfeedback und bleibt ein brauchbarer Zwischenstand. Stab/Arm/Buch bewegen sich weiterhin nur gemeinsam mit dem vollständigen Bild, kein eigener Schrittzyklus und keine echte Richtungsansicht. Für eine deutlich eigenständigere Zaubergeste verspricht ein **kleiner B-Test mit separatem Arm/Stab** sichtbaren Mehrwert; benötigt sauber getrennte Bildteile, kein vollständiges Rig. B wurde nicht gebaut und ist aus diesem Ergebnis nicht automatisch freigegeben. Menschliche Abnahme und lange Kampf-/Performanceprüfung offen.

**Belege:** Progress/captures/2026-10-26_aplus/{aplus_gameplay.mp4,original_idle.png,aplus_idle.png,procedural.png,aplus_combat.png,clip_frames.jpg,polish_metrics.json}. Native AVI außerhalb Git unter C:/Users/elias/Video_Production/Visual_Slice_A_Plus/aplus_native.avi; keine Veröffentlichung/Push. Bedienung/Startkommando in der bestehenden VISUAL_SLICE_A_PLAYTEST.md im Spielrepo.

## v01/A+ als normaler Player – 26.10.2026

**Expliziter Folgeauftrag:** Neue Figur als Standard implementieren. Frühere Einschränkung auf den isolierten Test ist für den Apprentice damit aufgehoben; keine Freigabe neuer Mechaniken oder weiterer Assetfamilien.

- [x] Normale Player-Szene nutzt v01/A+ beim F5-Start, ohne Spezialkommando: aktives Projekt öffnen → F5 → Start Run.
- [x] Gemeinsame Runtime-Komponente scripts/apprentice_visual.gd und Fire-Shader; reguläre verlustfreie PNG-/Mipmap-Resource unter assets/art/characters/apprentice/apprentice_v01.png. Keine Runtime-Abhängigkeit von Tests oder rohen PNG-Dateien; Test-Fixture nutzt denselben Controller.
- [x] 64 logische Pixel, Fußanker (128,300), Radius 15, Originalpixel/Backups und historische Illustration erhalten. V schaltet A+ / ursprüngliche v01-A-Animation / prozedural. Use Artwork=false vor Start wählt den prozeduralen Fallback; fehlende Texture blendet ebenfalls auf den vorhandenen Körper zurück.
- [x] 224 Checks in sechs Suites ohne Fehler: Player Art 24, A+ 39, Visual Lift 12, Arena 64, Combat Polish 35, Inventory 50. Einschließlich Startup-Fallback, importierter Textur, keinen Testabhängigkeiten, Pause/Feuer, Hit-/Castfeedback, Kampfwerten und Projektilursprung. Normaler Hauptszenenstart/120 Frames sauber; natives Standard-Arena-Bild ohne nachträgliche Visual-Injektion gesichtet.
- [x] Lokale Nutzer-/Editoränderungen an project.godot und vorbestehende unversionierte UID-/Importdateien bewahrt und nicht mitcommittet. Spiel-Checkpoint **eb46baf**, kein Push, kein neuer Releaseexport.

**Jetzt testen:** C:/Users/elias/Lootfall 2.0/lootfall-2.0/project.godot öffnen, laufendes Spiel stoppen und F5 → Start Run. Ab diesem Schritt zeigt F5 die neue Figur. Editor-Dateireload bei Rückfrage zulassen. Screenshot: [Standardfigur](Progress/captures/2026-10-26_apprentice_standard.png). Persönliche Spiel-/Stilabnahme und neuer Releaseexport offen; Stab/Arm bleiben fest im Einzelbild, kein B-Rig gebaut.
