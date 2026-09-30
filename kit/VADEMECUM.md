# Vademecum — come si vive nella cartella `assistente-marketing`

_Da leggere una volta dopo il setup, poi da tenere a portata di mano._

Questa cartella è il posto in cui lavori con Claude. Claude la conosce: sa cosa c'è in ogni
sottocartella e dove mettere le cose. Tu devi sapere le stesse cose, così non vi pestate i piedi.

Un'idea sola da tenere a mente: **Claude lavora bene quanto sono aggiornati i tuoi file.** Il
ruolo, chi sei e le priorità li legge a ogni avvio. Se sono vecchi, ti aiuta sulle cose sbagliate.

---

## La mappa

```
assistente-marketing/
├── CLAUDE.md              le istruzioni che Claude legge a ogni avvio
├── CLAUDE.local.md        le tue preferenze di scrittura e di lavoro
├── configurazione.md      il resoconto del setup: cosa c'è e cosa manca
├── VADEMECUM.md           questo file
├── context/
│   ├── ruolo.md           il tuo ruolo: attività, strumenti consigliati, attenzioni
│   ├── me.md              chi sei, cosa fai davvero, su cosa vuoi aiuto
│   └── priorita.md        le priorità e le scadenze di adesso
├── references/            regole d'oro, guida alle chiavi, e le tue guide (brand, stile, procedure)
├── projects/              un lavoro = una cartella
├── input/                 i file che scarichi per un lavoro
├── output/                quello che produci fuori dai progetti
├── .claude/
│   ├── skills/            le procedure che Claude sa eseguire
│   ├── rules/             le regole fisse (dati personali)
│   ├── setup/             installatore e catalogo dei ruoli (per cambiare ruolo o rifare il setup)
│   ├── installazione.md   il registro tecnico del setup
│   └── settings.json      le protezioni consigliate, se le hai tenute
└── .env                   le tue chiavi, se ne hai (vedi references/chiavi-api.md)
```

---

## Le cartelle, una per una

| Cartella | Cos'è | Come si usa |
|---|---|---|
| `context/ruolo.md` | Il ruolo che hai scelto al setup | Se il lavoro cambia, dillo a Claude: "aggiorna ruolo.md, ora mi occupo anche di…" |
| `context/me.md` | Chi sei per Claude | La compila l'intervista. Si aggiorna a voce, come sopra |
| `context/priorita.md` | Le tue 3 priorità, con la data in cima | Aggiornala **quando cambiano**, non a fine mese |
| `CLAUDE.local.md` | Bullet o paragrafi, cosa non sopporti | Se vuoi che scriva diversamente, diglielo: lo aggiorna lui |
| `references/` | Le guide che Claude deve seguire | Mettici il tuo tone of voice, le linee guida del brand, le procedure che usi. Più è preciso, meno correggi |
| `projects/` | **Un lavoro con un inizio e una fine = una cartella** | Vedi sotto |
| `input/` | Export, CSV, screenshot, PDF | Prima di darlo a Claude: ci sono email, telefoni o nomi? Se sì, togli quelle colonne |
| `output/` | Quello che Claude produce fuori dai progetti | Un'analisi al volo, un testo, una tabella |
| `.claude/skills/` | Le skill | Tre incluse. Le altre le aggiungi tu, con `find-skills` o `skill-creator` |

---

## Aprire un nuovo progetto

Un progetto è **un lavoro con un inizio e una fine**: la campagna di giugno, il refresh di una
landing, la newsletter di lancio, l'analisi di un calo. Non è un'attività ricorrente (quella sta
in `me.md`) e non è una domanda al volo (quella va in `output/`).

### Il test dei 15 minuti

Se il lavoro finisce in una conversazione e non ci tornerai, **non aprire un progetto**: il
risultato va in `output/`. Se ci tornerai domani, o ci lavorerà qualcun altro, o produce più di
un file, **è un progetto**.

### Come si apre

