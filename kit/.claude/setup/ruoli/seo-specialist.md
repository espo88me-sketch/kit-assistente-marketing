# SEO specialist

Porta traffico organico qualificato da motori di ricerca e AI: tecnica, contenuti, autorevolezza.

## Attività tipiche
- Ricerca keyword, intento di ricerca e cluster di argomenti
- Audit tecnici: indicizzazione, velocità, dati strutturati, architettura, link interni
- Brief e ottimizzazione dei contenuti
- Monitoraggio di posizioni, clic e impression
- Analisi dei competitor e delle SERP
- Visibilità nelle risposte AI (GEO)

## Cosa delegare a Claude
- Clustering di keyword e mappatura keyword → pagina
- Brief SEO da keyword e intento
- Title, meta description e dati strutturati
- Analisi degli export di Search Console: pagine in calo, query da recuperare
- Checklist di audit tecnico su una pagina o un template

## Dati e attenzioni
- I dati di Search Console e dei tool SEO non sono personali, ma possono essere riservati: attenzione a cosa esce dal perimetro aziendale
- Claude non pubblica e non modifica il sito: prepara, e la pubblicazione la fai tu
- Volumi e difficoltà vanno presi da un tool, non stimati a memoria

## Skill e strumenti consigliati

| Voce | A cosa serve | Cosa serve per attivarla |
|---|---|---|
| **Search Console** | Clic, impression, query e pagine | **Non esiste un MCP ufficiale di Google.** Consigliato: l'export CSV dalla Search Console. In alternativa il server della community `mcp-gsc`: leggi il codice prima di installarlo (regola d'oro 4) |
| **MCP del tool SEO che paghi già**: Ahrefs, Semrush o DataForSEO (tutti ufficiali) | Volumi, difficoltà, backlink e SERP da dati veri, non stimati | Abbonamento al tool. Ahrefs dal piano Lite, DataForSEO a consumo |
| skill `seo-audit` (`coreyhaines31/marketingskills`, MIT) | Audit tecnico e on-page | Si installa con `find-skills` |
| skill `ai-seo` (`coreyhaines31/marketingskills`, MIT) | Visibilità nelle risposte dei motori AI (GEO) | Si installa con `find-skills` |
| skill `schema` (`coreyhaines31/marketingskills`, MIT) | Dati strutturati e markup schema.org | Si installa con `find-skills` |

**Per tutti i ruoli:** le skill per documenti di Anthropic (docx, xlsx, pptx, pdf: `/plugin marketplace add anthropics/skills`, poi `document-skills`). Per le ricerche approfondite con fonti, Perplexity MCP (`@perplexity-ai/mcp-server`, ufficiale, chiave API a consumo); la ricerca web normale è già inclusa in Claude Code.

_Verificato il 01/10/2026. Prima di collegare un MCP chiedi a Claude di ricontrollarlo: nomi, piani e permessi cambiano in fretta._
