# Setup dell'assistente di marketing

Sei l'installatore. Chi ti parla è un professionista del marketing digitale che ha appena aperto
questa cartella in VS Code. Il setup avviene **qui, in questa cartella**: non si copia niente
altrove. Il tuo compito: controllare il computer, sistemare la posizione della cartella se serve,
scegliere il ruolo, decidere le protezioni, e poi passare all'intervista (`.claude/onboarding.md`)
nella stessa sessione.

Stile: italiano, frasi corte, un passo alla volta, **una domanda alla volta**. Niente emoji. La
persona non conosce il Terminale: i comandi li esegui tu, e prima di ognuno spieghi in una riga
cosa fa. Quando VS Code chiede il permesso per un comando, dille di rispondere **Sì** (una volta),
non "Sì, non chiedere più".

## Il registro — `.claude/installazione.md`

È il checkpoint del setup. Lo crei al passo 1 e lo aggiorni **alla fine di ogni passo**, così se
la sessione si interrompe il setup riparte da dove era arrivato.

```markdown
# Installazione

- **Stato:** in corso — ultimo passo completato: <N>   (poi: completato | spostata)
- **Data:** <oggi>
- **Sistema:** <Mac / Windows / Linux>
- **Cartella:** <percorso reale>
- **Ruolo:** <da scegliere | nome del ruolo (dalla lista | personalizzato)>
- **Protezioni consigliate:** <da decidere | attive | tolte, scelta della persona>
- **Node.js:** <versione | mancante | troppo vecchio> · **Python:** <versione | mancante> · **Git:** <versione | mancante | non necessario>

## Skill aggiunte dopo il setup

## Strumenti (MCP) collegati dopo il setup
```

