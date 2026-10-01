# Marketing automation specialist

Costruisce i flussi automatici che portano il contatto giusto al messaggio giusto nel momento giusto.

## Attività tipiche
- Flussi di nurturing, onboarding, riattivazione, carrello abbandonato
- Segmentazione e lead scoring
- Integrazioni tra CRM, piattaforma email, sito e strumenti di automazione (n8n, Make, Zapier)
- Template di email e messaggi
- Monitoraggio delle performance dei flussi
- Qualità del database e gestione dei consensi

## Cosa delegare a Claude
- Progettazione di un flusso: trigger, condizioni, tempi, messaggi
- Logica di segmentazione e di scoring
- Copy dei messaggi del flusso
- Workflow di automazione e piccoli script di integrazione
- Analisi delle performance per passaggio del flusso

## Dati e attenzioni
- Questo è il ruolo più vicino ai dati personali: **le liste di contatti non passano mai da Claude**. Si lavora su strutture, regole e numeri aggregati
- Consensi e basi giuridiche (GDPR) decidono chi può ricevere cosa: non si automatizza un invio senza consenso
- Chiavi di CRM e piattaforme solo nel `.env`, mai nei workflow esportati

## Skill e strumenti consigliati

| Voce | A cosa serve | Cosa serve per attivarla |
|---|---|---|
| **MCP ufficiale del tuo CRM o della piattaforma email**, se esiste (per esempio HubSpot, ActiveCampaign) | Flussi, segmenti e report letti direttamente dalla piattaforma | Account con i permessi giusti. **Questi MCP leggono e scrivono i contatti**: prima di collegarlo rileggi `references/regole-d-oro.md`, usa un utente con permessi minimi e conferma ogni azione |
| **Script di anonimizzazione dei CSV** (da costruire tu, con Claude) | Toglie o maschera email, nomi e telefoni da un export prima di darlo a Claude | Python o Node.js. Si costruisce in una sessione, poi diventa una skill con `skill-creator` |
| **MCP integrato di n8n** (n8n, ufficiale) — se usi n8n | Cerca, ispeziona e lancia i tuoi workflow | Versione recente di n8n, da attivare nelle impostazioni dell'istanza (Instance-level MCP) |
| skill `emails` (`coreyhaines31/marketingskills`, MIT) | Sequenze email: trigger, tempi, messaggi | Si installa con `find-skills` |

**Per tutti i ruoli:** le skill per documenti di Anthropic (docx, xlsx, pptx, pdf: `/plugin marketplace add anthropics/skills`, poi `document-skills`). Per le ricerche approfondite con fonti, Perplexity MCP (`@perplexity-ai/mcp-server`, ufficiale, chiave API a consumo); la ricerca web normale è già inclusa in Claude Code.

_Verificato il 01/10/2026. Prima di collegare un MCP chiedi a Claude di ricontrollarlo: nomi, piani e permessi cambiano in fretta._
