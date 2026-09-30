---
name: design-system-first
description: Costruisce landing page, siti, prototipi e modelli di design con Claude Code partendo sempre da un design system scritto su file (DESIGN.md + tokens.css), non da un prompt a vuoto. Copre l'intera pipeline - brief del brand, design system, sketch di layout, build, pannello tweak in pagina per esplorare varianti senza ri-promptare, verifica visiva su desktop e mobile, deploy su GitHub/Vercel. Usa questa skill ogni volta che l'utente vuole "fare una landing page", "costruire un sito", "rifare l'homepage", "creare il design system di X", "un template riutilizzabile", "una pagina di lancio/promo", "un prototipo di app", oppure porta un'idea di brand da mettere a terra visivamente. Attiva anche per "rendi questa pagina piu' professionale", "voglio che tutte le pagine sembrino la stessa cosa", "come faccio a non ripetere lo stile ogni volta". NON usare per un audit di conversione di una pagina gia' online, ne' per il solo collaudo di una UI gia' pronta.
---

# design-system-first — costruire cose belle senza ricominciare da zero ogni volta

## Perché esiste

Il modo più costoso di lavorare col design generato dall'AI è chiedere ogni volta
"fammi una landing page". Ogni richiesta riparte da zero, ogni pagina esce con font,
colori e spaziature diverse, e il risultato è uno stile che non appartiene a nessuno —
la cosiddetta AI slop.

Il rimedio è uno solo e viene prima di tutto il resto: **il design system esiste come
file, non come intenzione**. Un `DESIGN.md` e un `tokens.css` per brand, versionati in
git, letti all'inizio di ogni build. Da quel momento ogni pagina, promo, prototipo e
template nasce già coerente, e l'iterazione riguarda il contenuto, non lo stile.

Il secondo principio è economico: **si pianifica dove il contesto costa poco e si
costruisce dove costa molto**. Brief, ricerca e struttura si chiudono prima di aprire
il cantiere; nel cantiere si scrive codice. Un build lanciato su un brief vago brucia
molto più tempo di quanto ne risparmi il non aver pensato.

Il terzo: **referenzia, non descrivere**. Uno screenshot, uno sketch, un URL reale, un
esempio con nome valgono più di dieci aggettivi. "Clean", "moderno", "minimale" non
sono istruzioni: sono rumore.

Fonte del metodo: Claude Design Masterclass (Nate Herk, aprile 2026), tradotta da
Claude Design a Claude Code.

## Quando si attiva

Nuova landing o sito, rifacimento di una pagina esistente, prototipo di app, template
riutilizzabile, pagina promo, o "voglio che tutto sembri la stessa cosa".

**Quando NON usarla** — non tutto merita un cantiere:

| Situazione | Cosa fare invece |
|---|---|
| Modifica di una riga di copy o un colore | Farla e basta |
| Audit di conversione di una pagina viva | Una skill di CRO, se l'hai installata |
| Collaudare una UI già costruita | Una skill di collaudo UI, se l'hai installata |
| Sistemare un logo o un'immagine | Canva: 30 secondi, zero token |

## Le sei fasi

Ogni fase ha una verifica. Non si passa alla successiva senza.

### Fase 0 — Brief (fuori dal cantiere)

Prima di scrivere una riga di HTML, chiudi il brief. Se il brand esiste già e ha un
`DESIGN.md`, salta alla Fase 2.

Domande obbligatorie, una alla volta (vedi `references/brief-brand.md` per il set
completo e il template di output):

1. Cosa vende, a chi, e qual è l'unica azione che il visitatore deve fare
2. Tono e direzione estetica — con un riferimento reale, non un aggettivo
3. Cosa **non** deve essere: font, colori, pattern da evitare
4. Vincoli: dominio, hosting, stack, asset già esistenti (logo, foto, video)

Output: `brand-concept.md`. È il documento che verrà riletto in ogni fase successiva e
riusato per ogni artefatto futuro dello stesso brand.

