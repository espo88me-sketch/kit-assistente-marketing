# Performance marketing specialist

Gestisce le campagne a pagamento (search, social, display, video) con l'obiettivo di conversioni e ritorno sulla spesa.

## Attività tipiche
- Impostazione e ottimizzazione delle campagne su Google Ads, Meta Ads, LinkedIn Ads, TikTok Ads
- Ricerca keyword e pubblici, struttura degli account, offerte e budget
- Copy degli annunci e varianti per i test creativi
- Analisi delle performance: CPA, ROAS, CTR, conversion rate, quote impression
- Report periodici per il cliente o per il management
- Controllo di tracciamenti e conversioni con l'analyst

## Cosa delegare a Claude
- Analisi degli export delle piattaforme: dove si spreca budget, cosa scalare
- Varianti di annunci (titoli, descrizioni, hook) nei limiti di caratteri di ogni piattaforma
- Liste di keyword negative dai report dei termini di ricerca
- Bozze dei report con i commenti ai numeri
- Simulazioni di budget e scenari di offerta

## Dati e attenzioni
- Si lavora sugli **export aggregati** (per campagna, gruppo, annuncio, giorno). Le liste di pubblico personalizzato con email o telefoni non passano mai da Claude
- Claude non modifica le campagne sulle piattaforme: propone, e le modifiche le fai tu
- I numeri di un report vanno sempre ricontrollati sulla piattaforma prima di mandarli

## Skill e strumenti consigliati

| Voce | A cosa serve | Cosa serve per attivarla |
|---|---|---|
| **Google Ads MCP** (Google, ufficiale) | Campagne e metriche lette con query GAQL. Solo lettura: non tocca offerte né campagne | Progetto Google Cloud con accesso alla Google Ads API, credenziali OAuth, Python e pipx |
| **Meta Ads MCP** (Meta, ufficiale, in beta) | Report e diagnostica degli account Meta | Business Manager con accesso agli account pubblicitari. **Può anche creare e modificare campagne**: tieni la conferma a ogni azione, mai approvazioni automatiche |
| skill `ads` (`coreyhaines31/marketingskills`, MIT) | Struttura, ottimizzazione e analisi delle campagne a pagamento | Si installa con `find-skills` |
| skill `ad-creative` (`coreyhaines31/marketingskills`, MIT) | Varianti di annunci e piani di test creativi | Si installa con `find-skills` |

**Per tutti i ruoli:** le skill per documenti di Anthropic (docx, xlsx, pptx, pdf: `/plugin marketplace add anthropics/skills`, poi `document-skills`). Per le ricerche approfondite con fonti, Perplexity MCP (`@perplexity-ai/mcp-server`, ufficiale, chiave API a consumo); la ricerca web normale è già inclusa in Claude Code.

_Verificato il 01/10/2026. Prima di collegare un MCP chiedi a Claude di ricontrollarlo: nomi, piani e permessi cambiano in fretta._