Basta dirlo a Claude: *"apri il progetto landing-black-friday"*. Claude crea la cartella con il
`README.md` e le sottocartelle:

```
projects/landing-black-friday/
├── README.md        cos'è, in che stato è, le scadenze — 10 righe, non di più
├── input/           i file di partenza di QUESTO progetto
├── output/          quello che produce QUESTO progetto
└── note.md          (facoltativo) decisioni prese, cose capite, da non riscoprire
```

**Il nome della cartella:** tutto minuscolo, parole separate da trattini, niente spazi, niente
accenti, niente date in testa. `landing-black-friday` sì; `Landing Black Friday (nov)` no.

**Il `README.md`** è la cosa che conta. Schema fisso:

```markdown
# Landing Black Friday

**Cos'è:** una riga.
**Stato:** in corso / in pausa / chiuso — aggiornato il GG/MM.
**Scadenza:** GG/MM/AAAA, oppure "nessuna".
**Chi:** io, più chi altro è coinvolto.

## Prossimo passo
La prossima cosa da fare, una sola.

## Dove sono le cose
- input/brief.pdf — il brief
- output/landing-v2.html — l'ultima versione
```

Se il README lo scrive Claude, controlla che lo "stato" e il "prossimo passo" siano veri: è
quello che leggerà la prossima volta che apri la cartella.

### Sottocartelle dentro un progetto

Regola: **si apre una sottocartella quando i file di un tipo sono più di cinque.** I nomi sono
questi:

| Sottocartella | Per cosa |
|---|---|
| `input/` | file di partenza |
| `output/` | risultati |
| `bozze/` | versioni intermedie |
| `assets/` | immagini, loghi, video |
| `dati/` | CSV ed export **senza dati personali** |
| `archivio/` | quello che è superato ma non si butta |

### Quando un progetto finisce

Non si cancella. Nel `README.md` lo stato diventa **chiuso** con la data, e la cartella si sposta
in `projects/archivio/`.

---

## Far crescere l'assistente

Il kit parte leggero di proposito: tre skill, nessuno strumento collegato. Si cresce così:

1. **Una skill pronta.** *"C'è una skill per fare l'audit SEO di una pagina?"* → `find-skills`
   cerca, ti dice chi la pubblica e se ti fidi la installa.
2. **Una skill tua.** Quando ti accorgi di chiedere la stessa cosa per la terza volta:
   *"trasformiamo questo lavoro in una skill"* → `skill-creator`.
3. **Uno strumento collegato (MCP).** I consigli per il tuo ruolo sono in `configurazione.md`.
   *"Voglio collegare Google Search Console"* → Claude verifica la fonte ufficiale e ti guida,
   con la chiave nel `.env`.

Regola: **una cosa alla volta, e solo quello che userai davvero.** Ogni aggiunta finisce in
`configurazione.md`.

---

## Cinque situazioni tipiche

**"Devo analizzare un export."** → File in `input/` (o nel progetto). Controlla le colonne.
Poi: *"analizza input/export-campagne-settembre.csv"*.

**"Devo scrivere un testo."** → Non serve un progetto: *"scrivi un post su X"*. Se in
`references/` c'è il tuo tone of voice, Claude lo segue. Il risultato va in `output/`.

**"Devo fare una landing."** → È un progetto. Claude usa `design-system-first`: prima il design
system, poi la pagina.

**"Claude mi chiede un permesso che non capisco."** → No. Poi chiedigli di spiegarti cosa voleva
fare.

**"Ho cambiato priorità."** → *"Aggiorna priorita.md"*. Trenta secondi, e da lì ti aiuta sulle
cose giuste.

---

## Cosa non fare

- Non lavorare da fuori questa cartella (mai dalla home del computer).
- Non mettere file sciolti nella radice: ogni file ha una cartella.
- Non cancellare: si sposta in `archivio/`.
- Non rinominare le cartelle di primo livello. Claude le cerca con quei nomi.
