#!/bin/bash
# Costruisce dist/assistente-marketing-<versione>.zip (e la copia a nome fisso per le release) dal sorgente kit/.
# I file stanno nella radice dello zip: "Estrai tutto" (Windows) e Archive Utility (Mac)
# creano una sola cartella assistente-marketing, senza cartelle annidate.
set -euo pipefail
QUI="$(cd "$(dirname "$0")" && pwd)"
VER="${1:?uso: $0 <versione, es. 0.2.0>}"
SRC="$QUI/kit"
TMP="$(mktemp -d "${KIT_TMP:-${TMPDIR:-/tmp}}/kit.XXXXXX")"; trap 'rm -rf "$TMP"' EXIT
mkdir -p "$TMP/assistente-marketing" "$QUI/dist"
cp -R "$SRC/." "$TMP/assistente-marketing/"
cd "$TMP/assistente-marketing"
# niente file di servizio dell'harness o del Finder
find . \( -name .cc-writes -o -name .DS_Store -o -name __MACOSX \) -prune -exec rm -rf {} +
find . -depth -type d -empty -not -path "./input" -not -path "./output" -not -path "./projects" -delete
mv .claude/setup/modello.gitignore .gitignore
# niente stato di un'installazione nello zip
for f in .claude/installazione.md context/ruolo.md configurazione.md CLAUDE.local.md; do
  [ ! -e "$f" ] || { echo "ERRORE: $f non deve stare nello zip" >&2; exit 1; }
done
ZIP="$QUI/dist/assistente-marketing-$VER.zip"
rm -f "$ZIP"
zip -qr -X "$ZIP" . 
cd "$QUI/dist" && shasum -a 256 "$(basename "$ZIP")" > "$(basename "$ZIP").sha256"
echo "Creato $ZIP"; cat "$(basename "$ZIP").sha256"
# copia a nome fisso: il link "releases/latest/download/assistente-marketing.zip" resta sempre valido
cp "$ZIP" "$QUI/dist/assistente-marketing.zip"
cd "$QUI/dist" && shasum -a 256 assistente-marketing.zip > assistente-marketing.zip.sha256
