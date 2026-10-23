param(
    [Parameter(Mandatory=$true)][string]$Source,
    [string]$Destination,
    [Parameter(Mandatory=$true)][string]$Report,
    [Parameter(Mandatory=$true)][string]$PreviewPrefix,
    [switch]$InspectOnly
)
# Run with built-in Windows PowerShell 5.1 (WinRT support), not pwsh.
$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.Runtime.WindowsRuntime
$null = [Windows.Storage.StorageFile, Windows.Storage, ContentType=WindowsRuntime]
$null = [Windows.Media.Transcoding.MediaTranscoder, Windows.Media.Transcoding, ContentType=WindowsRuntime]
$null = [Windows.Media.MediaProperties.MediaEncodingProfile, Windows.Media.MediaProperties, ContentType=WindowsRuntime]
$null = [Windows.Media.Editing.MediaClip, Windows.Media.Editing, ContentType=WindowsRuntime]
$null = [Windows.Media.Editing.MediaComposition, Windows.Media.Editing, ContentType=WindowsRuntime]
$null = [Windows.Storage.Streams.DataReader, Windows.Storage.Streams, ContentType=WindowsRuntime]
$null = [Windows.Media.Playback.MediaPlayer, Windows.Media.Playback, ContentType=WindowsRuntime]
$null = [Windows.Media.Core.MediaSource, Windows.Media.Core, ContentType=WindowsRuntime]

function Await-Operation($Operation, [Type]$ResultType) {
    $method = [System.WindowsRuntimeSystemExtensions].GetMethods() | Where-Object {
        $_.Name -eq 'AsTask' -and $_.IsGenericMethod -and $_.GetGenericArguments().Count -eq 1 -and
        $_.GetParameters().Count -eq 1 -and $_.GetParameters()[0].ParameterType.Name -eq 'IAsyncOperation`1'
    } | Select-Object -First 1
    $task = $method.MakeGenericMethod($ResultType).Invoke($null, @($Operation))
    $task.GetAwaiter().GetResult()
}

function Await-Action($Operation) {
    $method = [System.WindowsRuntimeSystemExtensions].GetMethods() | Where-Object {
        $_.Name -eq 'AsTask' -and $_.IsGenericMethod -and $_.GetParameters().Count -eq 1 -and
        $_.GetParameters()[0].ParameterType.Name -eq 'IAsyncActionWithProgress`1'
    } | Select-Object -First 1
    $task = $method.MakeGenericMethod([double]).Invoke($null, @($Operation))
    $null = $task.GetAwaiter().GetResult()
}

$inputFile = Await-Operation ([Windows.Storage.StorageFile]::GetFileFromPathAsync([IO.Path]::GetFullPath($Source))) ([Windows.Storage.StorageFile])
if ($Destination) {
    if (Test-Path -LiteralPath $Destination) { throw "Refusing to overwrite $Destination" }
    [IO.File]::WriteAllBytes($Destination, [byte[]]@())
    $outputFile = Await-Operation ([Windows.Storage.StorageFile]::GetFileFromPathAsync([IO.Path]::GetFullPath($Destination))) ([Windows.Storage.StorageFile])
    $profile = [Windows.Media.MediaProperties.MediaEncodingProfile]::CreateMp4([Windows.Media.MediaProperties.VideoEncodingQuality]::HD1080p)
    $profile.Video.Width = 1920
    $profile.Video.Height = 1080
    $profile.Video.FrameRate.Numerator = 30
    $profile.Video.FrameRate.Denominator = 1
    $profile.Video.Bitrate = 12000000
    $profile.Audio.SampleRate = 48000
    $profile.Audio.ChannelCount = 2
    $profile.Audio.Bitrate = 192000
    $encoder = New-Object Windows.Media.Transcoding.MediaTranscoder
    # Remove only Movie Maker's initialization frame; leave the runtime sequence intact.
    $encoder.TrimStartTime = [TimeSpan]::FromSeconds(1.0 / 30)
    $prepared = Await-Operation ($encoder.PrepareFileTranscodeAsync($inputFile, $outputFile, $profile)) ([Windows.Media.Transcoding.PrepareTranscodeResult])
    if (-not $prepared.CanTranscode) { throw ('Cannot transcode: ' + $prepared.FailureReason) }
    Await-Action ($prepared.TranscodeAsync())
    $inputFile = $outputFile
}

