# Lootfall 2.0

**Starten:** `C:/Users/elias/Lootfall 2.0/lootfall-2.0/project.godot` in Godot öffnen, **F5**. Falls nach der Hauptszene gefragt wird: `scenes/arena.tscn`. Spielcode und Oberfläche sind Englisch; dieser separate OneDrive-Ordner enthält die deutsche Chronik.

**Aktuelles Paket P2:** Start in Emberhaven → Run → Tod/Sieg und Echoes → **Return to Town** → **Awaken the Skill Tree** → investieren → **Start Run**. 15 verbundene Knoten für Power/Vitality/Flow mit drei besonderen Abschlussboni. Alle Knoten gleichzeitig nutzbar; **Reset all** erstattet kostenlos die tatsächlich gezahlten Echoes. Talentbesitz gilt ab dem nächsten Run und bleibt mit Echoes/Bestwelle gespeichert. Alter Spielstand bleibt ladbar.

**Startwerte:** Je Ast drei kleine Grundwerte, ein stärkeres Zwischenziel und ein Abschlussbonus: First Spark verstärkt Ersttreffer gegen volle Gegnerleben; Renewal heilt nach einer abgeschlossenen Welle; Second Wind verkürzt nach echtem Schaden kurz das Angriffsintervall. Kosten je Tiefe 30/45/65/90/130 Echoes, gesamter Baum 1080. Details stehen im englischen Spiel-README und Masterplan 8.5.

**Weiter vorhanden:** Acht Taschenfelder und Zepter-/Buchslot mit vier festen Items, die erst beim Ausrüsten wirken. Run-Items/Karten werden beim neuen Versuch zurückgesetzt. Wellenkarten weiterhin nach 2/4; Echoes weiterhin nur einmal am Run-Ende für abgeschlossene Wellen. Bodenloot zeigt nur den Namen, Beschreibungen stehen im pausierten Inventar.

**Dev-Konsole: F1.** 48 einstellbare Werte einschließlich Baum-Boni und Preisen, Live-Metriken, gezielte Testfunde, Standard-Reset und manuell speicherbare Profile. Alte Profile mit 28/33 Werten bleiben ladbar. Baumpreise gelten für neue Käufe, Rückerstattung nutzt gespeicherte alte Preise. Effekte aktiver Talente live einstellbar. Testaktionen können echte Echoes beeinflussen. Vollständige englische Anleitung und Testbefehle: `README.md` im Spielordner.

Steuerung: WASD bewegen, Maus zielen, linke Maustaste halten zaubern, **I** Equipment, **Escape** aktuelles Fenster schließen oder pausieren. Zum Loot-Test: F1 → Rewards & tools → Item wählen → Drop selected item → schließen und aufheben → I → vergleichen und ausrüsten. Erst ausgerüstete Items wirken. Volle Tasche lässt Bodenfunde liegen; Wechsel bewahrt das vorherige Item. Profile speichern keine Items, Testschalter oder Währung.

**Prüfung:** Godot 4.7.2: 228 automatisierte Prüfungen ohne Fehler, neun Scripts via Godot MCP validiert und vier neue D3D12-Vorschauen gesichtet. Stadt-/Baumtest zusätzlich nativ samt simuliertem Mauskauf bestanden. Manuelle P2-Motivation/Balance, andere Fenstergrößen und Export bleiben offen; keine begehbare Stadt, weiteren Klassen oder dauerhaften Run-Items.

- [Entwicklungschronik](Progress/index.html): neue Vorschauen und gekennzeichnete Vorgeschichte.
- [Masterplan](LOOTFALL_MASTERPLAN.md): Konzept, aktueller Stand und wesentliche Entscheidungen.
- [Devlog](DEVLOG.md): Änderungen, tatsächliche Prüfungen und offene Fragen.
- [Chronik pflegen](Progress/README.md): Medienherkunft und Quellsicherungen.
- [Projektregeln](AGENTS.md): Planabgleich für nächste Pakete.

Das alte Projekt `C:/Users/elias/lootfall` und die Downloads-Kopie des Masterplans bleiben unverändert. Nächster Schritt: vollständigen Stadt-/Kauf-/Run-Loop spielen und beobachten, ob der nächste Wunschknoten motiviert.

## Lokale Git-Checkpoints

- Spielquellen: eigenes Repository unter `C:/Users/elias/Lootfall 2.0/lootfall-2.0`, erster Checkpoint **bc2877f**, Branch `codex/baseline`.
- INV1: **215f601**, Branch `codex/inventory`; Spiel-Arbeitsbaum nach Commit sauber. Neuer Stand und Screenshots sind im zugehörigen Devlog-Eintrag beschrieben.
- P2: **a1d2241**, Branch `codex/town-skilltree`; 15 Talente und Stadt-Loop, vier Screenshots und echte Prüfergebnisse im P2-Devlog-Eintrag.
- Diese Chronik: separates bestehendes Repository im OneDrive-Ordner, eigener begleitender Commit mit Masterplan, Medien und Verweis auf den Spiel-Commit.
- Nach getesteten Paketen zuerst ausgewählte Spieländerungen committen, danach Spiel-Hash und Medien im Devlog festhalten und die Chronik committen. Beide Git-Zustände prüfen. Lokale `.codex`-/MCP-Konfiguration bleibt ignoriert.
- Aktueller archivierter Laufzeit-Screenshot: [Vor dem Inventar](Progress/captures/2026-10-16_before_inventory.png). Keine Ordner verschoben und keine Remotes/Uploads eingerichtet.
