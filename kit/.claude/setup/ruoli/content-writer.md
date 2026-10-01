# Content writer

Scrive contenuti che informano, posizionano e convertono: articoli, pagine, social, script.

## Attività tipiche
- Articoli per blog e magazine
- Testi di pagine e landing
- Post social e caption
- Script per video e podcast
- Revisione ed editing di testi di altri
- Rispetto del tone of voice e delle linee guida SEO

## Cosa delegare a Claude
- Scalette e prime bozze da un brief
- Varianti di titoli, attacchi e call to action
- Revisione: tagli, chiarezza, coerenza con il tone of voice
- Riadattamento di un contenuto per canali diversi
- Ricerca delle fonti, da verificare sempre

## Dati e attenzioni
- Metti il tuo tone of voice e le linee guida del brand in `references/`: è la differenza tra un testo generico e uno tuo
- Ogni dato e ogni citazione di un testo generato vanno verificati sulla fonte
- Un testo per il pubblico lo rilegge sempre una persona prima di uscire

## Skill e strumenti consigliati

| Voce | A cosa serve | Cosa serve per attivarla |
|---|---|---|
| skill `copywriting` (`coreyhaines31/marketingskills`, MIT) | Testi di pagine, annunci e call to action | Si installa con `find-skills` |
| skill `copy-editing` (`coreyhaines31/marketingskills`, MIT) | Revisione: tagli, chiarezza, tono | Si installa con `find-skills` |
| skill `content-strategy` (`coreyhaines31/marketingskills`, MIT) | Piano editoriale, temi e cluster | Si installa con `find-skills` |
| skill `humanizer` (`blader/humanizer`, MIT) | Toglie i segni tipici della scrittura AI da un testo | Si installa con `find-skills` |
| Nessun MCP | Per questo ruolo non serve collegare niente | — |

**Per tutti i ruoli:** le skill per documenti di Anthropic (docx, xlsx, pptx, pdf: `/plugin marketplace add anthropics/skills`, poi `document-skills`). Per le ricerche approfondite con fonti, Perplexity MCP (`@perplexity-ai/mcp-server`, ufficiale, chiave API a consumo); la ricerca web normale è già inclusa in Claude Code.

_Verificato il 01/10/2026. Prima di collegare un MCP chiedi a Claude di ricontrollarlo: nomi, piani e permessi cambiano in fretta._