$properties = Await-Operation ($inputFile.Properties.GetVideoPropertiesAsync()) ([Windows.Storage.FileProperties.VideoProperties])
$clip = Await-Operation ([Windows.Media.Editing.MediaClip]::CreateFromFileAsync($inputFile)) ([Windows.Media.Editing.MediaClip])
$composition = New-Object Windows.Media.Editing.MediaComposition
$addClip = [System.Collections.Generic.ICollection[Windows.Media.Editing.MediaClip]].GetMethod('Add')
$null = $addClip.Invoke($composition.Clips, @($clip))
$frames = @()
foreach ($fraction in @(0.1, 0.4, 0.7, 0.9)) {
    $time = [TimeSpan]::FromSeconds($clip.OriginalDuration.TotalSeconds * $fraction)
    $image = Await-Operation ($composition.GetThumbnailAsync($time, 960, 540, [Windows.Media.Editing.VideoFramePrecision]::NearestFrame)) ([Windows.Graphics.Imaging.ImageStream])
    $reader = New-Object Windows.Storage.Streams.DataReader($image.GetInputStreamAt(0))
    $null = Await-Operation ($reader.LoadAsync([uint32]$image.Size)) ([uint32])
    $bytes = New-Object byte[] ([int]$image.Size)
    $reader.ReadBytes($bytes)
    $name = $PreviewPrefix + '_' + [int]($fraction * 100) + '.jpg'
    [IO.File]::WriteAllBytes($name, $bytes)
    $reader.Dispose()
    $image.Dispose()
    $frames += $name
}
$actual = Await-Operation ([Windows.Media.MediaProperties.MediaEncodingProfile]::CreateFromFileAsync($inputFile)) ([Windows.Media.MediaProperties.MediaEncodingProfile])
$played = 0.0
if (-not $InspectOnly) {
$player = New-Object Windows.Media.Playback.MediaPlayer
$player.IsMuted = $true
$player.Source = [Windows.Media.Core.MediaSource]::CreateFromStorageFile($inputFile)
$player.Play()
$clock = [Diagnostics.Stopwatch]::StartNew()
$played = 0.0
while ($clock.Elapsed.TotalSeconds -lt ($clip.OriginalDuration.TotalSeconds + 5)) {
    Start-Sleep -Milliseconds 100
    $played = [Math]::Max($played, $player.PlaybackSession.Position.TotalSeconds)
    if ($played -ge ($clip.OriginalDuration.TotalSeconds - 0.25)) { break }
}
$player.Pause()
$player.Dispose()
if ($played -lt ($clip.OriginalDuration.TotalSeconds - 0.25)) { throw "Native playback did not reach the end: $played seconds" }
}
$result = [ordered]@{
    file = $inputFile.Path; width = $properties.Width; height = $properties.Height
    seconds = $clip.OriginalDuration.TotalSeconds; fps = [double]$actual.Video.FrameRate.Numerator / $actual.Video.FrameRate.Denominator
    video_compression = $actual.Video.Subtype; audio_compression = $actual.Audio.Subtype
    audio_sample_rate = $actual.Audio.SampleRate; audio_channels = $actual.Audio.ChannelCount
    decoded_previews = $frames; playback_reached_seconds = $played
    verified = if ($InspectOnly) {'Metadata and four decoded positions only; not full playback'} else {'Native Windows decoder decoded four positions; muted MediaPlayer playback reached the end'}
}
$result | ConvertTo-Json -Depth 5 | Set-Content -LiteralPath $Report -Encoding UTF8
$result | ConvertTo-Json -Depth 5
