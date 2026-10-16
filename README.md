# Lootfall 2.0

**Starten:** `C:/Users/elias/Lootfall 2.0/lootfall-2.0/project.godot` in Godot öffnen, **F5**. Falls nach der Hauptszene gefragt wird: `scenes/arena.tscn`. Spielcode und Oberfläche sind Englisch; dieser separate OneDrive-Ordner enthält die deutsche Chronik.

**Aktuelles Paket INV1:** Aufheben → acht Taschenfelder → Beschreibung/Vergleich → bewusst ausrüsten. Zepter- und Buchslot, vier feste Items: Ember Scepter (+30 % Schaden), Swift Scepter (20 % kürzeres Intervall), Cinder Codex (85 Radius / 60 % Splash) und Focus Grimoire (+40 % Schaden statt Splash). Run-Items werden beim nächsten Versuch zurückgesetzt. Karten weiterhin nach Welle 2/4; Echoes unverändert nur am Run-Ende für abgeschlossene Wellen, gespeichert mit Bestwelle.

**Dev-Konsole: F1.** 33 einstellbare Werte einschließlich Itemboni und Dropverteilung, Live-Metriken, gezielte Testfunde, Standard-Reset und manuell speicherbare Profile. Alte Profile mit 28 Werten bleiben ladbar. Während der Bearbeitung pausiert das Spiel. Gegnerwerte gelten für neue Gegner; Testaktionen können echte Echoes beeinflussen. Vollständige englische Anleitung und Testbefehle: `README.md` im Spielordner.

Steuerung: WASD bewegen, Maus zielen, linke Maustaste halten zaubern, **I** Equipment, **Escape** aktuelles Fenster schließen oder pausieren. Zum Loot-Test: F1 → Rewards & tools → Item wählen → Drop selected item → schließen und aufheben → I → vergleichen und ausrüsten. Erst ausgerüstete Items wirken. Volle Tasche lässt Bodenfunde liegen; Wechsel bewahrt das vorherige Item. Profile speichern keine Items, Testschalter oder Währung.

**Prüfung:** Godot 4.7.2: 158 automatisierte Prüfungen ohne Fehler, fünf Scripts via Godot MCP validiert und drei neue D3D12-Vorschauen gesichtet. Manuelle Verständlichkeit/Balance, andere Fenstergrößen und Export bleiben offen. Echoes-Ausgaben/Hideout und dauerhafter Itembesitz sind noch nicht implementiert.

- [Entwicklungschronik](Progress/index.html): neue Vorschauen und gekennzeichnete Vorgeschichte.
- [Masterplan](LOOTFALL_MASTERPLAN.md): Konzept, aktueller Stand und wesentliche Entscheidungen.
- [Devlog](DEVLOG.md): Änderungen, tatsächliche Prüfungen und offene Fragen.
- [Chronik pflegen](Progress/README.md): Medienherkunft und Quellsicherungen.
- [Projektregeln](AGENTS.md): Planabgleich für nächste Pakete.

Das alte Projekt `C:/Users/elias/lootfall` und die Downloads-Kopie des Masterplans bleiben unverändert. Nächster Schritt: aktuellen Run spielen, F1/Profile ausprobieren und anhand einer konkreten Beobachtung abstimmen.

## Lokale Git-Checkpoints

- Spielquellen: eigenes Repository unter `C:/Users/elias/Lootfall 2.0/lootfall-2.0`, erster Checkpoint **bc2877f**, Branch `codex/baseline`.
- INV1: **215f601**, Branch `codex/inventory`; Spiel-Arbeitsbaum nach Commit sauber. Neuer Stand und Screenshots sind im zugehörigen Devlog-Eintrag beschrieben.
- Diese Chronik: separates bestehendes Repository im OneDrive-Ordner, eigener begleitender Commit mit Masterplan, Medien und Verweis auf den Spiel-Commit.
- Nach getesteten Paketen zuerst ausgewählte Spieländerungen committen, danach Spiel-Hash und Medien im Devlog festhalten und die Chronik committen. Beide Git-Zustände prüfen. Lokale `.codex`-/MCP-Konfiguration bleibt ignoriert.
- Aktueller archivierter Laufzeit-Screenshot: [Vor dem Inventar](Progress/captures/2026-10-16_before_inventory.png). Keine Ordner verschoben und keine Remotes/Uploads eingerichtet.
