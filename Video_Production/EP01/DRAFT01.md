# EP01 – erster Hochformat-Rohschnitt

**38 Sekunden · 1080×1920 · 30 FPS · H.264/AAC.**

[MP4 ansehen](<C:/Users/elias/Lootfall 2.0/Video_Production/EP01/edits/Draft01/Lootfall_EP01_Draft01.mp4>) · [Lokale Vorschauseite](<C:/Users/elias/Lootfall 2.0/Video_Production/EP01/edits/Draft01/index.html>) · [Standbilder](../../Progress/captures/2026-10-23_EP01_draft01_sheet.jpg)

Hook mit kurzem Heilungs-Teaser → historischer Kampf → vollständige Kartenwahl → fehlendes Langzeitziel → World Restoration → 100 % und nächste Region → Emberhaven/Skilltree/Abschlussfrage. Englische Texte eingebrannt, Kampfkamera nachgeführt, Karten/Regionsübersicht vollständig eingepasst. Sanfte kurze Übergänge, Schlussblende und etwas Zeitlupe beim Wachstum.

Noch kein Voiceover oder Musik. Vorhandener Spielton dreifach verstärkt, Schnittkanten ausgeblendet; historische Sequenzen/Hub waren still. Zeitlupe verlangsamt auch den Ton. Native MP4-Dekodierung und stumme Wiedergabe bis 37,85 s von 38,02 s bestanden; subjektive Ton-/Schnittabnahme steht aus. Kein editierbares CapCut-Projekt, Rohclips bleiben separat verfügbar.

Historische Rekonstruktion und beschleunigte Restaurations-Fixture sind im Video gekennzeichnet. Kein Originalmaterial des Testers. Keine Spieländerung oder Veröffentlichung.

Reproduktion: `edit_ep01_draft.py <EP01-Ordner> <neuer Ausgabeordner>` mit dem gebündelten Python (Pillow/NumPy). Der feste Renderer verarbeitet alle 1140 tatsächlichen Videoframes, keine Slideshow. Anschließend `windows_video.ps1` mit `-Width 1080 -Height 1920 -TrimStartSeconds 0` verwenden. AVI-Zwischenformat MJPEG 4:2:0/PCM; Ziel-MP4 erst erzeugen, wenn ihr Dateiname noch nicht existiert. Zeiten/Quellen und Ausgabehash in DRAFT01_EDIT_DECISIONS.json.
