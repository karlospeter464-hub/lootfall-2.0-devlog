# Lootfall 2.0

**Lokaler CE2-Checkpoint:** Spiel `f6d1be7` auf `codex/ascent-boss-milestones`; GitHub noch auf dem vorherigen Stand. Masterplan §8.11 und die vier neuen Galerie-Aufnahmen dokumentieren die geprüfte Umsetzung.

**Aktuell: CE2 – Ascent & Boss Milestones (19.10.).** Kein regulärer Sieg nach 6; weiter bis Tod oder technischem Sicherheitsstopp (Standard 100). Karten nach 2/4/5 jedes Fünferblocks, Rune Champion bei 5/15, Ash Prophet bei 10/20. Echoes nach 6 moderater: 322/507/742 bei 10/15/20. Seer-Standard drei direkte Treffer. Ziel 15–20 Minuten noch ungeprüft. **603 Checks ohne Fehler.**

**CE2 testen:** F5 für natürliche Runs; isoliert mit -- --test-mode bietet F1 → Rewards & tools den Wave-Jump. Acht neue Regler in Waves/Rewards, Profile v7 (71 Werte) lesen v1–v6. Alte Profile behalten ihre Zahlen; Reset defaults für den neuen Aufstieg. Englischsprachige Anleitung: `C:/Users/elias/Lootfall 2.0/lootfall-2.0/CE2_PLAYTEST.md`. Dieses Paket bleibt lokal; GitHub bis separatem Push-Auftrag auf dem vorigen Stand.

