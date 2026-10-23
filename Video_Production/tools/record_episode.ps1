param(
    [Parameter(Mandatory=$true)][string]$GameRepo,
    [Parameter(Mandatory=$true)][string]$Godot,
    [Parameter(Mandatory=$true)][string]$OutputRoot,
    [string]$HistoricalRef = 'e720b49',
    [string]$CurrentRef = '014793a',
    [ValidateSet('A','B','C','D','E','F')][string[]]$Shots = @('A','B','C','D','E','F')
)
$ErrorActionPreference = 'Stop'
if ((Test-Path -LiteralPath $OutputRoot) -and (Get-ChildItem -LiteralPath $OutputRoot -Force | Select-Object -First 1)) {
    throw 'Use a new empty OutputRoot for each take. Existing recordings are never overwritten.'
}
if (-not (Test-Path -LiteralPath $Godot -PathType Leaf)) { throw 'Godot executable missing' }
$rootPath = [IO.Path]::GetFullPath($OutputRoot)
$repoPath = (& git -C $GameRepo rev-parse --show-toplevel).Trim()
if ($LASTEXITCODE -ne 0) { throw 'GameRepo is not a Git repository' }
if ($rootPath.Replace('\','/').Equals($repoPath.Replace('\','/'), [StringComparison]::OrdinalIgnoreCase) -or $rootPath.Replace('\','/').StartsWith($repoPath.Replace('\','/') + '/', [StringComparison]::OrdinalIgnoreCase)) {
    throw 'Video output must live outside the game Git repository.'
}
foreach ($folder in @('historical','current','capcut_import','previews','manifests','logs','source_snapshots')) {
    $null = New-Item -ItemType Directory -Force (Join-Path $rootPath $folder)
}
$refs = @{}
foreach ($kind in @('historical','current')) {
    $ref = if ($kind -eq 'historical') {$HistoricalRef} else {$CurrentRef}
    $hash = (& git -C $GameRepo rev-parse --verify ($ref + '^{commit}')).Trim()
    if ($LASTEXITCODE -ne 0) { throw "Unknown source ref: $ref" }
    $refs[$kind] = $hash
    $snapshot = Join-Path $rootPath "source_snapshots/$kind"
    $archive = $snapshot + '.zip'
    & git -C $GameRepo archive --format=zip "--output=$archive" $hash
    if ($LASTEXITCODE -ne 0) { throw 'Source archive failed' }
    Expand-Archive -LiteralPath $archive -DestinationPath $snapshot
    Copy-Item -LiteralPath (Join-Path $PSScriptRoot 'capture_episode.gd') -Destination (Join-Path $snapshot 'tests/capture_episode.gd')
    $configPath = Join-Path $snapshot 'project.godot'
    $config = [IO.File]::ReadAllText($configPath)
    foreach ($setting in @('window_width_override','window_height_override')) {
        if ($config -notmatch "window/size/$setting=") { throw "Missing capture window setting $setting" }
    }
    $config = $config -replace '(?m)^window/size/window_width_override=.*$', 'window/size/window_width_override=1920'
    $config = $config -replace '(?m)^window/size/window_height_override=.*$', 'window/size/window_height_override=1080'
    [IO.File]::WriteAllText($configPath, $config, (New-Object Text.UTF8Encoding($false)))
    $env:APPDATA = Join-Path $snapshot '.godot/capture_userdata'
    & $Godot --headless --editor --path $snapshot --import --quit *> (Join-Path $rootPath "logs/import_$kind.log")
    if ($LASTEXITCODE -ne 0) { throw "Import failed for $kind; inspect its log" }
}
foreach ($shot in $Shots) {
    $kind = if ($shot -in @('A','B')) {'historical'} else {'current'}
    $snapshot = Join-Path $rootPath "source_snapshots/$kind"
    $hash = $refs[$kind]
    $name = $shot + '_EP01_' + $hash.Substring(0,7)
    $seconds = if ($shot -eq 'E') {10} elseif ($shot -eq 'C') {6} else {8}
    $avi = Join-Path $rootPath "$kind/$name.avi"
    $mp4 = Join-Path $rootPath "capcut_import/$name.mp4"
    $prefix = Join-Path $rootPath "previews/$name"
    $env:APPDATA = Join-Path $snapshot '.godot/capture_userdata'
    & $Godot --path $snapshot --script res://tests/capture_episode.gd --resolution 1920x1080 --write-movie $avi --fixed-fps 30 --disable-vsync -- --test-mode "--shot=$shot" "--seconds=$seconds" "--commit=$hash" "--output-prefix=$prefix" *> (Join-Path $rootPath "logs/$name.log")
    if ($LASTEXITCODE -ne 0 -or -not (Get-Content -LiteralPath ($prefix + '.json') -Raw | ConvertFrom-Json).passed) {
        throw "Capture $shot failed. Keep the take/logs for diagnosis."
    }
    $report = Join-Path $rootPath "manifests/$name.json"
    $decodedPrefix = Join-Path $rootPath "previews/${name}_decoded"
    $ffmpeg = Get-Command ffmpeg -ErrorAction SilentlyContinue
    if ($ffmpeg) {
        & $ffmpeg.Source -hide_banner -n -ss 0.033333 -i $avi -c:v libx264 -preset medium -crf 18 -pix_fmt yuv420p -r 30 -c:a aac -b:a 192k -movflags +faststart $mp4
        if ($LASTEXITCODE -ne 0) { throw "FFmpeg failed for $shot" }
        & powershell.exe -NoProfile -ExecutionPolicy Bypass -File (Join-Path $PSScriptRoot 'windows_video.ps1') -Source $mp4 -Report $report -PreviewPrefix $decodedPrefix
    } else {
        & powershell.exe -NoProfile -ExecutionPolicy Bypass -File (Join-Path $PSScriptRoot 'windows_video.ps1') -Source $avi -Destination $mp4 -Report $report -PreviewPrefix $decodedPrefix
    }
    if ($LASTEXITCODE -ne 0) { throw "MP4 validation failed for $shot" }
    Write-Output "Shot $shot captured, encoded and decoded successfully."
}
Write-Output "Finished: $rootPath"
