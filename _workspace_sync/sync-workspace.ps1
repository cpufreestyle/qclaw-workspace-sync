# QClaw workspace sync script
ErrorActionPreference = 'Stop'
ErrorLogFile = Join-Path \ 'sync-error.log'

function Write-Log {
    param([string]\)
    \ = Get-Date -Format 'yyyy-MM-dd HH:mm:ss'
    \ = '[' + \ + '] ' + \
    Write-Host \
    Add-Content -Path \ -Value \ -Encoding UTF8
}

try {
    Write-Log '========== Sync started =========='
    Write-Log ('Workspace: ' + \)
    Set-Location -Path \
    \ = git --version 2>&1
    Write-Log ('Git version: ' + \)
    Write-Log 'Pulling remote changes...'
    git pull --rebase --autostash 2>&1 | ForEach-Object { Write-Log ('  ' + \) }
    \ = git status --porcelain
    if (-not \) {
        Write-Log 'No changes detected.'
        Write-Log '========== Sync done =========='
        exit 0
    }
    Write-Log 'Changes detected:'
    \ | ForEach-Object { Write-Log ('  ' + \) }
    Write-Log 'Adding files...'
    git add -A
    \ = 'Sync ' + (Get-Date -Format 'yyyy-MM-dd HH:mm:ss')
    Write-Log ('Committing: ' + \)
    git commit -m \
    Write-Log 'Pushing...'
    git push 2>&1 | ForEach-Object { Write-Log ('  ' + \) }
    Write-Log 'Push successful!'
    Write-Log '========== Sync done =========='
    exit 0
} catch {
    Write-Log ('[ERROR] Sync failed: ' + \)
    exit 1
}
