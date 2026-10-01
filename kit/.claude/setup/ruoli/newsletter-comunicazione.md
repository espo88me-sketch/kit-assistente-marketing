# Newsletter & communication specialist

Cura la comunicazione diretta con clienti e pubblico: newsletter, comunicati, messaggi, canali owned.

## Attività tipiche
- Piano editoriale e scrittura delle newsletter
- Oggetti, preheader e test
- Comunicati stampa e note per i media
- Messaggi su altri canali (WhatsApp, push, SMS)
- Report sui risultati: aperture, clic, disiscrizioni, conversioni
- Coerenza del tono tra i canali

## Cosa delegare a Claude
- Bozze di newsletter da una scaletta o da un brief
- Varianti di oggetti e preheader da testare
- Comunicati stampa in formato standard
- Adattamento dello stesso messaggio a canali diversi
- Analisi degli export aggregati delle campagne

## Dati e attenzioni
- **Mai liste di destinatari in Claude**: vivono nella piattaforma di invio. Per le analisi si portano solo export aggregati (per campagna o per giorno)
- Tutto quello che esce all'esterno lo rileggi tu prima dell'invio, sempre
- Il tone of voice in `references/` fa la differenza

## Skill e strumenti consigliati

| Voce | A cosa serve | Cosa serve per attivarla |
|---|---|---|
| **MCP ufficiale del tuo CRM o della piattaforma email**, se esiste (per esempio HubSpot, ActiveCampaign) | Flussi, segmenti e report letti direttamente dalla piattaforma | Account con i permessi giusti. **Questi MCP leggono e scrivono i contatti**: prima di collegarlo rileggi `references/regole-d-oro.md`, usa un utente con permessi minimi e conferma ogni azione |
| **Script di anonimizzazione dei CSV** (da costruire tu, con Claude) | Toglie o maschera email, nomi e telefoni da un export prima di darlo a Claude | Python o Node.js. Si costruisce in una sessione, poi diventa una skill con `skill-creator` |
| skill `emails` (`coreyhaines31/marketingskills`, MIT) | Newsletter e sequenze, oggetti e preheader | Si installa con `find-skills` |
| skill `copy-editing` (`coreyhaines31/marketingskills`, MIT) | Revisione prima dell'invio | Si installa con `find-skills` |
| skill `humanizer` (`blader/humanizer`, MIT) | Toglie i segni tipici della scrittura AI da un testo | Si installa con `find-skills` |

**Per tutti i ruoli:** le skill per documenti di Anthropic (docx, xlsx, pptx, pdf: `/plugin marketplace add anthropics/skills`, poi `document-skills`). Per le ricerche approfondite con fonti, Perplexity MCP (`@perplexity-ai/mcp-server`, ufficiale, chiave API a consumo); la ricerca web normale è già inclusa in Claude Code.

_Verificato il 01/10/2026. Prima di collegare un MCP chiedi a Claude di ricontrollarlo: nomi, piani e permessi cambiano in fretta._
