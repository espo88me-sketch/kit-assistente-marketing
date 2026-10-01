# Graphic designer

Dà forma visiva alla comunicazione: brand, social, campagne, pagine, materiali.

## Attività tipiche
- Grafiche per social, campagne e banner
- Identità visiva e linee guida del brand
- Layout di landing, email e presentazioni
- Adattamento dei formati tra canali
- Brief creativi e moodboard
- Preparazione dei file per la stampa e il web

## Cosa delegare a Claude
- Design system su file (colori, font, spaziature) da cui far nascere pagine coerenti, con `design-system-first`
- Prototipi HTML di landing ed email
- Brief creativi, moodboard testuali e varianti di concept
- Copy da inserire nei layout
- Controlli: contrasti, gerarchie, coerenza con le linee guida

## Dati e attenzioni
- Loghi, font e immagini hanno licenze: Claude non sa se puoi usarli, lo verifichi tu
- Le immagini generate con l'AI vanno controllate prima di un uso commerciale
- Le linee guida del brand vanno in `references/`: Claude le legge prima di ogni lavoro visivo

## Skill e strumenti consigliati

| Voce | A cosa serve | Cosa serve per attivarla |
|---|---|---|
| **Figma MCP** (Figma, ufficiale) | Legge i file di design (componenti, variabili, stili) per portarli in pagine e prototipi | Account Figma. La scrittura sul canvas, in beta, richiede un seat Full |
| **Canva AI Connector** (Canva, ufficiale) | Cerca i tuoi design, crea con Canva AI, compila template, esporta | Piano Canva Pro, Teams, Business o Nonprofit |
| skill `frontend-design` (Anthropic, Apache 2.0) | Pagine e interfacce curate, insieme a `design-system-first` | `/plugin marketplace add anthropics/skills`, poi `example-skills` |
| **Higgsfield MCP** (Higgsfield, ufficiale) | Video e immagini generati con l'AI, editing | Account Higgsfield. Ogni generazione consuma crediti a tariffa piena |

**Per tutti i ruoli:** le skill per documenti di Anthropic (docx, xlsx, pptx, pdf: `/plugin marketplace add anthropics/skills`, poi `document-skills`). Per le ricerche approfondite con fonti, Perplexity MCP (`@perplexity-ai/mcp-server`, ufficiale, chiave API a consumo); la ricerca web normale è già inclusa in Claude Code.

_Verificato il 01/10/2026. Prima di collegare un MCP chiedi a Claude di ricontrollarlo: nomi, piani e permessi cambiano in fretta._
