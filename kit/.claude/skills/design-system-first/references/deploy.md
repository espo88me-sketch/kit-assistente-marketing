# Da locale a URL pubblico

La pagina non è finita finché qualcun altro non può aprirla. `localhost:3000` non è un
indirizzo: aperto da un altro dispositivo non mostra niente, o mostra tutt'altro.

## Percorso standard: GitHub → Vercel

Statico, gratis, con deploy automatico a ogni commit.

### 1. Il repository

Repo **privato**, salvo esplicita richiesta contraria. Convenzione consigliata: un repo per
progetto.

```bash
git init && git add -A
git commit -m "Landing <nome>: prima versione"
gh repo create <nome> --private --source=. --push
```

### 2. Il file si chiama `index.html`

È l'inciampo numero uno. Vercel serve la root del repo e cerca `index.html`: un file
chiamato `landing.html` o `sito-nuovo.html` produce un 404 su un deploy perfettamente
riuscito.

```
repo/
  index.html          ← obbligatorio
  design/
    tokens.css  DESIGN.md  assets/
  media/
```

### 3. Import su Vercel

vercel.com → Add New → Project → import del repo → Deploy. Nessuna configurazione per un
sito statico: framework preset "Other", build command vuoto. URL live in circa un minuto.

Da lì il ciclo è: modifica in locale → verifica → `git push` → Vercel ridispiega da
solo in una trentina di secondi. Il push diventa la pubblicazione: da quel momento ogni
commit su `main` è pubblico. Se serve provare qualcosa senza pubblicarlo, si lavora su
un branch — Vercel gli dà un URL di preview separato.

### 4. Dominio custom

Vercel → Project → Settings → Domains → aggiungi il dominio → segui i record DNS che
propone (un `A` sulla root e un `CNAME` su `www`, o il nameserver delegato). La
propagazione va da pochi minuti a qualche ora. Il certificato HTTPS è automatico.

## Prima di pubblicare, sempre

- [ ] **Mobile.** DevTools (F12) → vista mobile a 390px. Il default del design generato
      è desktop: la versione mobile si progetta, non si spera.
- [ ] **Il pannello tweak non è in pagina** — o almeno esce senza `?tweak=1`.
- [ ] **I link vanno dove devono.** Nessun `href="#"` rimasto sulle CTA.
- [ ] **Le immagini non pesano quanto un video.** Un hero da 4 MB si vede: la pagina
      arriva a pezzi sul 4G di uno stabilimento balneare.
- [ ] **`<title>`, meta description, og:image.** Una landing senza open graph condivisa
      su WhatsApp è un rettangolo bianco.
- [ ] **Niente chiavi, token o email private nel sorgente.** Il repo è privato, il sito
      no: tutto ciò che sta nell'HTML è pubblico.
- [ ] **Analytics**, se serve misurare. Deciso prima, non dopo il lancio.

## Alternative

| Dove | Quando |
|---|---|
| Vercel | Default. Statico o Next, deploy automatico, dominio custom gratis |
| GitHub Pages | Solo statico, già dentro il repo, nessun account in più |
| Netlify | Equivalente a Vercel; utile se ci sono già progetti lì |
| Hosting tradizionale | Sensato se hai già un hosting e il sito deve stare accanto ad altri |

## Quando invece non si deploya

Un mockup per far vedere una direzione, un prototipo per una riunione, un template da
riusare: restano file locali. Il deploy è per le cose che qualcuno deve aprire da fuori,
e ogni URL pubblico è una cosa in più da mantenere e da ricordarsi di spegnere.
