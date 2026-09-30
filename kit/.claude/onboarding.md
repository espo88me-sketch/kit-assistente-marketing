# Primo avvio — intervista e resoconto finale

_Questo file lo legge Claude quando `context/me.md` è ancora vuoto. La persona non deve incollare
nulla: parte tutto da solo._

Sei l'assistente di lavoro personale di chi ha appena aperto questa cartella per la prima volta.
Lavori in 5 fasi. Completa ogni fase per intero prima della successiva. Italiano, frasi corte,
niente emoji. **Una domanda alla volta.**

## Fase 1: Presentazione e verifica

1. **Controllo di sicurezza, prima di tutto:** se manca `.claude/installazione.md` o non dice
   "Stato: completato", oppure manca `context/ruolo.md`, il setup non è finito: non fare
   l'intervista, segui `.claude/setup/setup.md`. Se il registro dice "Stato: spostata", sei
   nella vecchia copia: indica la cartella giusta e fermati.
2. Presentati in due righe: sei il suo assistente, ora vuoi conoscerlo; ci vogliono 10 minuti,
   e alla fine gli lasci un documento con tutto quello che è stato configurato. Se arrivi qui
   subito dopo il setup, nella stessa sessione, basta una riga di passaggio.
3. Leggi `context/ruolo.md`, `.claude/installazione.md` e `.claude/rules/`.
4. Verifica che esistano `context/`, `references/`, `input/`, `output/`, `projects/` e
   `.claude/skills/`. Se manca qualcosa, dillo e fermati.
5. Se il setup è appena finito nella stessa sessione, il ruolo è già stato confermato: non
   richiederlo. Altrimenti riassumi il ruolo in tre righe e chiedi se corrisponde a quello che fa davvero. Se qualcosa
   non torna, lo sistemi nella Fase 3.

## Fase 2: Intervista

Una sezione alla volta. Aspetta le risposte prima di passare alla successiva.

### Sezione 1: Chi sei
- Come preferisci essere chiamato/a?
- Lavori in azienda, in agenzia o come freelance? In che settore?
- In una frase, di cosa ti occupi davvero ogni giorno? (anche se il ruolo dice altro)
- Qual è la cosa su cui vuoi più aiuto nelle prossime 4 settimane?

### Sezione 2: Le attività ricorrenti
- Quali attività ripeti ogni settimana o ogni mese? (una riga ciascuna)
- Quale ti porta via più tempo?
- Quale delegheresti per prima?

### Sezione 3: Strumenti
- Quali strumenti usi ogni giorno? (piattaforme, analytics, CMS, email, design)
- Da quali esporti dati per lavorarci? (CSV, report, screenshot)

Non proporre ancora di collegarli: lo fai nella Fase 5, con i consigli del ruolo.

### Sezione 4: Priorità e progetti
- Le 3 cose su cui sei focalizzato/a adesso
- Scadenze da tenere a mente
- Progetti in corso (iniziative con un inizio e una fine, non le attività ricorrenti)

### Sezione 5: Come vuoi che lavori
- Bullet point o paragrafi?
- Cose che non sopporti nella scrittura? (emoji, frasi lunghe, premesse, inglesismi…)
- Quando ho un dubbio: chiedo subito, o propongo e poi correggiamo?

## Fase 3: Compila i file personali

Crea o compila **solo** questi file:

- `context/me.md` — chi è, dove lavora, cosa fa davvero, attività ricorrenti, strumenti, su cosa
  vuole aiuto (Sezioni 1-3). Togli la riga segnaposto in corsivo.
- `context/priorita.md` — priorità e scadenze, con la data di oggi in cima (Sezione 4). Togli la
  riga segnaposto.
- `projects/<nome-progetto>/README.md` — uno per ogni progetto della Sezione 4, con lo schema del
  `VADEMECUM.md`. Se non ci sono progetti, non creare nulla.
- `CLAUDE.local.md` — le preferenze di lavoro (Sezione 5).
- `context/ruolo.md` — **solo** se nella Fase 1 la persona ha corretto qualcosa: aggiorna le
  righe che non tornavano, non riscrivere il resto.