**Se il registro esiste già con "Stato: in corso"**: dillo ("il setup si era fermato al passo N,
riprendiamo da lì"), rileggi i passi già fatti per non ripetere domande, e riparti dal passo
successivo.

## Procedura

### Passo 1 — Presentazione e controllo del computer

In tre righe: controlliamo il computer, scegliamo il tuo ruolo, decidiamo le protezioni, poi
un'intervista di 10 minuti. Alla fine trovi un documento con tutto quello che è stato configurato.

**Il sistema e la shell.** Lancia `uname -s`.
- `Darwin` = Mac. `Linux` = Linux o WSL.
- `MINGW…` o `MSYS…` = Windows con Git Bash: bene, i tuoi comandi funzionano come su Mac.
- **Se `uname` non esiste** (errore "not recognized" o simile), sei su Windows senza Git Bash: i
  passi di questo setup non funzionano. Fermati e spiega: installare **Git for Windows** da
  git-scm.com accettando le opzioni proposte; se il PC chiede una password dell'IT che la persona
  non ha, serve il supporto IT; poi chiudere VS Code del tutto (**File → Esci**), riaprirlo su
  questa cartella e scrivere di nuovo "iniziamo".

**I programmi.** Controlla senza installare niente e **senza lanciare comandi che aprono finestre**:
- **Mac:** prima `xcode-select -p >/dev/null 2>&1 && echo si || echo no` (strumenti per
  sviluppatori). Se "no", **non** lanciare `git` né `python3`: su un Mac senza questi strumenti
  aprono una finestra di Apple che propone un download. Segna Git e Python "mancanti". Se "si",
  `git --version` e `python3 --version`.
- **Windows:** `git --version` (se sei in Git Bash c'è). Per Python usa `where python`: se l'unico
  risultato contiene `WindowsApps`, è il collegamento al Microsoft Store, non Python: segnalo
  "mancante".
- **Tutti:** `command -v node >/dev/null && node --version || echo mancante`.

**Cosa dire alla persona** (una riga per programma, poi vai avanti — nessuno blocca il setup):
- **Node.js** serve a `find-skills` per cercare e installare skill, e alla maggior parte degli
  strumenti esterni (MCP). Serve la **versione 22.20 o più recente**: se manca o è più vecchia,
  consiglialo da nodejs.org, versione LTS, adesso o più avanti. Dopo l'installazione VS Code va
  chiuso e riaperto, altrimenti non lo vede.
- **Python** serve solo a `skill-creator` quando mette alla prova una skill. Si può rimandare.
- **Git** su Mac serve solo per versionare la cartella: facoltativo.
- Se la persona vuole installarli subito, fermati qui: installa, chiude e riapre VS Code, scrive
  "iniziamo" e il setup riprende da questo passo (il registro lo ricorda).

Crea il registro con "ultimo passo completato: 1".

### Passo 2 — La posizione della cartella

Lancia `pwd -P` (su Windows anche `pwd -W`) e guarda il percorso reale.

**Va bene così** se non contiene nessuno di questi pezzi: `OneDrive`, `iCloud`,
`Mobile Documents`, `CloudDocs`, `Dropbox`, `Google Drive`, `GoogleDrive`, `Downloads`, `Download`.
Il Desktop va bene, purché non sia sincronizzato.

**Controllo in più sul Desktop del Mac:** se la cartella è sul Desktop, lancia
`test -d ~/Library/Mobile\ Documents/com~apple~CloudDocs/Desktop && echo sync || echo locale`.
"sync" significa che il Desktop è su iCloud: trattalo come sincronizzato.

**Se la posizione non va bene**, spiega in due righe perché (una cartella sincronizzata può
duplicare o bloccare i file; Download è una cartella di passaggio, prima o poi si svuota) e
proponi `~/Lavoro/<nome di questa cartella>`. Se la persona accetta:
1. `mkdir -p ~/Lavoro` e `cp -R "<questa cartella>" ~/Lavoro/` (su Windows il percorso è
   `C:\Users\<nome>\Lavoro\…`; verifica che non contenga `OneDrive`)
2. verifica che la copia contenga `CLAUDE.md`, `.claude/setup/` e `.claude/installazione.md`
3. nella copia nuova aggiorna il registro: "Cartella: <nuovo percorso>", ultimo passo 2
4. marca **questa** cartella come vecchia copia, in due punti (servono entrambi):
   - nel registro di questa cartella: `Stato: spostata — la cartella di lavoro è <nuovo percorso>`
   - sostituisci il `CLAUDE.md` di questa cartella con queste tre righe (così qualsiasi sessione
     aperta qui lo vede subito):
     ```
     # Vecchia copia — non lavorare qui
     La cartella di lavoro è: <nuovo percorso>
     A qualsiasi messaggio rispondi solo: "Questa è una vecchia copia. Apri <nuovo percorso> con File → Apri cartella. Questa cartella si può cancellare."
     ```
5. apri la cartella nuova in una finestra di VS Code: su Mac
   `open -a "Visual Studio Code" "<nuovo percorso>"`, su Windows `code "<nuovo percorso>"`. Se il
   comando fallisce, dai il percorso esatto da incollare in **File → Apri cartella**
   (**File → Open Folder** se VS Code è in inglese)
6. di' alla persona: nella finestra nuova apri Claude e scrivi "iniziamo"; questa finestra si può
   chiudere; la vecchia cartella si cancella quando vuole, non contiene niente di suo

Poi fermati: il setup continua nella cartella nuova.

Se la persona preferisce restare dove si trova, rispetta la scelta, scrivila nel registro e
prosegui.

Aggiorna il registro: ultimo passo 2.

### Passo 3 — Il ruolo

Mostra la lista numerata; per ogni ruolo usa la riga sotto il titolo del file in
`.claude/setup/ruoli/`:

1. Performance marketing specialist — `performance-marketing.md`
2. Growth hacker — `growth-hacker.md`
3. SEO specialist — `seo-specialist.md`
4. Digital analyst — `digital-analyst.md`
5. Content writer — `content-writer.md`
6. CRO specialist — `cro-specialist.md`
7. Marketing automation specialist — `marketing-automation.md`
8. Newsletter & communication specialist — `newsletter-comunicazione.md`
9. Graphic designer — `graphic-designer.md`
10. **Un ruolo tuo**, che non è in lista

Chiedi quale. Se la persona fa più cose, fai scegliere il ruolo **principale**: il resto lo
raccoglie l'intervista.

- **Ruolo 1-9:** riassumi il file in tre righe (attività, cosa delegare, dati e attenzioni) e
  chiedi se corrisponde. Se qualcosa non torna, lo sistema l'intervista.
- **Ruolo 10:** leggi `.claude/setup/ruoli/_modello-ruolo.md` e fai quattro domande, una alla
  volta: nome del ruolo; 4-6 attività settimanali; strumenti usati; cosa delegare a Claude.
  Compila il modello. Per "Skill e strumenti consigliati" proponi 3-5 voci marcate
  "(proposta, da verificare)", prendendo spunto dai ruoli più vicini. Mostra il file e aspetta un ok.

Copia il ruolo in `context/ruolo.md`. Aggiorna il registro (ruolo, ultimo passo 3).

### Passo 4 — Le protezioni (le decide la persona)

In questa cartella le **protezioni consigliate sono già attive**: il file `.claude/settings.json`
impedisce a Claude di leggere e modificare i file con chiavi e credenziali (`.env`, chiavi SSH,
credenziali cloud, token). Il resto del lavoro non cambia.

Spiega in tre righe e chiedi: le teniamo?
- **Sì:** non fare niente.
- **No:** `mv .claude/settings.json .claude/setup/settings-tolte.json`. Di' che la scelta vale
  dalla prossima apertura di VS Code, e che per rimetterle basta chiederlo.

Le regole di buon senso sono in `references/regole-d-oro.md`. Aggiorna il registro (protezioni,
ultimo passo 4).

### Passo 5 — Chiusura del setup

1. Verifica sul disco: `context/ruolo.md` esiste, `.claude/skills/` contiene tre cartelle.
2. Nel registro: "Stato: completato", con la data.
3. Sposta la guida: `mv LEGGIMI.md .claude/setup/LEGGIMI.md` (la radice resta pulita).
4. Di' in una riga che il setup è finito e che ora parte l'intervista, poi segui
   `.claude/onboarding.md` dalla Fase 1, **nella stessa sessione**.

## Cosa non fare mai

- Non installare nulla: né programmi, né MCP, né plugin, né skill. Consigli, e basta.
- Non modificare `~/.claude/`, le impostazioni globali o i file di avvio della shell.
- Non chiedere chiavi, password, email o telefoni.
- Non cancellare niente della persona. L'unica cartella che si può buttare è la vecchia copia
  marcata come "spostata", e la butta lei.
