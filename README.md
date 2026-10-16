# Lootfall 2.0

**Starten:** `C:/Users/elias/Lootfall 2.0/lootfall-2.0/project.godot` in Godot öffnen, **F5**. Falls nach der Hauptszene gefragt wird: `scenes/arena.tscn`. Spielcode und Oberfläche sind Englisch; dieser separate OneDrive-Ordner enthält die deutsche Chronik.

**Aktuelles Paket:** Zufälliger Cinder Codex als Run-Item mit Flächentreffern. Echoes für abgeschlossene Wellen bei Tod/Sieg, einmalig gespeichert; Wallet und Bestwelle bleiben erhalten. Die Karten kommen weiterhin nach Welle 2 und 4. Startwerte: 2 % Dropchance, ein Buch pro Run, Explosion Radius 85 / 60 % Geschossschaden, Echoes = 10 × (1 + 2 + … + abgeschlossene Wellen).

**Dev-Konsole: F1.** 28 einstellbare Werte, Live-Metriken, Testaktionen, Standard-Reset und manuell speicherbare Profile. Während der Bearbeitung pausiert das Spiel. Werte haben Wirkungshinweise; Gegnerwerte gelten für neue Gegner. Testaktionen können echte Echoes beeinflussen. Vollständige englische Anleitung und Testbefehle: `README.md` im Spielordner.

Steuerung: WASD bewegen, Maus zielen, linke Maustaste halten zaubern, Escape pausieren. Zum Loot-Test: F1 → Rewards & tools → Drop Codex → schließen und das Buch aufheben. Dort gibt es auch HP auffüllen, Gegner einfrieren und einen RNG-Seed. Profile speichern keine Testschalter oder Währung.

**Prüfung:** Godot 4.7.2: 112 automatisierte Prüfungen ohne Fehler, native D3D12-Vorschauen gesichtet. Manuelle Balance-/Loot-/Konsolenabnahme bleibt offen. Echoes-Ausgaben/Hideout sind noch nicht implementiert; kein Inventar oder dauerhafter Itembesitz.

- [Entwicklungschronik](Progress/index.html): neue Vorschauen und gekennzeichnete Vorgeschichte.
- [Masterplan](LOOTFALL_MASTERPLAN.md): Konzept, aktueller Stand und wesentliche Entscheidungen.
- [Devlog](DEVLOG.md): Änderungen, tatsächliche Prüfungen und offene Fragen.
- [Chronik pflegen](Progress/README.md): Medienherkunft und Quellsicherungen.
- [Projektregeln](AGENTS.md): Planabgleich für nächste Pakete.

Das alte Projekt `C:/Users/elias/lootfall` und die Downloads-Kopie des Masterplans bleiben unverändert. Nächster Schritt: aktuellen Run spielen, F1/Profile ausprobieren und anhand einer konkreten Beobachtung abstimmen.

## Git-Stand vor dem Inventar

- Spielquellen: eigenes Repository unter `C:/Users/elias/Lootfall 2.0/lootfall-2.0`, erster Checkpoint **bc2877f**, Branch `codex/baseline`.
- Diese Chronik: separates bestehendes Repository im OneDrive-Ordner, eigener begleitender Commit mit Masterplan, Medien und Verweis auf den Spiel-Commit.
- Nach getesteten Paketen zuerst ausgewählte Spieländerungen committen, danach Spiel-Hash und Medien im Devlog festhalten und die Chronik committen. Beide Git-Zustände prüfen. Lokale `.codex`-/MCP-Konfiguration bleibt ignoriert.
- Aktueller archivierter Laufzeit-Screenshot: [Vor dem Inventar](Progress/captures/2026-10-16_before_inventory.png). Keine Ordner verschoben und keine Remotes/Uploads eingerichtet.
