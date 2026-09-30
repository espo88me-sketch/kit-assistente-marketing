# Il pannello tweak — esplorare senza ri-promptare

## Il problema che risolve

"E se il fondo fosse più caldo?" è una domanda a cui si risponde guardando, non
immaginando. Ma ogni domanda del genere fatta a un assistente costa un giro completo:
prompt, rigenerazione, ricarica, e se non piace un secondo giro per tornare indietro —
senza un pulsante di annulla.

La soluzione è spostare l'esplorazione dentro la pagina. Un pannello di controllo che
compare solo con `?tweak=1`, scrive sulle CSS custom properties in tempo reale, e
permette di provare venti combinazioni in due minuti senza scrivere un messaggio.

**Il ciclo:** io costruisco la pagina e il pannello → tu esplori da solo → il bottone
"Copia i token" ti dà i valori scelti come blocco CSS → me li passi → io li scrivo in
`tokens.css` e rimuovo il pannello dalla versione pubblica.

Una richiesta al posto di venti, e le decisioni estetiche le prendi guardandole.

## Prerequisito

Funziona solo se la Fase 1 è stata fatta bene: **ogni decisione visiva deve essere una
CSS custom property**. Un valore hard-coded è un valore che il pannello non può toccare.

## Cosa mettere nel pannello

Le leve che cambiano davvero la faccia della pagina, non tutte le variabili esistenti.
Un buon set per una landing:

| Leva | Tipo | Variabili toccate |
|---|---|---|
| Palette | preset | tutte le `--color-*` insieme |
| Accento | colore | `--color-accent` |
| Font display | preset | `--font-display` |
| Dimensione hero | slider | `--step-4` |
| Densità | slider | moltiplicatore su `--space-*` |
| Raggio angoli | slider | `--radius-m`, `--radius-l` |
| Texture di fondo | preset | `--texture-opacity`, classe sul body |
| Layout hero | preset | classe sul body (`split` / `stacked` / `centered`) |

Le prime tre spiegano l'80% della differenza percepita. Le altre servono a rifinire.

## Il codice

Due file. Nessuna dipendenza.

### `design/tweak.js`

