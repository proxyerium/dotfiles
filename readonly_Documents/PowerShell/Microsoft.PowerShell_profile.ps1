# reference from
# https://www.lfhacks.com/tech/powershell-prompt-git-branch/#revparse

function prompt {
    $promptUser = $env:USERNAME

    git rev-parse | Out-Null
    if($?){ $promptGitBranch = "($(git branch --show-current))" }

    $promptPath = (Get-Location).Path -replace [regex]::Escape($env:USERPROFILE), "~"
    $promptDate = Get-Date -Format "HH:mm:ss"
    "`e[1;36m$promptDate`e[m `e[95m$promptGitBranch`e[m `e[4;97m$promptPath`e[m`n$promptUser > "

}
