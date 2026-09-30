# Il design system come file

Un design system che vive solo nella conversazione muore con la conversazione. Qui vive
su disco, in git, e viene riletto all'inizio di ogni build.

```
design/
  DESIGN.md      # le regole in prosa e il perché
  tokens.css     # le regole eseguibili
  assets/        # logo originale, font, immagini di brand
```

**Uno per brand. Non cinque.** Se serve una variante (dark mode, sotto-brand, campagna),
è un blocco di override dentro lo stesso `tokens.css`, non un secondo sistema.

---

## `tokens.css` — le regole eseguibili

Regola non negoziabile: **nessun colore, font-size, spaziatura o raggio scritto a mano
nel corpo del CSS.** Tutto passa da qui. È ciò che rende possibile il pannello tweak e
che trasforma "cambiamo palette" in una modifica di tre righe.

```css
:root {
  /* --- Colore ------------------------------------------------------- */
  --color-bg:          #faf8f4;   /* fondo dominante */
  --color-surface:     #ffffff;   /* card, pannelli */
  --color-ink:         #14171a;   /* testo principale */
  --color-ink-muted:   #5c6670;   /* testo secondario */
  --color-accent:      #1f7a4d;   /* UN accento, usato poco e bene */
  --color-accent-ink:  #ffffff;   /* testo sopra l'accento */
  --color-border:      #e4e0d8;
  --color-inverse-bg:  #10161c;   /* sezioni scure, per dare ritmo */
  --color-inverse-ink: #f4f1ec;

  /* --- Tipografia --------------------------------------------------- */
  --font-display: "<display>", Georgia, serif;      /* titoli: con carattere */
  --font-body:    "<body>", system-ui, sans-serif;  /* testo: leggibile */
  --font-mono:    ui-monospace, SFMono-Regular, monospace;

  --step--1: clamp(0.83rem, 0.8rem + 0.15vw, 0.9rem);
  --step-0:  clamp(1rem, 0.95rem + 0.25vw, 1.12rem);
  --step-1:  clamp(1.25rem, 1.1rem + 0.7vw, 1.6rem);
  --step-2:  clamp(1.6rem, 1.3rem + 1.4vw, 2.4rem);
  --step-3:  clamp(2rem, 1.5rem + 2.6vw, 3.6rem);
  --step-4:  clamp(2.6rem, 1.7rem + 4.4vw, 5.4rem);   /* hero */

  --leading-tight: 1.08;
  --leading-body:  1.6;
  --tracking-display: -0.02em;

  /* --- Spazio, forma, profondità ------------------------------------ */
  --space-2xs: 0.25rem;  --space-xs: 0.5rem;   --space-s: 0.75rem;
  --space-m:   1rem;     --space-l:  1.5rem;   --space-xl: 2.5rem;
  --space-2xl: 4rem;     --space-3xl: 7rem;    /* respiro tra sezioni */

  --measure: 62ch;              /* larghezza massima di un paragrafo */
  --container: 1180px;

  --radius-s: 4px;  --radius-m: 10px;  --radius-l: 20px;  --radius-pill: 999px;
  --border-w: 1px;

  --shadow-s: 0 1px 2px rgb(20 23 26 / 0.06);
  --shadow-m: 0 8px 24px -8px rgb(20 23 26 / 0.14);
  --shadow-glow: 0 4px 20px -4px color-mix(in oklab, var(--color-accent) 45%, transparent);

  /* --- Movimento ---------------------------------------------------- */
  --ease: cubic-bezier(0.2, 0.7, 0.2, 1);
  --dur-fast: 140ms;  --dur: 260ms;  --dur-slow: 600ms;

  /* --- Texture (leve del pannello tweak) ---------------------------- */
  --texture-opacity: 0.035;
  --grain-size: 180px;
}

@media (prefers-reduced-motion: reduce) {
  :root { --dur-fast: 0ms; --dur: 0ms; --dur-slow: 0ms; }
}
```

### Perché la scala tipografica è in `clamp()`

Perché il responsive tipografico smette di essere un problema: il titolo si adatta da
solo tra mobile e desktop senza media query, e non esiste il caso "hero enorme che su
390px occupa tutto lo schermo".

### Perché un solo accento

Un accento usato al 5% della superficie si vede. Tre accenti distribuiti equamente non
si vedono affatto e sembrano un errore. Se serve un secondo colore, è per uno stato
(errore, successo), non per decorazione.

---

## `DESIGN.md` — le regole in prosa

I token dicono *cosa*. Questo dice *quando* e *perché*, ed è la parte che impedisce di
usare il sistema male.

```markdown
# <Brand> — design system

## Direzione
Una riga sull'estetica e da dove viene. Il riferimento reale.

## Colore
- Il fondo dominante è <x>. Le sezioni si alternano chiaro/scuro per dare ritmo:
  mai più di due sezioni chiare di fila.
- L'accento <y> si usa per: CTA primaria, link, un dettaglio grafico per sezione.
  Non si usa per: fondi ampi, testo lungo, bordi generici.
- Contrasto minimo AA (4.5:1) sul testo. Verificato, non presunto.

## Tipografia
- Display <font>: solo H1/H2, tracking negativo, mai sotto i 24px.
- Body <font>: tutto il resto. Riga max <var(--measure)>.
- Mai: Inter, Roboto, Arial, system-ui come font principale — sono il default che
  rende tutto uguale a tutto.

## Spazio
- Le sezioni respirano di --space-3xl sopra e sotto. Il vuoto è una scelta, non uno
  spreco.
- Il contenuto sta dentro --container e non tocca mai i bordi su mobile
  (padding minimo --space-m).

## Componenti
Bottone primario, secondario, card, badge, input, nav: come sono fatti, cosa fanno
in hover e focus. Il focus è sempre visibile: si naviga anche da tastiera.

## Il logo
Percorso: design/assets/logo.svg
**Non si ridisegna, non si ricolora, non si ruota, non si ricostruisce a mano.**
Si referenzia il file. Se serve una variante monocromatica, esiste già come file
oppure si crea una volta e si salva.

## Cosa questo brand non fa
La lista dei divieti. Vale più delle regole positive.
```

---

## Se il brand esiste già

Non inventare: estrai. leggi il sito (scraper o codice della pagina), poi raccogli colori realmente usati, font
caricati, componenti ricorrenti. Il `DESIGN.md` nasce come **fotografia dell'esistente**,
e le modifiche sono un secondo passo dichiarato. Così si evita il rifacimento
involontario del brand mentre si costruiva una pagina.

## Verifica del sistema

Cambia `--color-accent` in `tokens.css` e ricarica. Se resta anche un solo elemento del
colore vecchio, c'è un valore hard-coded: estrailo. Il sistema funziona quando una riga
cambia tutto il sito.