→ **Verifica:** il brief risponde a "chi è il visitatore e cosa deve fare" in una riga.

### Fase 1 — Il design system

Uno per brand. **Uno.** Cinque design system mediocri valgono meno di uno buono.

Si materializza in due file dentro il progetto:

```
design/
  DESIGN.md      # le regole in prosa: perché quel font, quando l'accento, cosa non fare
  tokens.css     # le regole eseguibili: :root { --color-*, --font-*, --space-*, --radius-* }
```

Template completo in `references/design-system.md`. Regole:

- **Ogni decisione visiva è una CSS custom property.** Nessun colore, font-size o
  spaziatura scritto a mano nel corpo del CSS. Questo è ciò che rende possibile la
  Fase 4 — e rende un cambio di palette una modifica a una riga.
- **Il logo è un asset, non un disegno.** Si referenzia il file (`<img src>` o l'SVG
  originale incollato intatto). Non ridisegnarlo mai: è l'errore più frequente e più
  visibile del design generato.
- Se il brand esiste già online, parti dal reale: leggi il sito (con uno
  scraper come Firecrawl, se l'hai collegato, o dal codice della pagina) ed estrai palette, font e componenti da lì invece di inventarli.

→ **Verifica:** apri `tokens.css`, cambia `--color-accent`, ricarica: cambia tutto il
sito. Se qualcosa resta del vecchio colore, c'è un valore hard-coded da estrarre.

### Fase 2 — Lo sketch

Prima di costruire, mettetevi d'accordo sul layout. Uno sketch è più veloce di due
build sbagliati.

Formati accettati, in ordine di preferenza: uno screenshot di un sito di riferimento,
un disegno anche brutto fotografato col telefono, oppure una lista di blocchi con
label — nav / hero (testo a sinistra, video a destra) / social proof / come funziona /
prezzi / FAQ / CTA finale.

→ **Verifica:** l'ordine delle sezioni e cosa sta a sinistra e a destra nell'hero sono
scritti da qualche parte, non solo intuiti.

### Fase 3 — Build

Un unico HTML statico autonomo salvo diversa richiesta: è la cosa più veloce da
costruire, vedere e deployare, e si porta ovunque.

- Leggi `DESIGN.md` + `tokens.css` + `brand-concept.md` + lo sketch **prima** di
  scrivere.
- Per la qualità estetica del singolo componente usa una skill di frontend design
  se l'hai installata: questa skill governa il processo, quella governa il gusto.
- Copy vero, mai lorem ipsum: il testo finto nasconde i problemi di layout. Se il copy
  è AI-generato, fallo rileggere a una persona
  o a una skill di revisione del copy.
- Mobile non è automatico. Si progetta, non si spera.
- Costruisci in blocchi verificabili: hero → sezioni → footer. Se stai andando nella
  direzione sbagliata, fermati al primo blocco, non al quinto.

→ **Verifica:** la pagina apre in locale e l'hero è quello dello sketch.

### Fase 4 — Il pannello tweak

Questa è la traduzione della funzione più utile di Claude Design, ed è la cosa che
rende questa skill diversa da "fammi una landing page".

Invece di chiedere "e se il fondo fosse più scuro?" e attendere una rigenerazione,
**il pannello si costruisce dentro la pagina**: un pannello di controllo che compare
solo con `?tweak=1`, scrive sulle CSS custom properties in tempo reale e permette di
provare palette, font, dimensione dei titoli, texture, raggio degli angoli e layout
dell'hero muovendo degli slider.

Codice pronto e istruzioni in `references/tweak-panel.md`.

Il ciclo diventa: **tu esplori da solo finché non ti piace, poi mi consegni i valori
scelti** (il pannello ha un bottone che li copia come blocco CSS) e io li scrivo nei
token. Una richiesta al posto di venti, e le decisioni estetiche le prendi guardandole,
non immaginandole.

→ **Verifica:** `?tweak=1` mostra il pannello, `?tweak=1` rimosso non lascia traccia
nella pagina pubblica.

### Fase 5 — Verifica visiva

Il design generato va **guardato**, non dichiarato finito. Screenshot a 1440px e
390px, sezione per sezione, e ispezione vera: testo che esce dai contenitori, contrasti
illeggibili, immagini deformate, tap target minuscoli, hero che su mobile spinge la CTA
sotto la piega.

Se hai installato una skill di collaudo UI o un browser per agenti (per esempio Playwright), usala per gli screenshot; altrimenti chiedi alla persona di aprire la pagina e guardarla alle due larghezze.

→ **Verifica:** esistono gli screenshot. "Dovrebbe funzionare" non è una verifica.

### Fase 6 — Deploy

`references/deploy.md` ha la procedura: repo privato su GitHub → import su Vercel →
URL live in un minuto. Include i due inciampi noti (il 404 di Vercel quando il file non
si chiama `index.html`, e il dominio custom).

→ **Verifica:** l'URL pubblico apre da un altro dispositivo, non solo da localhost.

## Regole di prompting che valgono in ogni fase

Sono le stesse che fanno la differenza tra un build e cinque.

- **Una dimensione visiva per giro.** Cinque richieste in un messaggio si traducono in
  due fatte bene e tre ignorate. Un aspetto alla volta: prima il colore, poi la
  tipografia, poi la spaziatura.
- **Di' cosa non vuoi.** I negativi prevengono le correzioni. "Niente gradienti viola,
  niente Inter, niente hero centrato" fa più lavoro di tre frasi di descrizione.
- **Riferimenti con un nome.** "Linear del 2023 ma più denso" è un'istruzione.
  "Professionale" non lo è.
- **Fermare presto.** Se dopo il primo blocco la direzione è sbagliata, si ferma lì. Un
  build sbagliato completato è tempo perso due volte: a farlo e a disfarlo.
- **Sessione lunga = contesto sporco.** Quando un cantiere si trascina, la cosa giusta
  è ripartire pulito con i file (che contengono già tutto) invece di continuare a
  parlare sopra a mille messaggi.

## Errori noti (visti nella masterclass, validi anche qui)

| Errore | Perché succede | Rimedio |
|---|---|---|
| Il logo viene ridisegnato | L'AI tende a "reinterpretare" gli asset | Referenzia il file, non generare mai il logo |
| Tutto uniforme e piatto | Nessun accento, un solo colore ovunque | Alternare sezioni chiare e scure, usare l'accento con parsimonia |
| Perfetto su desktop, rotto su mobile | Il default è desktop | Fase 5, sempre |
| Ogni pagina sembra un altro sito | Nessun design system | Fase 1, sempre |
| Font generici (Inter, Roboto, Arial) | Il default | Sceglierne uno con carattere e fissarlo nei token |

## Rapporto con le altre skill

Questa skill non ne richiede altre. Se nel tempo ne installi alcune (le trova `find-skills`),
lavorano bene insieme:

| Tipo di skill | Ruolo |
|---|---|
| Frontend design (per esempio `frontend-design` di Anthropic) | Il gusto: tipografia, composizione, motion del singolo pezzo |
| Collaudo UI / browser per agenti | La verifica della Fase 5 |
| Revisione del copy (per esempio `humanizer`) | Il copy, prima che entri in pagina |
| Audit di conversione | Dopo il lancio: la pagina converte? |
| Scraping (per esempio Firecrawl) | Estrarre lo stile da un sito esistente (Fase 1) o da un riferimento |

## Riferimenti

- `references/brief-brand.md` — le domande del brief e il template `brand-concept.md`
- `references/design-system.md` — template di `DESIGN.md` e `tokens.css`
- `references/tweak-panel.md` — il pannello di esplorazione, codice pronto
- `references/deploy.md` — da locale a URL pubblico
- `references/ispirazione.md` — dove guardare quando manca la direzione
