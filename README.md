# Lootfall 2.0

**Aktuell – Art Vertical Slice 01:** Erster eigener Anime-Mage in der bestehenden Player-Szene, nur die Darstellung ausgetauscht. Echtes transparentes PNG, Fußpivot, lineare Mipmaps und Originalkörper als Inspector-Fallback. 917 Prüfungen ohne Fehler; vier tatsächliche Engine-Bilder mit Vorher/Nachher und laufendem Kampf in der Galerie. Frontalperspektive und Detailgrad noch Prototyp. Spiel lokal 5691976; F5 zum Testen. ART_DIRECTION.md und ASSET_ROADMAP.md von GitHub lokal integriert; nur Apprentice freigegeben, kein ganzes A1-Paket oder Push. Das vorhandene Windows-ZIP bleibt vor diesem Art-Schritt.

**Lokaler Playtest v0.1:** Windows-x86_64-Release-ZIP liegt unter `C:/Users/elias/Lootfall 2.0/Exports/Playtest_v0.1/Lootfall_Prototype_Playtest_v0.1_Windows.zip` (37,6 MiB; außerhalb Git). Vier Dateien: Lootfall.exe, Lootfall.pck, README.txt, GODOT_LICENSES.txt. Gameplay unverändert CE5; Source-898, PCK-688 und sechs Paketprüfungen bestanden. Echter EXE-Start/Kampf/Tod gesehen, vollständiger nativer Fortschrittslauf noch offen. Spiel-Exportdokumentation lokal 3010a95; kein neuer Push/Upload/Versand. Genaue Grenzen: WINDOWS_PLAYTEST.md im Spielprojekt.

**Aktuell – CE5:** Kindling, Emberguard und Arcane Momentum ersetzen die drei reinen Einstiegs-Grundwerte. Neuer farbiger Skilltree mit Kaufzuständen, Details und Tastaturnavigation; Emberhaven zeigt bezahlbare Ziele. 15 IDs, Verbindungen, Kosten, exakte kostenlose Erstattung und Run-Snapshot bleiben erhalten. Alte Käufe erhalten die neuen Effekte im folgenden Run. F1: 92 Werte / Profil v10; Progress weiter v2. 898 Checks ohne Fehler, vier native Bilder in der Galerie. Menschliche Abnahme offen. Ohne Startguthaben ermöglichen zwei geklärte Wellen den ersten Kauf (30 Echoes); kürzere Runs garantieren ihn nicht. Siehe englisches CE5_PLAYTEST.md im Spielprojekt.

**Vorheriges Paket: CE4 – Item Discovery & Synergy Expansion (19.10.).** Acht Items: Echo/Hunter-Scepter und Storm/Phoenix-Bücher ergänzen die bestehenden vier. 5 % Itemchance bei gleicher Rarity-Kaskade. Champion-Walk-Cooldown 2 s nach Erholung, Timing in F1. Masterplan §8.15. **835 Checks ohne Fehler**, sechs MCP-Scriptprüfungen und zwei native gestellte Vorschauen; natürliche Itemvielfalt/Balance offen.

**CE4 testen:** F5 → F1 → Rewards & tools → eines von acht Items wählen → Drop selected item → aufheben und mit I ausrüsten. Isoliert mit -- --test-mode zusätzlich CE4-Einzel-/Gruppentest auswählbar. Anleitung im Spielprojekt: CE4_PLAYTEST.md. 87 F1-Werte, Profile v9 lesen v1–v8; Reset defaults für neue 5-%-Itemchance.

**CE2 bleibt erhalten:** Aufstieg bis Tod oder technischem Sicherheitsstopp 100, Karten 2/4/5 je Fünferblock, Champion/Prophet 5/10. Echoes, Baum und Inventar bleiben erhalten. Seer-Relevanz bleibt separat offen (§8.12); das Follow-up ergänzt den Solo-Champion-Ansturm.

