# Le chiavi API: dove vanno e come si caricano

Il kit non contiene chiavi. Te ne serve una quando colleghi uno strumento esterno (un MCP, una
skill che chiama un servizio). Il metodo è sempre lo stesso.

## Dove vanno

In un file chiamato `.env` (con il punto davanti), nella radice di questa cartella. Una riga per
chiave, nel formato `NOME=valore`, senza spazi né virgolette:

```
NOME_DELLO_STRUMENTO_API_KEY=il-valore-che-ti-ha-dato-il-servizio
```

Il nome giusto lo trovi nella documentazione dello strumento.

## Come si crea

1. Chiedi a Claude: *"crea il file .env vuoto e aprilo"*. Lo apre in TextEdit (Mac) o nel
   Blocco note (Windows) senza leggerlo.
2. Incolla la riga con la chiave, salva, chiudi.
3. Chiedi a Claude: *"carica le chiavi"*. Su Mac aggiunge una riga al file di avvio del
   Terminale, su Windows lancia `.claude/scripts/carica-chiavi.ps1`: in entrambi i casi ti
   mostra solo i nomi, mai i valori.
4. Chiudi VS Code del tutto e riaprilo.

## Tre regole

- **Mai** incollare una chiave nella chat con Claude. Se succede, cambiala dal sito del servizio:
  ormai è nella conversazione.
- Nella configurazione di un MCP la chiave si richiama come `${NOME_CHIAVE}`, mai scritta per
  intero.
- Il `.env` non va condiviso né caricato su GitHub: il `.gitignore` della cartella lo esclude già.