```js
/* Pannello di esplorazione — attivo solo con ?tweak=1.
   Non caricare in produzione: lo script esce da solo se il flag manca. */
(() => {
  if (!new URLSearchParams(location.search).has('tweak')) return;

  // --- Le leve. Modificare qui per adattarle al progetto. ---------------
  const AXES = [
    { id: 'palette', label: 'Palette', type: 'preset', presets: {
        Default: {},
        Notte:  { '--color-bg':'#0e1318', '--color-surface':'#161d24',
                  '--color-ink':'#f2f0ec', '--color-ink-muted':'#9aa5af',
                  '--color-border':'#26313a' },
        Carta:  { '--color-bg':'#f7f4ed', '--color-surface':'#fffdf8',
                  '--color-ink':'#1b1a17', '--color-border':'#e6e0d4' },
        Freddo: { '--color-bg':'#f4f7fa', '--color-surface':'#ffffff',
                  '--color-ink':'#101a24', '--color-border':'#dbe4ec' },
      }},
    { id: 'accent', label: 'Accento', type: 'color', varName: '--color-accent' },
    { id: 'display', label: 'Font titoli', type: 'preset', presets: {
        Serif:    { '--font-display': 'Georgia, "Times New Roman", serif' },
        Grotesk:  { '--font-display': '"Space Grotesk", system-ui, sans-serif' },
        Condensed:{ '--font-display': '"Archivo Narrow", Haettenschweiler, sans-serif' },
        Mono:     { '--font-display': 'ui-monospace, SFMono-Regular, monospace' },
      }},
    { id: 'hero', label: 'Hero', type: 'range', varName: '--step-4',
      min: 2, max: 8, step: 0.1, unit: 'rem' },
    { id: 'radius', label: 'Angoli', type: 'range', varName: '--radius-m',
      min: 0, max: 28, step: 1, unit: 'px' },
    { id: 'density', label: 'Densità', type: 'range', varName: '--space-3xl',
      min: 2, max: 12, step: 0.25, unit: 'rem' },
    { id: 'texture', label: 'Texture', type: 'range', varName: '--texture-opacity',
      min: 0, max: 0.14, step: 0.005, unit: '' },
    { id: 'layout', label: 'Layout hero', type: 'body-class',
      options: ['hero-split', 'hero-stacked', 'hero-centered'] },
  ];

  const root = document.documentElement;
  const KEY = 'tweak:' + location.pathname;
  const state = JSON.parse(localStorage.getItem(KEY) || '{}');

  const apply = (vars) => Object.entries(vars)
    .forEach(([k, v]) => root.style.setProperty(k, v));

  const persist = () => localStorage.setItem(KEY, JSON.stringify(state));

  // riapplica quanto scelto nella sessione precedente
  Object.values(state).forEach(entry => {
    if (entry.vars) apply(entry.vars);
    if (entry.bodyClass) document.body.classList.add(entry.bodyClass);
  });

  // --- UI ---------------------------------------------------------------
  const panel = document.createElement('div');
  panel.id = 'tweak-panel';
  panel.innerHTML = '<header>Tweak <button id="tw-hide" title="nascondi">–</button></header>';
  const body = document.createElement('div');
  body.className = 'tw-body';
  panel.appendChild(body);

  const row = (label) => {
    const el = document.createElement('label');
    el.className = 'tw-row';
    el.innerHTML = `<span>${label}</span>`;
    body.appendChild(el);
    return el;
  };

  AXES.forEach(ax => {
    const r = row(ax.label);

    if (ax.type === 'preset') {
      const sel = document.createElement('select');
      Object.keys(ax.presets).forEach(name =>
        sel.add(new Option(name, name)));
      sel.value = state[ax.id]?.name || Object.keys(ax.presets)[0];
      sel.onchange = () => {
        const vars = ax.presets[sel.value];
        // ripulisce le variabili del preset precedente prima di applicare
        Object.values(ax.presets).forEach(p =>
          Object.keys(p).forEach(k => root.style.removeProperty(k)));
        apply(vars);
        state[ax.id] = { name: sel.value, vars };
        persist();
      };
      r.appendChild(sel);
    }

    if (ax.type === 'color') {
      const inp = document.createElement('input');
      inp.type = 'color';
      inp.value = state[ax.id]?.vars?.[ax.varName]
        || getComputedStyle(root).getPropertyValue(ax.varName).trim() || '#000000';
      inp.oninput = () => {
        const vars = { [ax.varName]: inp.value };
        apply(vars); state[ax.id] = { vars }; persist();
      };
      r.appendChild(inp);
    }

    if (ax.type === 'range') {
      const inp = document.createElement('input');
      Object.assign(inp, { type:'range', min:ax.min, max:ax.max, step:ax.step });
      const out = document.createElement('output');
      const current = state[ax.id]?.raw
        ?? (parseFloat(getComputedStyle(root).getPropertyValue(ax.varName)) || ax.min);
      inp.value = current; out.textContent = current + ax.unit;
      inp.oninput = () => {
        const v = inp.value + ax.unit;
        out.textContent = v;
        const vars = { [ax.varName]: v };
        apply(vars); state[ax.id] = { raw: inp.value, vars }; persist();
      };
      r.append(inp, out);
    }

    if (ax.type === 'body-class') {
      const sel = document.createElement('select');
      ax.options.forEach(o => sel.add(new Option(o.replace('hero-',''), o)));
      sel.value = state[ax.id]?.bodyClass || ax.options[0];
      sel.onchange = () => {
        ax.options.forEach(o => document.body.classList.remove(o));
        document.body.classList.add(sel.value);
        state[ax.id] = { bodyClass: sel.value }; persist();
      };
      r.appendChild(sel);
    }
  });

  // --- Azioni -----------------------------------------------------------
  const actions = document.createElement('div');
  actions.className = 'tw-actions';

  const copyBtn = document.createElement('button');
  copyBtn.textContent = 'Copia i token';
  copyBtn.onclick = async () => {
    const vars = Object.assign({}, ...Object.values(state).map(s => s.vars || {}));
    const classes = Object.values(state).filter(s => s.bodyClass).map(s => s.bodyClass);
    const css = ':root {\n' +
      Object.entries(vars).map(([k,v]) => `  ${k}: ${v};`).join('\n') +
      '\n}' + (classes.length ? `\n/* body class: ${classes.join(' ')} */` : '');
    await navigator.clipboard.writeText(css);
    copyBtn.textContent = 'Copiato ✓';
    setTimeout(() => copyBtn.textContent = 'Copia i token', 1600);
  };

  const resetBtn = document.createElement('button');
  resetBtn.textContent = 'Reset';
  resetBtn.onclick = () => { localStorage.removeItem(KEY); location.reload(); };

  actions.append(copyBtn, resetBtn);
  panel.appendChild(actions);
  document.body.appendChild(panel);

  panel.querySelector('#tw-hide').onclick =
    () => panel.classList.toggle('tw-collapsed');
})();
```

