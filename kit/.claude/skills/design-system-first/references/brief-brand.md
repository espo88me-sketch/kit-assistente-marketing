# Il brief — chiudere le decisioni prima di aprire il cantiere

Un build lanciato su un brief vago costa più di quanto risparmi il non aver pensato.
Questa fase serve a produrre un file, `brand-concept.md`, che verrà riletto in ogni
fase e riusato per ogni artefatto futuro dello stesso brand.

## Le domande

Una alla volta, aspettando la risposta. Se la risposta è "decidi tu", proponi
un'opzione motivata e vai avanti — non bloccare il lavoro su una preferenza estetica.

**Sostanza**
1. Cosa vende o comunica questa pagina, in una riga?
2. Chi la apre? Da dove arriva (organico, ads, newsletter, LinkedIn)?
3. Qual è l'**unica** azione che deve fare? Se ce ne sono tre, quale conta davvero?
4. Cosa deve credere prima di farla? (È l'obiezione da smontare in pagina.)

**Estetica**
5. Un sito reale che ti piace per questo progetto — URL, non aggettivi.
6. Cosa **non** deve essere: font, colori, pattern, "non voglio che sembri X".
7. Chiaro o scuro? Se non è deciso, decidilo ora: cambia tutto il resto.

**Vincoli**
8. Asset esistenti: logo (in che formato?), foto, video, font con licenza.
9. Dove vive: dominio, hosting, CMS, o statico.
10. Deve reggere più pagine in futuro o è un pezzo unico?

## Il riferimento reale batte l'aggettivo

Il punto 5 è il più importante di tutti. "Pulito e moderno" descrive metà del web.
Un URL, uno screenshot o un nome preciso ("Stripe 2024", "Linear ma più denso",
"editoriale tipo Monocle") trasporta in un colpo palette, densità, tipografia e ritmo.

Se non ha riferimenti, vai su `ispirazione.md` e fagliene vedere tre.

## Se il brand esiste già

Non intervistare: guarda. Leggi il sito esistente (scraper o codice della pagina), poi estrai:

- i colori realmente usati (non quelli che dicono di usare)
- i font caricati e le dimensioni ricorrenti
- i componenti che si ripetono (bottoni, card, badge, form)
- il tono del copy

Da lì si scrive il `DESIGN.md` come **descrizione di ciò che c'è**, e solo dopo si
decide cosa cambiare. Questo evita il rifacimento involontario.

## Template di output — `brand-concept.md`

```markdown
# <Nome> — brand concept

## Cos'è
Una riga. Cosa vende, a chi.

## Il visitatore
Chi è, da dove arriva, cosa sa già, cosa teme.

## L'azione
L'unica cosa che deve fare. E la seconda, se esiste, dichiarata come secondaria.

## Obiezione da smontare
Cosa lo ferma. Quale sezione della pagina se ne occupa.

## Voce
Tre aggettivi + un esempio di frase scritta bene per questo brand
+ un esempio di frase che questo brand non direbbe mai.

## Direzione visiva
- Riferimento: <URL o nome>
- Chiaro / scuro:
- Da evitare esplicitamente:

## Asset
- Logo: <percorso file, formato>
- Immagini / video:
- Font: <nome, licenza, da dove si carica>

## Vincoli
Dominio, hosting, stack, scadenze.
```

## Nota economica

Questa fase si chiude **prima** di iniziare a scrivere codice, e i suoi output vivono
su file. Il motivo: un cantiere aperto con il brief in testa e non su disco va rifatto
la prossima volta. Un `brand-concept.md` versionato serve per anni.
