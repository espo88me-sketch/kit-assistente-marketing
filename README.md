# Assistente di marketing per Claude Code

Un kit gratuito che trasforma Claude Code in un assistente di lavoro per chi fa marketing
digitale. Si installa da Visual Studio Code in 30-40 minuti, senza usare il Terminale: ti guida
Claude.

**[⬇ Scarica l'ultima versione](https://github.com/espo88me-sketch/kit-assistente-marketing/releases/latest/download/assistente-marketing.zip)**
· [tutte le versioni e i checksum](https://github.com/espo88me-sketch/kit-assistente-marketing/releases)

## Cosa fa

Alla fine del setup hai una cartella di lavoro in cui Claude sa:
- **che ruolo hai**: performance marketing, growth, SEO, digital analytics, content, CRO,
  marketing automation, newsletter e comunicazione, graphic design, oppure un ruolo tuo;
- **chi sei e cosa fai davvero**, dalle risposte a un'intervista di 10 minuti;
- **su cosa stai lavorando** e **come vuoi che scriva**.

E un documento, `configurazione.md`, che spiega cosa è stato configurato e cosa puoi aggiungere.

## Cosa non fa

- **Non collega niente.** Nessuna chiave API, nessun MCP preconfigurato. Per ogni ruolo trovi dei
  consigli, ma cosa collegare lo decidi tu.
- **Non installa programmi.** Controlla cosa c'è sul computer e ti dice cosa manca e a cosa serve.
- **Non ti blocca il lavoro.** Le protezioni consigliate (Claude non legge i file con chiavi e
  credenziali) sono attive all'inizio e puoi toglierle.

Dentro ci sono solo tre skill, per costruire il tuo ecosistema da solo: `find-skills` (cerca
skill pronte e controlla chi le pubblica), `skill-creator` (trasforma un lavoro ripetuto in una
skill), `design-system-first` (pagine e prototipi partendo da un design system su file).

## Cosa serve

| | |
|---|---|
| Account Claude | Pro o superiore (il piano gratuito non include Claude Code) |
| Visual Studio Code | con l'estensione Claude Code di Anthropic |
| Solo Windows | Git for Windows |
| Consigliato | Node.js 22.20 o più recente (per cercare skill e collegare strumenti) |

## Come si installa

1. Scarica lo zip e scompattalo sul Desktop o nella tua cartella utente
2. In VS Code: **File → Apri cartella** → `assistente-marketing` → rispondi **"Sì, mi fido"**
3. Apri Claude dall'icona in alto a destra e scrivi `iniziamo`

La guida completa è in [`kit/LEGGIMI.md`](kit/LEGGIMI.md).

## Verificare il download

Ogni release pubblica l'impronta SHA-256 dello zip.

```bash
# Mac / Linux
shasum -a 256 assistente-marketing.zip
# Windows (PowerShell)
Get-FileHash assistente-marketing.zip -Algorithm SHA256
```

Il risultato deve essere identico a quello scritto nella release.

## Leggi prima di installare

Il kit è fatto quasi solo di testo: istruzioni per Claude in Markdown. Gli unici script sono uno
script PowerShell di una trentina di righe per caricare le chiavi su Windows, e gli script Python
di `skill-creator`, così come li pubblica Anthropic. Tutto è in [`kit/`](kit/), leggibile riga per riga.
Il consiglio vale per questo kit e per qualsiasi altro: **non installare niente che non hai
letto.**

## Struttura

```
kit/                 il contenuto dello zip
costruisci-zip.sh    costruisce lo zip e il checksum dal contenuto di kit/
```

## Licenza

MIT. Le skill incluse hanno la propria licenza: vedi
[`kit/.claude/setup/LICENZE-TERZE-PARTI.md`](kit/.claude/setup/LICENZE-TERZE-PARTI.md).

---

Fatto da [Michele Esposto](https://sito-consulente-ai.vercel.app). Se vuoi portarlo in tutto il
tuo team, con ruoli, contesto aziendale condiviso e regole di sicurezza,
[scrivimi](https://sito-consulente-ai.vercel.app/#contatto).
