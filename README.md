# Lootfall 2.0

**Starten:** `C:/Users/elias/Lootfall 2.0/lootfall-2.0/project.godot` in Godot öffnen, **F5**. Falls nach der Hauptszene gefragt wird: `scenes/arena.tscn`. Spielcode und Oberfläche sind Englisch; dieser separate OneDrive-Ordner enthält die deutsche Chronik.

**Neu am 18.10.:** Ab Welle 2 kommen Cinder Seers hinzu. Ihre pinke Bodenmarkierung bleibt an der anvisierten Position; innerhalb von 1,1 s ausweichen oder den Seer ausschalten. Maximal zwei Seers, Gesamtcap 12 als Testwert. **I → Taschenitem wählen → Destroy selected** schafft Platz ohne neuen Bodenfund oder Belohnung. Automatische Vernichtung und die angefragte Seltenheitskaskade sind noch nicht aktiv; dazu fehlen zwei Produktentscheidungen.

**Aktuelles Paket P2:** Start in Emberhaven → Run → Tod/Sieg und Echoes → **Return to Town** → **Awaken the Skill Tree** → investieren → **Start Run**. 15 verbundene Knoten für Power/Vitality/Flow mit drei besonderen Abschlussboni. Alle Knoten gleichzeitig nutzbar; **Reset all** erstattet kostenlos die tatsächlich gezahlten Echoes. Talentbesitz gilt ab dem nächsten Run und bleibt mit Echoes/Bestwelle gespeichert. Alter Spielstand bleibt ladbar.

**Startwerte:** Je Ast drei kleine Grundwerte, ein stärkeres Zwischenziel und ein Abschlussbonus: First Spark verstärkt Ersttreffer gegen volle Gegnerleben; Renewal heilt nach einer abgeschlossenen Welle; Second Wind verkürzt nach echtem Schaden kurz das Angriffsintervall. Kosten je Tiefe 30/45/65/90/130 Echoes, gesamter Baum 1080. Details stehen im englischen Spiel-README und Masterplan 8.5.

**Weiter vorhanden:** Acht Taschenfelder und Zepter-/Buchslot mit vier festen Items, die erst beim Ausrüsten wirken. Run-Items/Karten werden beim neuen Versuch zurückgesetzt. Wellenkarten weiterhin nach 2/4; Echoes weiterhin nur einmal am Run-Ende für abgeschlossene Wellen. Bodenloot zeigt nur den Namen, Beschreibungen stehen im pausierten Inventar.

**Dev-Konsole: F1.** 52 einstellbare Werte einschließlich Seer-Werten, Baum-Boni und Preisen. Alte Profile mit 28/33/48 Werten bleiben ladbar; neue Profile v4. Baumpreise gelten für neue Käufe, Rückerstattung nutzt gespeicherte alte Preise. Effekte aktiver Talente live einstellbar; Seer-Werte für neue Gegner. Testaktionen können echte Echoes beeinflussen. Vollständige englische Anleitung und Testbefehle: `README.md` im Spielordner.

Steuerung: WASD bewegen, Maus zielen, linke Maustaste halten zaubern, **I** Equipment, **Escape** aktuelles Fenster schließen oder pausieren. Zum Loot-Test: F1 → Rewards & tools → Item wählen → Drop selected item → schließen und aufheben → I → vergleichen und ausrüsten. Erst ausgerüstete Items wirken. Volle Tasche lässt Bodenfunde liegen; Wechsel bewahrt das vorherige Item. Profile speichern keine Items, Testschalter oder Währung.

**Prüfung:** Godot 4.7.2: 247 automatisierte Prüfungen ohne Fehler. Vier geänderte Gameplay-Scripts und neue Suite via Godot MCP validiert, zwei neue D3D12-Vorschauen gesichtet. P2-Stadt-/Baumtest zuvor zusätzlich nativ bestanden. Manuelle Begegnungstiefe/Balance, andere Fenstergrößen und Export bleiben offen; keine begehbare Stadt, weiteren Klassen oder dauerhaften Run-Items.

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
- Begegnung/Entsorgung: **78dcaaf**, Branch `codex/encounters-disposal`; Seltenheitskaskade noch offen.
- Diese Chronik: separates bestehendes Repository im OneDrive-Ordner, eigener begleitender Commit mit Masterplan, Medien und Verweis auf den Spiel-Commit.
- Nach getesteten Paketen zuerst ausgewählte Spieländerungen committen, danach Spiel-Hash und Medien im Devlog festhalten und die Chronik committen. Beide Git-Zustände prüfen. Lokale `.codex`-/MCP-Konfiguration bleibt ignoriert.
- Aktueller archivierter Laufzeit-Screenshot: [Vor dem Inventar](Progress/captures/2026-10-16_before_inventory.png). Keine Ordner verschoben und keine Remotes/Uploads eingerichtet.
