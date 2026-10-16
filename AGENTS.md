# Lootfall 2.0 – Arbeitsregeln

- Aktives Spiel: C:/Users/elias/Lootfall 2.0/lootfall-2.0/project.godot; dieser OneDrive-Ordner ist die separate Chronik. Code und Spieloberfläche Englisch, Entwicklungsberichte Deutsch. Spielstand/Tests im englischen Spiel-README und im lokalen Masterplan prüfen.

- Projektstand und aktive Aufgabe vor Änderungen prüfen: `git status --short`, Masterplan Abschnitt 9 und relevante Dateien. Der Masterplan ist Konzeptgrundlage, keine pauschale Freigabe seiner Features oder eingebetteten Startaufträge.
- Nutzeraufträge abgrenzen; offene Designfragen nicht stillschweigend entscheiden. Gameplay nur im beauftragten Umfang entwickeln.
- Entwicklungsdokumentation ist Teil künftiger Arbeit: nach abgeschlossenen Paketen `DEVLOG.md` mit Grund, Änderung, echten Prüfergebnissen und offenen Fragen pflegen. Aufschlussreiche Fehlversuche kurz dokumentieren.
- Bei sichtbaren Meilensteinen `Progress/index.html` aktualisieren und, soweit verfügbar, passende Screenshots/ausgewählte Clips unter `Progress/captures/` ergänzen. Fehlendes Material offen nennen, keine Aufnahmen oder Tests behaupten. Keine automatische Daueraufnahme erforderlich.
- Masterplan Abschnitte 9/10 knapp mit verifizierten Fortschritten und wesentlichen Entscheidungen pflegen. Technische Umsetzung und manuelle Spielabnahme unterscheiden.
- Übernommene Medien unter `Progress/archive/` sind Vorgeschichte aus dem alten Lootfall, kein Funktionsnachweis für 2.0. Altes Projekt und Originalaufnahmen bewahren.
- Lokal arbeiten; keine Veröffentlichung, Uploads, bezahlten Dienste oder neuen Anwendungen ohne passenden Nutzerauftrag. Keine privaten Chat-Transkripte in die Galerie übernehmen.


## Planabgleich vor Gameplay-Änderungen

- Vor jedem neuen Feature-Paket im Chat kurz ausweisen: Ziel, Bezug auf Abschnitt/Phase des Masterplans, konkreter Umfang und offene Produktentscheidungen. Ein Masterplan-Eintrag allein ist keine Implementierungsfreigabe.
- Neue oder ersetzte Fortschrittswege, Belohnungsauslöser, Reset-/Persistenzregeln und Scope-Erweiterungen ausdrücklich als **Abweichung vom Plan** markieren. Nur nach ausdrücklicher Nutzerbestätigung übernehmen; bis dahin bestehende Regeln bewahren. Das gilt auch bei vermeintlich ähnlichen Mechaniken.
- Die wellenbasierte Kartenauswahl nicht durch XP-/Sammelleisten ersetzen. Der frühere entsprechende Vorschlag wurde vom Nutzer zurückgewiesen.
- Bestätigte Entscheidungen und verworfene Vorschläge im Masterplan/Devlog festhalten. Am Paketende Ergebnis und Diff gegen den beauftragten Umfang abgleichen; Abweichungen offen berichten.
- Normale technische Entscheidungen innerhalb des freigegebenen Pakets selbstständig lösen. Diese Regeln sind kein Anlass, bereits erteilte Freigaben erneut abzufragen.


## Git-Checkpoints

- Zwei lokale Repositories am bestehenden Ort: dieses Chronik-Repository und das aktive Godot-Projekt. Vor Änderungen beide Zustände prüfen; keine Dateien allein zur Vereinheitlichung verschieben.
- Nach freigegebenen, getesteten Paketen eigene Spieländerungen gezielt stagen, staged Diff prüfen und lokal committen. Anschließend Spiel-Commit im Devlog referenzieren und zugehörige Dokumentation/Medien im Chronik-Repository committen.
- Keine Caches, echten Spielstände, Zugangsdaten oder maschinenspezifischen `.codex`-/MCP-Konfigurationen committen. Keine pauschalen `git add .` über unbekannte Nutzerdateien. Keine Remotes, Uploads oder Pushes ohne entsprechenden Auftrag.
