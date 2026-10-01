# Digital analyst

Misura cosa succede sui canali digitali e lo trasforma in decisioni: tracciamenti, dati, report.

## Attività tipiche
- Piano di tracciamento: eventi, conversioni, parametri
- Configurazione e controllo di GA4 e Google Tag Manager
- Estrazioni e query (BigQuery, SQL, fogli)
- Dashboard e report periodici
- Analisi ad hoc: cali, anomalie, attribuzione, coorti
- Qualità dei dati e coerenza tra fonti

## Cosa delegare a Claude
- Query SQL (per esempio sull'export GA4 in BigQuery) da lanciare tu in console
- Analisi di CSV: trend, confronti anno su anno, anomalie
- Piano di tracciamento e documentazione degli eventi
- Grafici e bozze di dashboard
- Spiegare un numero a chi non è analyst

## Dati e attenzioni
- Colonne esplicite, mai `SELECT *` su tabelle con dati di utenti
- Gli ID utente, i client ID e gli indirizzi IP sono dati personali
- Claude genera la query, tu la lanci e controlli la stima dei costi prima di eseguirla

## Skill e strumenti consigliati

| Voce | A cosa serve | Cosa serve per attivarla |
|---|---|---|
| **Google Analytics MCP** (Google, ufficiale, sperimentale) | Report e dati in tempo reale di GA4. Solo lettura | Progetto Google Cloud con Admin API e Data API attive, credenziali gcloud, Python e pipx |
| **Microsoft Clarity MCP** (Microsoft, ufficiale) | Metriche delle dashboard di Clarity ed elenco delle registrazioni. Solo lettura | Token API dal progetto Clarity (Impostazioni → Data Export) |
| skill `analytics` (`coreyhaines31/marketingskills`, MIT) | Piano di tracciamento, eventi, parametri UTM | Si installa con `find-skills` |
| skill `attribution` (`coreyhaines31/marketingskills`, MIT) | Modelli di attribuzione e lettura dei canali | Si installa con `find-skills` |
| **BigQuery**: nessun MCP, di proposito | Claude scrive la query, tu la lanci in console e controlli la stima dei costi | Niente da installare |

**Per tutti i ruoli:** le skill per documenti di Anthropic (docx, xlsx, pptx, pdf: `/plugin marketplace add anthropics/skills`, poi `document-skills`). Per le ricerche approfondite con fonti, Perplexity MCP (`@perplexity-ai/mcp-server`, ufficiale, chiave API a consumo); la ricerca web normale è già inclusa in Claude Code.

_Verificato il 01/10/2026. Prima di collegare un MCP chiedi a Claude di ricontrollarlo: nomi, piani e permessi cambiano in fretta._
