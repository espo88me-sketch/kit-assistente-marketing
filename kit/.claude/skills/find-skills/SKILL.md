---
name: find-skills
description: Cerca skill già pronte nell'ecosistema aperto delle agent skills (skills.sh) quando la persona chiede "come faccio X", "c'è una skill per X", "puoi fare X" su un compito specialistico, o vuole allargare quello che l'assistente sa fare. Presenta le opzioni con chi le pubblica e un controllo della fonte; installa solo dopo un sì esplicito della persona. Usala anche quando il file di ruolo consiglia skill da cercare.
---

# Find Skills

Aiuta la persona a trovare skill già pronte, invece di costruirle da zero. La decisione di
installare è sempre sua: tu cerchi, controlli la fonte, spieghi, e installi solo se te lo dice.

## Quando usarla

- "Come faccio a…", "c'è una skill per…", "puoi fare…" su un compito specialistico
- La persona vuole ampliare l'assistente su un'area (SEO, analytics, email, design…)
- Il file `context/ruolo.md` elenca skill consigliate e la persona vuole cercarle

## Lo strumento

La CLI `npx skills` (serve Node.js **22.20 o più recente**) è il gestore dell'ecosistema aperto delle skill.

- `npx skills find <parole>` — cerca
- `npx skills add <owner/repo@skill>` — installa (solo dopo il sì della persona)
- Catalogo sfogliabile: https://skills.sh/

Prima di usarla controlla `node --version`. Se Node manca o è più vecchio della 22.20, dillo e
suggerisci di installare la versione LTS da nodejs.org, poi di chiudere e riaprire VS Code. Nel
frattempo puoi cercare sul catalogo web.

## Procedura

### 1. Capire cosa serve
Il dominio (SEO, email, analytics…), il compito preciso, e se è abbastanza comune da avere
una skill pronta. Se non lo è, proponi di costruirla con `skill-creator`.

### 2. Cercare
`npx skills find <parole>` con parole specifiche: "seo audit" meglio di "seo". Se non trovi
nulla, prova sinonimi e l'inglese.

### 3. Presentare, con il controllo della fonte
Per ogni skill trovata (massimo tre):

```
<nome> — cosa fa, in una riga
Pubblicata da: <owner/repo>  ·  Scheda: https://skills.sh/<...>
Fonte: <affidabile / da guardare / sconosciuta> — perché
```

Come valuti la fonte:
- **Affidabile:** l'editore ufficiale dello strumento (Anthropic, Vercel, il produttore del
  servizio che la skill usa) o un repository molto usato e mantenuto
- **Da guardare:** autore singolo, pochi utenti, aggiornamenti vecchi
- **Sconosciuta:** nome simile a uno famoso ma non identico (possibile imitazione), nessun
  repository leggibile

### 4. Installare, solo con un sì
Chiedi: "La installo?". Se sì:
1. prima di installare, leggi il `SKILL.md` e gli script della skill e riassumi in tre righe
   cosa fa davvero: comandi che esegue, siti che contatta, file che scrive. Segnala subito
   `curl … | sh`, download di eseguibili, invio di dati a servizi esterni
2. se la persona conferma ancora, installa **nella cartella del progetto** (`.claude/skills/`),
   non a livello globale, salvo che lo chieda lei
3. annota l'installazione in `.claude/installazione.md`, sezione "Skill aggiunte dopo il
   setup": nome, fonte, data

Se la persona dice no, fermati: nessun comando di installazione.

## Se non trovi nulla

Dillo, offri di fare il lavoro direttamente, e se è un compito ricorrente proponi di
trasformarlo in una skill con `skill-creator`.

---

_Adattata da `find-skills` di vercel-labs/skills (MIT, Copyright (c) 2026 Vercel, Inc.). Modifiche: procedura in italiano,
controllo della fonte e installazione solo dopo conferma esplicita._
