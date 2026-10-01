# Growth hacker

Cerca e testa in fretta leve di crescita lungo tutto il funnel, dall'acquisizione alla retention.

## Attività tipiche
- Ideazione e priorità degli esperimenti (ICE, RICE)
- Analisi del funnel: dove si perdono gli utenti
- Test su acquisizione, attivazione, referral, retention
- Automazioni leggere e integrazioni tra strumenti
- Analisi di competitor e mercato per trovare canali nuovi
- Documentazione dei risultati e degli apprendimenti

## Cosa delegare a Claude
- Backlog di esperimenti con ipotesi, metrica e criterio di successo
- Lettura dei risultati di un test: è significativo? cosa dice davvero?
- Ricerca su competitor, canali e casi simili
- Prototipi di landing, script e automazioni
- Il diario degli esperimenti, sempre aggiornato

## Dati e attenzioni
- Gli esperimenti toccano spesso dati di utenti: si lavora su dati aggregati o anonimi
- Uno scraping o un'automazione su piattaforme terze va controllato con i termini d'uso del servizio
- Un test piccolo non è una prova: Claude deve dire quando il campione è troppo piccolo

## Skill e strumenti consigliati

| Voce | A cosa serve | Cosa serve per attivarla |
|---|---|---|
| **Google Analytics MCP** (Google, ufficiale, sperimentale) | Report e dati in tempo reale di GA4. Solo lettura | Progetto Google Cloud con Admin API e Data API attive, credenziali gcloud, Python e pipx |
| skill `ab-testing` (`coreyhaines31/marketingskills`, MIT) | Ipotesi, dimensione del campione, lettura dei risultati | Si installa con `find-skills` |
| skill `marketing-ideas` (`coreyhaines31/marketingskills`, MIT) | Idee di crescita per canale e fase del funnel | Si installa con `find-skills` |
| skill `launch` (`coreyhaines31/marketingskills`, MIT) | Piano di lancio di un prodotto o di una funzione | Si installa con `find-skills` |
| **Firecrawl MCP** (Firecrawl, ufficiale) — facoltativo | Legge siti e pagine dei competitor in formato pulito | Account Firecrawl e chiave API; il piano gratuito ha crediti limitati |

**Per tutti i ruoli:** le skill per documenti di Anthropic (docx, xlsx, pptx, pdf: `/plugin marketplace add anthropics/skills`, poi `document-skills`). Per le ricerche approfondite con fonti, Perplexity MCP (`@perplexity-ai/mcp-server`, ufficiale, chiave API a consumo); la ricerca web normale è già inclusa in Claude Code.

_Verificato il 01/10/2026. Prima di collegare un MCP chiedi a Claude di ricontrollarlo: nomi, piani e permessi cambiano in fretta._
