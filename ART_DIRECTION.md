# Lootfall 2.0 — Art Direction Bible
**Style C: Bold Graphic Anime Dark Fantasy**  
**Stand:** 19.10.2026 · **Status:** Gestalterische Richtung vom Creative Director gewählt; technische Detailwerte und Figurengestaltung sind Testhypothesen.  
**Geltung:** Visuelle Leitplanken, **keine** automatische Freigabe für Gameplay-, Asset- oder UI-Implementierung.  
**Weiterführend:** [ASSET_ROADMAP.md](ASSET_ROADMAP.md) · [LOOTFALL_MASTERPLAN.md](LOOTFALL_MASTERPLAN.md)

## 1. Zielbild und Spielversprechen

Lootfall ist ein aktives 2D-Top-down-Action-Roguelite: 15–20 Minuten als angestrebte typische Run-Dauer, überraschende Misch-Builds durch Karten und Run-Items, zunehmend anspruchsvolle Wellen, Bossmeilensteine, Echoes und dauerhafte Talente in Emberhaven. Die Präsentation muss diese Kernmechanik **sichtbarer und befriedigender** machen, nicht überdecken.

**Visuelles Leitbild:** Anime-inspirierte Dark Fantasy mit großen grafischen Formen, selbstbewusster Kontur, stark unterscheidbaren Silhouetten und klaren, fast plakativ gezeichneten Zaubereffekten. Düster, geheimnisvoll und energiereich; weder fotorealistisch noch detailverliebte Pixel Art.

**Referenz:** Das vom Creative Director ausgewählte „Lootfall — Style Brief C / Bold Graphic Anime Fantasy“ aus der gemeinsamen Konzeptphase. Das Bild ist **ein Mood-/Form-Referenzblatt, kein importfertiges Asset oder genehmigtes finales Charakterdesign**. Die Referenzdatei ist noch nicht im Repository eingecheckt; Asset-Produktion darf trotzdem die hier beschriebenen Regeln nutzen. Bei Übernahme ins Repo Herkunft und Nutzungsstatus dokumentieren.

### Prioritäten — in dieser Reihenfolge
1. **Lesbarkeit:** Held, Gegnerrolle, Projektil, Treffer und Warnfläche auf den ersten Blick erkennen.
2. **Spielgefühl:** Wirkung von Overcharge, Piercing, Burst, Blitz, Loot und Bossen klar spüren.
3. **Kohärenz:** Figur, Gegner, Arena, UI und Effekte gehören sichtbar zum selben Spiel.
4. **Produktionsfähigkeit:** In Godot 4 als kleine, wiederverwendbare 2D-Assetfamilie realisierbar.

## 2. Fünf verbindliche Stilregeln

1. **Bold shapes:** starke Flächen und charakteristische Außenkonturen vor kleinen Details; keine fotorealistischen Texturen.
2. **Graphic anime:** anime-inspirierte Proportionen und ausdrucksstarke Gestaltung, aber vereinfachte Kleidung/Haarformen für kleine Spielfiguren.
3. **Hard-readable VFX:** scharf umrissene Feuer-Sicheln, Splitter, Blitze und Runen; kurze helle Impulse statt dauerndes, weiches Vollbild-Glühen.
4. **Quiet world, loud abilities:** dunkler, niedrig kontrastierter Arenaboden; Spieler, Gefahren, Items und Bossmechaniken haben die stärkeren Kontraste.
5. **Same grammar everywhere:** gemeinsame Kontur-, Form-, Schatten-, Icon- und Rahmensprache in Kampf, Karten, Inventar, Skilltree und Emberhaven.

**Nicht verwenden:** zusammengewürfelte Fototexturen, realistische 3D-Render-Optik neben flacher Anime-Art, zufällig gemischte Pixel-/Vektorstile, überladene VFX, unveränderte fremde Spiel-Assets.

## 3. Perspektive und technische Übersetzung

**Entscheidung für den ersten Style-Test:** Die vorhandene 2D-Top-down-Spielkamera und Spielgeometrie bleiben erhalten. Die teils isometrisch wirkende Konzeptillustration ist **kein Auftrag für Kamera-, Physik- oder Levelumbau**.

- Für Gameplay-Sprites eine konsistente **Top-down-/leicht von oben gesehene 3/4-Ansicht** verwenden; Blickrichtung, Füße/Bodenkontakt und Maßstab vereinheitlichen.
- Ein schönes frontales Anime-Porträt ist **kein** spielbarer Top-down-Sprite. Porträts (UI) und Gameplay-Sprites separat entwerfen.
- Sprites in der tatsächlichen Spielgröße bei 1280 × 800 und bei dichtem Gegneraufkommen abnehmen. Größenangaben erst anhand eines In-Engine-Vergleichs festlegen; keine starren Produktionspixel erfinden.
- Außenkonturen im Spielmaßstab beibehalten; Details, die bei 100-%-Ansicht nicht erkennbar sind, streichen.
- Spielobjekt, Kollisionsform und Visuals trennen. Artwork darf Hitboxen und getroffene Ziele nicht stillschweigend verändern.

