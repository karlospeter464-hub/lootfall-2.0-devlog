# Neuer Magier im normalen Spiel – 28.10.2026

F5 → Start Run: vier Blickrichtungen nach Mausziel, WASD unabhängig. V vergleicht mit bisherigem v01/A+. Freigegebene Rückansicht V2 mit offenen Innenseiten zum Betrachter integriert. Keine Teststeine übernommen.

Echte Godot-Aufnahmen bei 1600×1000: before.png / after.png identischer Kampfzustand; front/right/back/left.png zeigen die Ansichten. gameplay.gif: tatsächliche Bewegung und Zaubern, auf 960×600 für die Vorschau verkleinert, originale Zeitabstände. 12 aktive Gegner, 11 Schüsse/3 Treffer, 3,63 Sekunden. 87 native Checks erfolgreich. Quellen und vollständige Metriken liegen daneben.

Weitere Prüfungen: 48 Headless-Integrationschecks; normaler Hauptszenenstart mit Stadt/Start Run, Pause, Treffertönung und Laufzeit-Abhängigkeitsprüfung. Gameplay-, Inventar- und ältere Grafiktests erfolgreich. Keine Änderungen an Save-/Restoration-Regeln. Keine neuen vollständigen Laufbildzyklen, kein neuer Export/Installer.
