# Solo Windows. Copia le chiavi del file .env nelle variabili d'ambiente dell'utente,
# cosi' le vedono VS Code, Claude Code e gli strumenti collegati (MCP, CLI).
# Stampa solo i NOMI delle chiavi, mai i valori. Va rilanciato ogni volta che il .env cambia,
# poi si chiude e riapre VS Code.

$envFile = Join-Path (Split-Path -Parent (Split-Path -Parent $PSScriptRoot)) ".env"
if (-not (Test-Path $envFile)) {
    Write-Output "Nessun file .env in $envFile"
    exit 1
}

foreach ($line in Get-Content -Path $envFile -Encoding UTF8) {
    $line = $line.Trim()
    if ($line -eq "" -or $line.StartsWith("#")) { continue }
    if ($line -notmatch '^([A-Z_][A-Z0-9_]*)=(.*)$') {
        Write-Output "Riga ignorata: non e' nel formato NOME=valore"
        continue
    }
    $name = $Matches[1]
    $value = $Matches[2].Trim()
    # Un commento sulla stessa riga (" # ...") non fa parte della chiave: come fa zsh sul Mac
    if ($value -match '^"([^"]*)"' -or $value -match "^'([^']*)'") {
        $value = $Matches[1]
    } else {
        $value = ($value -replace '\s+#.*$', '').Trim()
    }
    if ($value -eq "") {
        Write-Output "$name vuota, saltata"
        continue
    }
    [Environment]::SetEnvironmentVariable($name, $value, "User")
    Write-Output "$name impostata"
}
