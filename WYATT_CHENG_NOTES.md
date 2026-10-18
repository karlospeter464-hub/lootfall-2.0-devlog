# Wyatt Cheng: hilfreiche Designprinzipien für Lootfall

Recherche: 18.10.2026. Grundlage sind veröffentlichte Transkripte seiner Vorträge und eines direkten Entwicklerinterviews, keine behauptete Sichtung sämtlicher YouTube-Shorts. Das vom Nutzer erwähnte konkrete Loot-Kaskadenvideo bleibt unidentifiziert. Die folgenden Lootfall-Anwendungen sind eigene Vorschläge, keine Aussagen Chengs und keine Implementierungsfreigaben.

## Früh zeigen und ausgelöstes Verhalten prüfen

In seinem GDC-Vortrag 2013 erklärt Cheng, warum unfertige Systeme früh gezeigt und mehrfach verändert werden sollten. Eine misslungene Trankregel führte zu mehr Verbrauch statt der gewünschten Sparsamkeit. Seine Schlussfolgerung: Mechaniken erzeugen Verhalten und müssen zur Spielerfantasie passen.

Quelle: [GDC-Vortrag, Transkript Teil 1](https://www.purediablo.com/wyatt-chengs-gdc-panel-full-video-transcript).

Unsere Anwendung: Weiter kleine spielbare Pakete testen. Bei Verwertung beobachten, ob Spieler ständig Taschen aufräumen, statt interessante Ausrüstungsentscheidungen zu treffen. Echoes pro Run und Anteil aus Verwertung gegen erreichte Wellen vergleichen. Das bestehende positive Spieltestfeedback ist qualitativ; noch keine Langzeitstudie oder belastbare Wirtschaftsbalance.

## Perfekte Ausrüstung soll vom Build abhängen

Im direkten Diablo-Interview beschreibt Cheng als Ziel, dass ideale Ausrüstung selbst innerhalb einer Klasse je nach Build verschieden ist. Allgemein dominante Werte wie Angriffstempo oder kritischer Schaden erschweren dieses Ziel.

Quelle: [Entwicklerinterview, Podcast 101 Teil 2](https://www.purediablo.com/the-diablo-3-podcast-101-developer-interview-part-2).

Unsere Anwendung: Spätere Magieritems sollten unterschiedliche Situationen und Synergien bedienen. Fokus auf einzelne wichtige Gegner gegenüber Flächenschaden an Gruppen ist bereits ein Ansatz. Seltenheit allein erzeugt keine neue Build-Tiefe; mit vier festen Items gibt es derzeit wenig Auswahl. Keine neuen Effekte oder Seltenheitsvarianten beschlossen.

## Kontrolle muss sich zuverlässig anfühlen

Im zweiten GDC-Transkript diskutiert Cheng verlorene Eingaben, problematische Animationsabbrüche und begrenzte Eingabepuffer. Leitgedanke: die beabsichtigte Spieleraktion zuverlässig und verständlich ausführen; zu viele vorgemerkte Aktionen können Kontrolle ebenfalls verschlechtern.

Quelle: [GDC-Vortrag, Transkript Teil 2](https://www.purediablo.com/wyatt-chengs-gdc-2013-panel-illustrated-transcript-part-two).

Unsere Anwendung: Mit neuen Animationen weiterhin Ausweichen, Zielen und Angriffsreaktion prüfen. Technische Mechanismen wie ein Eingabepuffer erst bei einem beobachteten Problem hinzufügen. Ausweichbare Seer-Warnungen sollten auch unter Effekten lesbar bleiben.

## Aktueller Entwurf zur Verwertung

Siehe Masterplan 8.8 als einzige fachliche Planungsquelle. Vorgeschlagene Normal/Magic/Rare/Legendary-Grundwerte: 1/2/4/10 Echoes; Auszahlung erst am Run-Ergebnis empfohlen, noch nicht bestätigt. Späterer Itemlevel-Faktor ohne jetzt Level, zusätzliche Währungen oder Crafting einzubauen. Wichtigste offene Fragen: Zeitpunkt, App-Schließen, Restitems und gewünschte Dauer des Baumausbaus.