## 4. Formsprache für Figuren und Gegner

| Rolle | Silhouette | Bewegungs-/Effektcharakter | Unverwechselbares Merkmal |
|---|---|---|---|
| Apprentice (Spieler) | mittelgroß, elegant, fließender Mantel / asymmetrische Kante | gerichtete Zaubergeste, kurze klare Rückmeldungen | gut sichtbare helle Kopf-/Schulterzone, eigener Bodenschatten |
| Chaser / Swarm | kompakt, nach vorn geneigt, reduzierte Spikes | schnelle Nahkampfdrohung, wenige Akzente | deutliche Differenz zu Spieler und Guardian |
| Cinder Seer | schmal, vertikal, verhüllt, Kreis-/Runenmotiv | ritualisierte Windup-Geste, festes Warnfeld | sofort von Nahkämpfern erkennbar |
| Rune Guardian / Champion | breit, kantig, blockartig, viel Schultermasse | schwerer Schritt, Rüstungsimpuls; Champion-Ansturm als kräftige Linie | breite Masse und klares Zentrum, große Bossvariante |
| Ash Prophet | hoch, zeremoniell, markanter Kronen-/Halo-Umriss | langsame, mächtige Zaubervorbereitung | eigener Bossumriss, nicht bloß vergrößerter Seer |

**Offen:** Gesicht, Geschlecht, Haare und endgültige Kleidung des Apprentice, konkrete Monsterillustrationen und zusätzliche Gegnertypen. Die weibliche weißhaarige Konzeptfigur ist **Stilreferenz, keine Festlegung**.

## 5. Material-, Linien- und Farbregeln

- **Linie:** saubere, kräftige Hauptkontur; innen weniger, feinere Detailkonturen. Konturen nicht überall gleich dick.
- **Shading:** zwei bis drei bewusste Flächenhelligkeiten pro Material; nur gezielte leichte Textur für Stein/Stoff. Kein realistischer Materialshader als Standard.
- **Formen:** Spieler = geschwungene, kontrollierte Bögen; Seer = schlanke Kreise/Runen; Guardian = schwere Winkel; VFX = zugespitzte Zacken, Strahlen, Splitter.
- **Palette (Richtung, noch keine endgültigen Hex-Codes):** dunkles Navy/Charcoal und gedämpftes Stein-Violett; Ember-Orange/Korallrot als magische Hauptenergie; Arkan-Violett und Storm-Blau als sekundäre Effektfamilien; helles Knochen-/Pergamentweiß für Lesbarkeit.
- **Semantik schlägt Schönheit:** Feindwarnungen bleiben von eigenen Treffereffekten unterscheidbar. Bestehende Seer-Warnflächen, Loot-Raritätsfarben und Gegner-Feedback nicht ohne Lesbarkeitstest umcodieren.
- Unterscheidbarkeit auch über Form, Animation und Icon gewährleisten, nicht ausschließlich über Farbe.

## 6. Combat VFX — funktionales Vokabular

| Effekt | Gestalt | Spielerinformation |
|---|---|---|
| Normaler Ember-Fireball | kleine fokussierte Feuerklinge mit heller Spitze | Richtung/Flugbahn |
| Overcharge | vorgeladener zentraler Schuss mit zusätzlichem klaren Ring/Spitzeneffekt | bereit / verbraucht / Treffer |
| Piercing | gerichtete Nachziehlänge, kurzer Durchstoß-Impuls | Projektil durchdringt ein Ziel |
| Ember Burst | kurzer radialer, kantiger Flächenimpuls, sichtbarer Radius | Kill löst Flächenschaden aus |
| Echo Scepter | zweiter sichtbarer Nachschuss mit kleinerem Gewicht | wiederholter Angriff |
| Storm Grimoire | kantiger, kurz aufblinkender Verbindungsblitz | Sprungtreffer auf ein weiteres Ziel |
| Phoenix / Heilung | kurzer, klarer aufsteigender Impuls, von Schaden unterscheidbar | Lebenspunkte wiederhergestellt |
| Seer-Warnung | gut abgegrenzte Bodenmarkierung mit zeitlich lesbarem Fortschritt | ausweichbare Fläche |
| Rune-Champion-Ansturm | markierte feste Angriffsrichtung und eindeutige Auslösung | ausweichbarer linearer Angriff |

**Budget:** Erst die bestehenden Grenzen für Projektile und temporäre Effekte messen; Layering, additive Blends, Bildschirmblitze und Partikelzahlen klein halten. Spells sollen auch bei 12+ Gegnern und mehrfachem Fire Fan lesbar bleiben. Telegraphs dürfen niemals hinter Hintergrunddeko verschwinden.

