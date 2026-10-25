# Lootfall 2.0 – Visual Slice: Schritt-für-Schritt-Checkliste

**Stand:** 25.10.2026 · **Status:** Isolierter Methode-A-Test technisch geprüft; finales Runtime-Artwork und vollständiges A1-Gate offen
**Arbeitsgrundlagen:** [ART_DIRECTION.md](ART_DIRECTION.md) (verbindlicher Stil C), [ASSET_ROADMAP.md](ASSET_ROADMAP.md) (A1/A2/A3), [LOOTFALL_MASTERPLAN.md](LOOTFALL_MASTERPLAN.md) (Vision/Gates), [WORLD_RESTORATION.md](WORLD_RESTORATION.md) (Weltheilung).
**Repos:** Dieses Devlog-Repo hält Plan, Freigaben und Vergleichsmaterial fest. **Runtime-Bilddateien und Godot-Integration gehören in das Spielrepo** `karlospeter464-hub/lootfall-2.0`. Keine neuen konkurrierenden Masterpläne anlegen.

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

**Nächste konkrete Aktion:** **Gate 0** – Codex-Leseaudit für Spielergröße/Kamera/Sprite-Schnittstellen + Referenzaufnahme. **Parallel Gate 1** – 2–3 gezielte Apprentice-Entwürfe in *identischer* Gameplay-Perspektive entwickeln. Nach Sichtung der Ergebnisse die exakte Asset-Spezifikation festlegen; erst dann Implementierungsfreigabe.
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