**GitHub:** [Spiel](https://github.com/karlospeter464-hub/lootfall-2.0) · [Entwicklungschronik](https://github.com/karlospeter464-hub/lootfall-2.0-devlog). Am 19.10.2026 auf ausdrücklichen Nutzerauftrag aktualisiert: Spiel-main enthält CE3, Follow-up, CE4 und CE5 bis `00e378d`; Chronik-main erhält Masterplan, Devlog und zugehörige Screenshots einschließlich CE5. Beide Repositories bleiben getrennt; keine automatische Synchronisierung eingerichtet.

**CE1-Spieltest nachgeschärft:** Zwei Guardians, mehr Leben und echte BLOCKED-Anzeige; Seer-Unterbrechung schon mit Swift + einer Quick-Karte technisch nachgewiesen. 349 Checks ohne Fehler, neue native Vorschau in der Galerie. Spiel-Commit `ce3744d`, Branch `codex/counterplay-feedback`. Bei altem geladenem F1-Profil **Reset defaults** verwenden, um neue Startwerte zu testen; alte Profile werden nicht stillschweigend verändert.

**Weiter vorhandene CE1-Systeme:** Rune Guardian ab Welle 3, maximal zwei gleichzeitig, 6× Wellenleben: flache Rüstung mit Schadensminimum und sichtbaren BLOCKED-Zahlen. Cinder Seer mit 6× Test-Leben, drei direkte Treffer während seiner 1,4-s-Warnung unterbrechen den Zauber. Er hält weniger Abstand und erholt sich 2 s. F1 → Enemies enthält die neuen Werte; sie gelten für neue Gegner. Verwertung/Itemlevel bleiben geparkt.

**Build-Vergleich:** Spiel mit `-- --test-mode` starten, dann F1 → Rewards & tools → Rapid / Heavy / Area sowie Chaser group / Cinder Seer / Rune Guardian wählen → Start CE1 test → F1 schließen und nach rechts zielen. Das setzt nur den isolierten Testrun zurück, benutzt bestehende Karten/Items, Seed 42 und keine aktiven Talente. Tuning bleibt erhalten, normale Wellen laufen nach dem Encounter weiter. Vollständiger Startbefehl und neun Testkombinationen im englischen Spiel-README: `C:/Users/elias/Lootfall 2.0/lootfall-2.0/README.md`, Abschnitt CE1. Lokal gesichert als `da58b43` auf `codex/combat-counterplay`.

**Starten:** `C:/Users/elias/Lootfall 2.0/lootfall-2.0/project.godot` in Godot öffnen, **F5**. Falls nach der Hauptszene gefragt wird: `scenes/arena.tscn`. Spielcode und Oberfläche sind Englisch; dieser separate OneDrive-Ordner enthält die deutsche Chronik.

**Neu am 18.10.:** Ab Welle 2 kommen Cinder Seers hinzu. Ihre pinke Bodenmarkierung bleibt an der anvisierten Position; innerhalb von 1,4 s ausweichen oder den Seer ausschalten. Maximal zwei Seers, Gesamtcap 12 als Testwert. **I → Taschenitem wählen → Destroy selected** schafft Platz ohne neuen Bodenfund oder Belohnung. Keine automatische Vernichtung.

**Seltenheiten aktiv:** Erst 10 % Itemchance, danach getrennte Würfe Legendary 2 % → Rare 25 % → Magic 50 % → Normal als Rest. Feste Typen: Ember Scepter Normal/weiß, Swift Scepter Magic/blau, Focus Grimoire Rare/gold, Cinder Codex Legendary/orange. Effekte unverändert. Ein natürlicher Codex pro Run bleibt; danach fällt die Kaskade zu Rare durch. Vorher beträgt seine tatsächliche Chance 0,2 % pro berechtigtem Kill, nicht mehr die frühere 2-%-Killchance. Werte sind in F1 änderbar.

**Bestehender Meta-Loop P2:** Start in Emberhaven → Run → Tod/Sicherheitsstopp und Echoes → **Return to Town** → **Awaken the Skill Tree** → investieren → **Start Run**. 15 verbundene Knoten für Power/Vitality/Flow mit drei besonderen Abschlussboni. Alle Knoten gleichzeitig nutzbar; **Reset all** erstattet kostenlos die tatsächlich gezahlten Echoes. Talentbesitz gilt ab dem nächsten Run und bleibt mit Echoes/Bestwelle gespeichert. Alter Spielstand bleibt ladbar.

**Historische P2-Startwerte (CE5 ersetzt die Einstiege):** Je Ast drei kleine Grundwerte, ein stärkeres Zwischenziel und ein Abschlussbonus: First Spark verstärkt Ersttreffer gegen volle Gegnerleben; Renewal heilt nach einer abgeschlossenen Welle; Second Wind verkürzt nach echtem Schaden kurz das Angriffsintervall. Kosten je Tiefe 30/45/65/90/130 Echoes, gesamter Baum 1080. Details stehen im englischen Spiel-README und Masterplan 8.5.

**Weiter vorhanden:** Acht Taschenfelder und Zepter-/Buchslot mit vier festen Items, die erst beim Ausrüsten wirken. Run-Items/Karten werden beim neuen Versuch zurückgesetzt. Wellenkarten nach 2/4/5 je Fünferblock; Echoes weiterhin nur einmal am Run-Ende für abgeschlossene Wellen. Bodenloot zeigt nur den Namen, Beschreibungen stehen im pausierten Inventar.

**Dev-Konsole: F1.** 87 einstellbare Werte einschließlich separater Item-/Rarity-Chancen, tatsächlicher Dropanteile, Seer-Werten und Baum. Neue Profile v9 lesen v1–v8; alte Zahlen werden mit sichtbarem Hinweis unter dem neuen Lootmodell verwendet, neue Felder erhalten Defaults. Baumpreise gelten für neue Käufe, Rückerstattung nutzt bezahlte Preise. Testaktionen können echte Echoes beeinflussen. Vollständige englische Anleitung und Testbefehle: `README.md` im Spielordner.

Steuerung: WASD bewegen, Maus zielen, linke Maustaste halten zaubern, **I** Equipment, **Escape** aktuelles Fenster schließen oder pausieren. Zum Loot-Test: F1 → Rewards & tools → Item wählen → Drop selected item → schließen und aufheben → I → vergleichen und ausrüsten. Erst ausgerüstete Items wirken. Volle Tasche lässt Bodenfunde liegen; Wechsel bewahrt das vorherige Item. Profile speichern keine Items, Testschalter oder Währung.

**Prüfung:** Godot 4.7.2: 835 Checks ohne Fehler (770 bestehende einschließlich acht Icons + 65 Item-Synergien). Sechs CE4-Gameplay-Scripts via MCP gültig; zwei native Vorschauen gesichtet. Kurzer 256-Projektil-/64-Ziel-Batch, kein Langzeitbenchmark. Natürliche Vielfalt, Lootfrequenz, Phoenix-Überleben und Build-Balance bleiben offen.

- [Entwicklungschronik](Progress/index.html): neue Vorschauen und gekennzeichnete Vorgeschichte.
- [Masterplan](LOOTFALL_MASTERPLAN.md): Konzept, aktueller Stand und wesentliche Entscheidungen.
- [Devlog](DEVLOG.md): Änderungen, tatsächliche Prüfungen und offene Fragen.
- [Chronik pflegen](Progress/README.md): Medienherkunft und Quellsicherungen.
- [Projektregeln](AGENTS.md): Planabgleich für nächste Pakete.

Das alte Projekt `C:/Users/elias/lootfall` und die Downloads-Kopie des Masterplans bleiben unverändert. Nächster Schritt: mehrere natürliche Runs nach CE4_PLAYTEST.md auf überraschende Item-/Kartenkombinationen und ausreichende Lootvielfalt bei 5 % prüfen.

## Lokale Git-Checkpoints

- Spielquellen: eigenes Repository unter `C:/Users/elias/Lootfall 2.0/lootfall-2.0`, erster Checkpoint **bc2877f**, Branch `codex/baseline`.
- INV1: **215f601**, Branch `codex/inventory`; Spiel-Arbeitsbaum nach Commit sauber. Neuer Stand und Screenshots sind im zugehörigen Devlog-Eintrag beschrieben.
- P2: **a1d2241**, Branch `codex/town-skilltree`; 15 Talente und Stadt-Loop, vier Screenshots und echte Prüfergebnisse im P2-Devlog-Eintrag.
- Begegnung/Entsorgung: **78dcaaf**, Branch `codex/encounters-disposal`; Seltenheitskaskade noch offen.
- Seltenheitskaskade: **5caea96**, Branch `codex/rarity-cascade`; feste Pools und neue Wahrscheinlichkeitsbasis umgesetzt.
- Diese Chronik: separates bestehendes Repository im OneDrive-Ordner, eigener begleitender Commit mit Masterplan, Medien und Verweis auf den Spiel-Commit.
- Nach getesteten Paketen zuerst ausgewählte Spieländerungen committen, danach Spiel-Hash und Medien im Devlog festhalten und die Chronik committen. Beide Git-Zustände prüfen. Lokale `.codex`-/MCP-Konfiguration bleibt ignoriert.
- Aktueller archivierter Laufzeit-Screenshot: [Vor dem Inventar](Progress/captures/2026-10-16_before_inventory.png). Keine Ordner verschoben und keine Remotes/Uploads eingerichtet.