## 7. Arena, Map und Umgebung

Visuelle Bausteine: gebrochener gotischer Stein, schwebende Ruinen, Banner, Ketten, Glutbecken, Ritualplatten, Runenkreise; klare Bodenflächen und sparsame Randdetails.

**Erste Umsetzung = ein Arena-Skin, keine drei spielmechanisch neuen Maps.**
- Gameplay-Boden überwiegend ruhig und kontrastarm; Details stärker am Rand.
- Trenne Boden, rein dekorative Props, Wände/aktive Kollision und Überkopfelemente. Dekorative Ebenen dürfen weder Zielerkennung noch Bewegung blockieren.
- Kein flaches, aus dem Konzeptbild herausgeschnittenes Arenafoto als vermeintlich fertige spielbare Map: tatsächliche Wände, Größen, Tiefenreihenfolge und Spawns müssen in Godot umgesetzt werden.
- Biome später durch austauschbare Art-Sets erweitern, erst nach visueller und spielerischer Abnahme des ersten Skins.
- **Keine** neuen Hindernisse, Bossarenen oder Spawnregeln allein aufgrund dieses Dokumentes.

## 8. UI, Karten, Items und Skilltree

- UI bleibt zuerst **gut lesbar und benutzbar**: Werte, Vergleiche, Tooltipps, Bestwelle, Echoes und Ausrüstungszustand sind wichtiger als Zierrahmen.
- Gemeinsame Icon-Grammatik: starke Form, maximal wenige zentrale Symbole, aussagekräftige negative Räume.
- Karten/Items zeigen Effektfamilien über wiederkehrende Piktogramme; Rarity zusätzlich in Text/Umriss, nicht nur als Farbe.
- Skilltree-Knoten und Verbindungslinien verwenden dieselbe Winkel-/Runenformensprache; Kaufstatus muss klar unterscheidbar bleiben.
- Dekor nur an Rahmen und Außenflächen; Schrift und wichtige Zahlen haben ruhige Hintergründe.
- Stilreferenz C zeigt aufwendige Rahmen und HUD-Fantasie; **keine automatische Freigabe für neue aktive Fähigkeiten, Slots oder HUD-Elemente**.

## 9. Asset-Qualität und Abnahme

**Produktionsformat:** transparente, sauber ausgeschnittene einzelne PNG/WebP-Sprites bzw. kleine Sprite-Atlanten; SVG für geeignete flächige UI-Icons; editierbare Quelldateien getrennt von Runtime-Assets. Lizenz und Herkunft pro Asset nachvollziehbar. Keine Übernahme geschützter Figuren, Logos oder Screenshots anderer Spiele.

**Minimaler Vergleichstest:** dieselbe Godot-Kampfszene im jetzigen Look vs. mit neuem Hero-Sprite, einem Chaser-Sprite, einem neu gestalteten Projektil/VFX und einem Boden-Skin.

Abnahmekriterien:
- Spieler bei Bewegung und Beschuss sofort identifizierbar.
- Seer vs. Guardian auch als kleine Figuren unterscheidbar.
- Feindliche Warnfelder trotz Burst/Overcharge sichtbar.
- Sprites sitzen korrekt über ihren unveränderten Hitboxen.
- Kein UI-Text verschwindet/überlappt; Inventar, Skilltree und Karten bleiben funktional.
- Leistung und Lesbarkeit mit realistischen Wellen-/Build-Szenarien testen, nicht nur als statischer Screenshot.
- Creative Director vergleicht In-Engine-Aufnahmen bei 100 % Größe und gibt Stil vor nächster Assetserie frei.

## 10. Entscheidungen vs. offene Fragen

**[ENTSCHEIDUNG]** Bold Graphic Anime Dark Fantasy (Brief C), grafische klare Anime-Sprache, Dark-Fantasy-Ruinen, bestehendes Top-down-Gameplay für den ersten Test beibehalten, hohe Kampfle­sbarkeit und Synergie-Feedback priorisieren.

**[HYPOTHESE]** Obige Silhouetten, Effektformen, Arena-Skin, Produktionsformate und Reihenfolge müssen als kleiner Godot-Test validiert werden.

**[OFFEN]** Finales Charakterdesign, Spritegröße und Richtungs-/Animationsumfang; endgültige Farbwerte; konkrete Artist-/KI-Pipeline; spätere Arena-Mechaniken.

**Wichtig:** Dieses Dokument beschreibt **wie** Lootfall aussehen soll. Für **was wir wann bauen** siehe [ASSET_ROADMAP.md](ASSET_ROADMAP.md). Kein Gameplay- oder Assetumbau ohne eigenes freigegebenes Arbeitspaket.