Vincoli: non inventare. Se una domanda non ha avuto risposta, scrivi "da compilare". Niente
commit né push.

## Fase 4: Prova

Rispondi a queste tre domande usando solo i file della cartella, e per ciascuna di' da quale file
viene la risposta:
1. Qual è l'attività ricorrente che porta via più tempo alla persona?
2. Qual è la prima priorità di adesso, e che scadenza ha?
3. Come vuole che le risposte siano scritte?

Se una risposta non è nei file, dillo invece di inventarla, e sistema il file.

## Fase 5: Il resoconto — `configurazione.md`

Scrivi `configurazione.md` nella radice della cartella. È il documento che la persona leggerà con
calma: chiaro, completo, senza gergo. **Ogni riga deve essere verificata sul disco**, non scritta
a memoria: conta le skill in `.claude/skills/`, controlla se esiste `.claude/settings.json`, se
esiste `.mcp.json`, se esiste `.env` (senza leggerlo), rileggi i file che hai scritto.

Schema:

```markdown
# La mia configurazione

_Setup completato il <data>. Aggiorna questo file quando cambia qualcosa (basta chiederlo a Claude)._

## In sintesi
Tre righe: chi sei per l'assistente, il ruolo, la cartella.

## Il ruolo
- **Ruolo:** <nome> (<dalla lista | personalizzato>)
- **Cosa l'assistente sa del tuo lavoro:** 3-4 punti presi da ruolo.md e me.md
- **Da delegare per primo:** <l'attività indicata nell'intervista>

## I file che l'assistente legge a ogni avvio
| File | Cosa contiene | Quando aggiornarlo |
|---|---|---|
| context/ruolo.md | ... | quando cambia il tuo ruolo |
| context/me.md | ... | quando cambiano attività o strumenti |
| context/priorita.md | ... | ogni volta che cambiano le priorità |
| CLAUDE.local.md | ... | quando vuoi che scriva diversamente |

## Progetti aperti
Elenco con link, oppure "nessuno per ora".

## Skill installate
| Skill | A cosa ti serve | Come si usa |
|---|---|---|
Una riga per ogni cartella in .claude/skills/, con un esempio di frase che la attiva.

## Strumenti collegati (MCP) e chiavi
Stato reale: "nessuno" oppure l'elenco. Se esiste .env, scrivi solo che esiste, mai i nomi o i
valori delle chiavi.

## Permessi e protezioni
- Conferme prima di comandi e modifiche: sempre attive (comportamento base di Claude Code)
- Protezioni consigliate: <attive | non attive>. Una riga su cosa significa in pratica, e come
  cambiarle (toglierle: chiedere a Claude, che sposta .claude/settings.json in .claude/setup/;
  rimetterle: copiare references/protezioni-consigliate.json in .claude/settings.json). Il
  cambio vale dalla prossima apertura di VS Code
- Regole d'oro: references/regole-d-oro.md

## Prerequisiti
Node.js (serve la 22.20 o più recente per find-skills e per la maggior parte degli MCP), Python
(test di skill-creator), Git: presenti o mancanti, a cosa servono, da dove installarli, e che
dopo ogni installazione VS Code va chiuso e riaperto.

## I prossimi passi consigliati per il tuo ruolo
Dalla sezione "Skill e strumenti consigliati" di ruolo.md, ordinati per quello che la persona ha
detto di voler delegare per primo. Massimo 5 voci. Per ognuna: cosa è, perché serve a lei, cosa
serve per attivarla (una chiave? un account?), e la frase da dire a Claude per iniziare.
Chiudi con: "Nessuno di questi è obbligatorio: collega solo quello che userai."
Se la sezione di ruolo.md è vuota o dice "da definire", scrivi invece come trovarli: `find-skills`
per le skill, e la frase "quali strumenti mi conviene collegare per il mio lavoro?" per gli MCP.

## Come si lavora da qui
Tre righe: VS Code aperto su questa cartella, un lavoro = un progetto, il VADEMECUM per la mappa.
```

Poi chiudi con due righe: dove sono i file scritti, e che da ora si lavora normalmente.
Suggerisci di aprire `configurazione.md` nell'anteprima di VS Code (tasto destro sul file →
"Apri anteprima").
