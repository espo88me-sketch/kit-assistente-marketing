# Il tuo assistente di marketing con Claude Code

_Versione 0.2 — bozza. Tempo: 30-40 minuti. Si installa da Visual Studio Code. Non devi copiare
nessun prompt: ti guida Claude._

Cosa ottieni: una cartella di lavoro in cui Claude sa chi sei, che ruolo hai, su cosa stai
lavorando e come vuoi che scriva. Parti da uno dei nove ruoli del marketing digitale già mappati,
o ti costruisci il tuo.

Cosa **non** trovi dentro: chiavi API, collegamenti a strumenti esterni (MCP) e skill già
installate, tranne tre. Per ogni ruolo c'è una lista di consigli, ma cosa collegare lo decidi tu.

## 0. Controlla prima di iniziare (5 minuti)

| Cosa | Serve? | Come controllare | Se manca |
|---|---|---|---|
| **Piano Claude Pro o superiore** | Indispensabile | claude.ai → Impostazioni → Piano | Il piano gratuito non include Claude Code: claude.ai/upgrade |
| **Solo Windows: Git for Windows** | Indispensabile | Menu Start, cerca "Git Bash" | git-scm.com, accetta le opzioni proposte |
| **Node.js 22.20 o più recente** | Consigliato | Lo controlla Claude al primo passo | nodejs.org, versione LTS. Serve per cercare skill nuove e per collegare quasi tutti gli strumenti esterni. Si può installare anche dopo |
| **Python** | Facoltativo | Lo controlla Claude | python.org (su Windows spunta **"Add python.exe to PATH"**). Serve solo per mettere alla prova le skill che costruisci |

- **Se l'installazione ti chiede una password dell'IT** che non hai, sei su un PC aziendale
  gestito: chiedi a loro Git (su Windows) e Node.js, oppure usa un computer personale.
- **Dopo aver installato qualunque programma, chiudi del tutto VS Code e riaprilo**: prima non
  lo vede.

## 1. Scompatta lo zip nel posto giusto

- Scompattalo **sul Desktop** o nella tua cartella utente. Non lasciarlo in Download: è una
  cartella di passaggio.
- Otterrai una cartella chiamata `assistente-marketing`. **Aprendola devi vedere subito questo
  file, `LEGGIMI.md`, e `CLAUDE.md`.** Se invece vedi un'altra cartella con lo stesso nome, entra
  lì: è quella giusta.
- Non preoccuparti di OneDrive o iCloud: se il tuo Desktop è sincronizzato, Claude se ne accorge
  e ti propone di spostare la cartella in un posto sicuro. Lo fa lui.

## 2. Visual Studio Code ed estensione Claude Code

1. Installa **Visual Studio Code** da code.visualstudio.com.
2. Nella barra a sinistra apri **Estensioni** (i quattro quadratini), cerca `Claude Code` e
   installa quella **di Anthropic**: controlla che l'editore sia verificato e non installare
   estensioni con nomi simili.
3. In alto a destra compare l'icona di Claude (una scintilla arancione). Cliccala e accedi.

## 3. Apri la cartella e parti

1. **File → Apri cartella...** (in inglese **File → Open Folder...**) e scegli
   `assistente-marketing`.
2. VS Code chiede se ti fidi degli autori dei file. **Rispondi "Sì, mi fido" ("Yes, I trust the
   authors").** Se rispondi no, l'estensione di Claude si spegne. Se è già successo: in basso a
   sinistra clicca "Modalità con restrizioni" ("Restricted Mode") e scegli di fidarti.
3. Apri Claude dall'icona e scrivi:

```
iniziamo
```

Claude, una cosa alla volta:
- controlla cosa c'è sul computer (Node.js, Git, Python) e ti dice cosa ti manca e a cosa serve;
- controlla che la cartella sia in un posto sicuro, e se serve la sposta lui;
- ti fa scegliere il ruolo, tra i nove della lista o uno tuo;
- ti chiede se tenere le protezioni sui file sensibili (sono già attive);
- ti fa un'intervista di 10 minuti: chi sei, cosa fai, priorità, come vuoi che scriva.

Quando chiede il permesso di eseguire un comando, ti spiega prima cosa fa: rispondi **Sì**, non
"Sì, non chiedere più".

Alla fine Claude scrive **`configurazione.md`**: il resoconto di cosa è stato configurato, con i
consigli per il tuo ruolo. Aprilo con tasto destro → "Apri anteprima" e leggilo con calma.

**Se ti fermi a metà**, riapri la cartella e scrivi di nuovo `iniziamo`: Claude riprende da dove
eri arrivato.

Da qui in poi lavori sempre così: VS Code aperto sulla cartella `assistente-marketing`, Claude
dall'icona. La mappa delle cartelle è in `VADEMECUM.md`.

## Le tre skill incluse

| Skill | A cosa serve |
|---|---|
| `find-skills` | Cerca skill già pronte per quello che ti serve, controlla chi le pubblica, le installa solo se dici sì (richiede Node.js) |
| `skill-creator` | Trasforma un lavoro che ripeti in una skill tua, e la mette alla prova |
| `design-system-first` | Landing, pagine e prototipi partendo da un design system su file, con il metodo di Claude Design portato in Claude Code |

## La sicurezza è una tua scelta

Il kit non ti blocca il lavoro. Le protezioni consigliate (Claude non legge i file con chiavi e
credenziali) sono attive all'inizio e puoi toglierle durante il setup o dopo. Le regole che
consigliamo sono in `references/regole-d-oro.md`.

---

Licenza MIT (file `LICENSE`). Le skill incluse hanno la propria licenza: vedi
`.claude/setup/LICENZE-TERZE-PARTI.md`.