### `design/tweak.css`

```css
#tweak-panel {
  position: fixed; top: 16px; right: 16px; z-index: 99999;
  width: 260px; max-height: calc(100vh - 32px); overflow: auto;
  font: 12px/1.4 ui-monospace, SFMono-Regular, monospace;
  color: #eef2f6; background: #12181dee; backdrop-filter: blur(8px);
  border: 1px solid #ffffff22; border-radius: 12px;
  box-shadow: 0 12px 40px -12px #000a;
}
#tweak-panel header {
  display: flex; justify-content: space-between; align-items: center;
  padding: 10px 12px; border-bottom: 1px solid #ffffff1a;
  letter-spacing: .08em; text-transform: uppercase; font-size: 10px;
}
#tweak-panel button {
  font: inherit; color: inherit; background: #ffffff14;
  border: 1px solid #ffffff22; border-radius: 6px;
  padding: 5px 9px; cursor: pointer;
}
#tweak-panel button:hover { background: #ffffff24; }
#tweak-panel .tw-body { padding: 10px 12px; display: grid; gap: 9px; }
#tweak-panel.tw-collapsed .tw-body,
#tweak-panel.tw-collapsed .tw-actions { display: none; }
.tw-row { display: grid; grid-template-columns: 76px 1fr auto; gap: 8px;
          align-items: center; }
.tw-row select, .tw-row input[type=color] {
  width: 100%; font: inherit; color: inherit;
  background: #ffffff10; border: 1px solid #ffffff20;
  border-radius: 6px; padding: 3px; min-height: 24px;
}
.tw-row input[type=range] { width: 100%; accent-color: #7cc4a4; }
.tw-row output { font-size: 10px; opacity: .7; min-width: 44px; text-align: right; }
.tw-actions { display: flex; gap: 8px; padding: 0 12px 12px; }
.tw-actions button { flex: 1; }
```

### Aggancio nella pagina

```html
<link rel="stylesheet" href="design/tokens.css">
<link rel="stylesheet" href="design/tweak.css">
<!-- ...la pagina... -->
<script src="design/tweak.js" defer></script>
```

Lo script esce immediatamente senza `?tweak=1`, quindi il costo in produzione è un file
statico da 4 KB. Se anche quello dà fastidio, si rimuovono le due righe prima del
deploy — sono le stesse due righe da rimettere al giro dopo.

## Regole d'uso

- **Il pannello non è la sorgente di verità.** Le scelte vivono in `localStorage` finché
  non finiscono in `tokens.css`. Chiudere il browser senza copiare i token perde tutto.
- **Le leve si aggiungono su richiesta.** Un pannello con trenta slider è inutile quanto
  nessun pannello: si mettono le leve su cui c'è un dubbio vero.
- **Serve anche a me.** Quando chiedi "e se fosse più scuro", la risposta giusta spesso
  non è rigenerare la pagina ma aggiungere quella leva al pannello.
