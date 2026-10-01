# CRO specialist

Aumenta la percentuale di visitatori che compiono l'azione giusta, con analisi e test.

## Attività tipiche
- Analisi del funnel e dei punti di abbandono
- Heatmap, registrazioni di sessione, sondaggi
- Audit euristici di landing e checkout
- Ipotesi e test A/B
- Analisi dei risultati dei test
- Proposte di copy e layout

## Cosa delegare a Claude
- Audit di una pagina: gerarchia, chiarezza, frizioni, fiducia, CTA
- Ipotesi di test in forma "se… allora… perché…", con metrica e priorità
- Lettura statistica di un test: significatività, durata, campione
- Varianti di copy e wireframe di una variante
- Sintesi di sondaggi e feedback aperti

## Dati e attenzioni
- Registrazioni di sessione e risposte ai sondaggi possono contenere dati personali: si portano a Claude solo sintesi o testi ripuliti
- Un test fermato troppo presto dà risultati falsi: Claude deve dirlo
- Le modifiche al sito le fai tu, dopo il test

## Skill e strumenti consigliati

| Voce | A cosa serve | Cosa serve per attivarla |
|---|---|---|
| skill `cro` (`coreyhaines31/marketingskills`, MIT) | Audit di pagine e form, ipotesi di test | Si installa con `find-skills` |
| skill `ab-testing` (`coreyhaines31/marketingskills`, MIT) | Disegno e lettura statistica dei test | Si installa con `find-skills` |
| skill `customer-research` (`coreyhaines31/marketingskills`, MIT) | Sintesi di sondaggi, interviste e feedback aperti | Si installa con `find-skills` |
| **Microsoft Clarity MCP** (Microsoft, ufficiale) | Metriche delle dashboard di Clarity ed elenco delle registrazioni. Solo lettura | Token API dal progetto Clarity (Impostazioni → Data Export) |
| **Playwright MCP** (Microsoft, ufficiale) | Apre le pagine in un browser, le naviga e compila i form per verificare un flusso | Node.js |

**Per tutti i ruoli:** le skill per documenti di Anthropic (docx, xlsx, pptx, pdf: `/plugin marketplace add anthropics/skills`, poi `document-skills`). Per le ricerche approfondite con fonti, Perplexity MCP (`@perplexity-ai/mcp-server`, ufficiale, chiave API a consumo); la ricerca web normale è già inclusa in Claude Code.

_Verificato il 01/10/2026. Prima di collegare un MCP chiedi a Claude di ricontrollarlo: nomi, piani e permessi cambiano in fretta._