**GitHub (öffentlich, auf ausdrücklichen Nutzerauftrag eingerichtet):** [Spiel](https://github.com/karlospeter464-hub/lootfall-2.0) · [Entwicklungschronik](https://github.com/karlospeter464-hub/lootfall-2.0-devlog). Beide lokalen Repositories bleiben getrennt. Hauptbranch auf GitHub: `main`; Spielentwicklung für CE2 auf `codex/ascent-boss-milestones`. Neue lokale Commits werden nicht automatisch hochgeladen.

**CE1-Spieltest nachgeschärft:** Zwei Guardians, mehr Leben und echte BLOCKED-Anzeige; Seer-Unterbrechung schon mit Swift + einer Quick-Karte technisch nachgewiesen. 349 Checks ohne Fehler, neue native Vorschau in der Galerie. Spiel-Commit `ce3744d`, Branch `codex/counterplay-feedback`. Bei altem geladenem F1-Profil **Reset defaults** verwenden, um neue Startwerte zu testen; alte Profile werden nicht stillschweigend verändert.

**Weiter vorhandene CE1-Systeme:** Rune Guardian ab Welle 3, maximal zwei gleichzeitig, 6× Wellenleben: flache Rüstung mit Schadensminimum und sichtbaren BLOCKED-Zahlen. Cinder Seer mit 6× Test-Leben, drei direkte Treffer während seiner 1,4-s-Warnung unterbrechen den Zauber. Er hält weniger Abstand und erholt sich 2 s. F1 → Enemies enthält die neuen Werte; sie gelten für neue Gegner. Verwertung/Itemlevel bleiben geparkt.

**Build-Vergleich:** Spiel mit `-- --test-mode` starten, dann F1 → Rewards & tools → Rapid / Heavy / Area sowie Chaser group / Cinder Seer / Rune Guardian wählen → Start CE1 test → F1 schließen und nach rechts zielen. Das setzt nur den isolierten Testrun zurück, benutzt bestehende Karten/Items, Seed 42 und keine aktiven Talente. Tuning bleibt erhalten, normale Wellen laufen nach dem Encounter weiter. Vollständiger Startbefehl und neun Testkombinationen im englischen Spiel-README: `C:/Users/elias/Lootfall 2.0/lootfall-2.0/README.md`, Abschnitt CE1. Lokal gesichert als `da58b43` auf `codex/combat-counterplay`.

**Starten:** `C:/Users/elias/Lootfall 2.0/lootfall-2.0/project.godot` in Godot öffnen, **F5**. Falls nach der Hauptszene gefragt wird: `scenes/arena.tscn`. Spielcode und Oberfläche sind Englisch; dieser separate OneDrive-Ordner enthält die deutsche Chronik.

**Neu am 18.10.:** Ab Welle 2 kommen Cinder Seers hinzu. Ihre pinke Bodenmarkierung bleibt an der anvisierten Position; innerhalb von 1,4 s ausweichen oder den Seer ausschalten. Maximal zwei Seers, Gesamtcap 12 als Testwert. **I → Taschenitem wählen → Destroy selected** schafft Platz ohne neuen Bodenfund oder Belohnung. Keine automatische Vernichtung.

**Seltenheiten aktiv:** Erst 10 % Itemchance, danach getrennte Würfe Legendary 2 % → Rare 25 % → Magic 50 % → Normal als Rest. Feste Typen: Ember Scepter Normal/weiß, Swift Scepter Magic/blau, Focus Grimoire Rare/gold, Cinder Codex Legendary/orange. Effekte unverändert. Ein natürlicher Codex pro Run bleibt; danach fällt die Kaskade zu Rare durch. Vorher beträgt seine tatsächliche Chance 0,2 % pro berechtigtem Kill, nicht mehr die frühere 2-%-Killchance. Werte sind in F1 änderbar.

**Bestehender Meta-Loop P2:** Start in Emberhaven → Run → Tod/Sicherheitsstopp und Echoes → **Return to Town** → **Awaken the Skill Tree** → investieren → **Start Run**. 15 verbundene Knoten für Power/Vitality/Flow mit drei besonderen Abschlussboni. Alle Knoten gleichzeitig nutzbar; **Reset all** erstattet kostenlos die tatsächlich gezahlten Echoes. Talentbesitz gilt ab dem nächsten Run und bleibt mit Echoes/Bestwelle gespeichert. Alter Spielstand bleibt ladbar.

**Startwerte:** Je Ast drei kleine Grundwerte, ein stärkeres Zwischenziel und ein Abschlussbonus: First Spark verstärkt Ersttreffer gegen volle Gegnerleben; Renewal heilt nach einer abgeschlossenen Welle; Second Wind verkürzt nach echtem Schaden kurz das Angriffsintervall. Kosten je Tiefe 30/45/65/90/130 Echoes, gesamter Baum 1080. Details stehen im englischen Spiel-README und Masterplan 8.5.

**Weiter vorhanden:** Acht Taschenfelder und Zepter-/Buchslot mit vier festen Items, die erst beim Ausrüsten wirken. Run-Items/Karten werden beim neuen Versuch zurückgesetzt. Wellenkarten nach 2/4/5 je Fünferblock; Echoes weiterhin nur einmal am Run-Ende für abgeschlossene Wellen. Bodenloot zeigt nur den Namen, Beschreibungen stehen im pausierten Inventar.

**Dev-Konsole: F1.** 71 einstellbare Werte einschließlich separater Item-/Rarity-Chancen, tatsächlicher Dropanteile, Seer-Werten und Baum. Neue Profile v7 lesen v1–v6; alte Zahlen werden mit sichtbarem Hinweis unter dem neuen Lootmodell verwendet, neue Felder erhalten Defaults. Baumpreise gelten für neue Käufe, Rückerstattung nutzt bezahlte Preise. Testaktionen können echte Echoes beeinflussen. Vollständige englische Anleitung und Testbefehle: `README.md` im Spielordner.

Steuerung: WASD bewegen, Maus zielen, linke Maustaste halten zaubern, **I** Equipment, **Escape** aktuelles Fenster schließen oder pausieren. Zum Loot-Test: F1 → Rewards & tools → Item wählen → Drop selected item → schließen und aufheben → I → vergleichen und ausrüsten. Erst ausgerüstete Items wirken. Volle Tasche lässt Bodenfunde liegen; Wechsel bewahrt das vorherige Item. Profile speichern keine Items, Testschalter oder Währung.

**Prüfung:** Godot 4.7.2: 603 automatisierte Prüfungen ohne Fehler, darunter 249 Ascent-, 74 CE1- und 28 Rarity-Checks und eine Verteilungsprüfung mit 100.000 Ziehungen. Sechs geänderte Gameplay-Scripts via Godot MCP validiert, vier native CE2-Vorschauen gesichtet. Manuelle Begegnungstiefe/Lootbalance, andere Fenstergrößen und Export bleiben offen; keine Qualitätsvarianten oder dauerhaften Run-Items.

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
- Seltenheitskaskade: **5caea96**, Branch `codex/rarity-cascade`; feste Pools und neue Wahrscheinlichkeitsbasis umgesetzt.
- Diese Chronik: separates bestehendes Repository im OneDrive-Ordner, eigener begleitender Commit mit Masterplan, Medien und Verweis auf den Spiel-Commit.
- Nach getesteten Paketen zuerst ausgewählte Spieländerungen committen, danach Spiel-Hash und Medien im Devlog festhalten und die Chronik committen. Beide Git-Zustände prüfen. Lokale `.codex`-/MCP-Konfiguration bleibt ignoriert.
- Aktueller archivierter Laufzeit-Screenshot: [Vor dem Inventar](Progress/captures/2026-10-16_before_inventory.png). Keine Ordner verschoben und keine Remotes/Uploads eingerichtet.
