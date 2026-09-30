# Le regole d'oro

**Claude vede tutto quello che gli dai. E quello che gli dai esce dal tuo computer.**

Nessuna di queste regole ti viene imposta: le decidi tu. Sono quelle che consigliamo a chiunque
lavori con un assistente AI su dati veri di clienti e aziende.

---

## Sei cose da non fare

**1. Niente dati di persone nei prompt.**
Nomi, email, telefoni, indirizzi di clienti o contatti. Se un export li contiene, togli quelle
colonne prima di darlo a Claude. Per quasi tutte le analisi di marketing bastano i dati aggregati.

> Sì: "le conversioni di settembre per campagna". No: "la lista degli iscritti con l'email".

**2. Niente chiavi o password in chat.**
Le chiavi stanno solo nel file `.env` (vedi `chiavi-api.md`).

**3. "Consenti sempre" solo se hai capito cosa chiede.**
Un "no" costa dieci secondi, un "sì, non chiedere più" resta per sempre. E non usare la modalità
che salta tutte le conferme.

**4. Niente installazioni che non hai verificato.**
Prima di aggiungere un MCP, un plugin o una skill: chi lo pubblica? Il nome è esattamente quello
ufficiale, senza lettere cambiate? Cosa può fare sul tuo computer? `find-skills` fa questo
controllo per te; per gli MCP chiedi a Claude di verificarlo prima.

**5. I file arrivati da fuori li apri tu prima.**
PDF, email e pagine web possono contenere istruzioni nascoste scritte per Claude. Se un documento
ti sembra strano, non darlo in pasto all'assistente.

**6. Lavora sempre da questa cartella.**
Le protezioni e il contesto valgono qui. Aperto dalla home, Claude non sa chi sei e vede tutto il
computer.

---

## Nel dubbio

Se non sai se un dato è personale, **lo è**.

## Se lavori per un'azienda

Prima di usare Claude su dati aziendali, verifica cosa prevedono la policy interna e il GDPR per
il tuo caso: chi è il titolare dei dati, se serve un accordo con il fornitore, cosa si può
condividere. Questo kit non sostituisce quella verifica.

## Le protezioni automatiche

Le **protezioni consigliate** sono attive quando scarichi il kit: Claude non può leggere né
modificare i file con chiavi e credenziali. Le regole stanno in `.claude/settings.json`, che è
una copia di `references/protezioni-consigliate.json`.
- Per toglierle: chiedilo a Claude (sposta il file in `.claude/setup/`)
- Per rimetterle: chiedilo a Claude (ricopia il file)
- In entrambi i casi il cambio vale dalla prossima apertura di VS Code
