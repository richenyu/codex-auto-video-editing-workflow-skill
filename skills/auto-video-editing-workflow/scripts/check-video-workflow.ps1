param(
    [string]$ProjectRoot = "",
    [string]$MemoryRoot = "",
    [string]$SkillRoot = "",
    [string]$InputDir = "",
    [string]$OutputDir = ""
)

function Default-ProjectRoot {
    return (Join-Path $env:USERPROFILE "auto-video-editing-workflow")
}

function Default-MemoryRoot {
    return (Join-Path (Default-ProjectRoot) "memory")
}

function Default-SkillRoot {
    return (Join-Path $env:USERPROFILE ".codex\skills\auto-video-editing-workflow")
}

function Default-InputDir {
    return (Join-Path (Default-ProjectRoot) "input")
}

function Default-OutputDir {
    return (Join-Path (Default-ProjectRoot) "output")
}

if (-not $ProjectRoot) { $ProjectRoot = Default-ProjectRoot }
if (-not $MemoryRoot) { $MemoryRoot = Default-MemoryRoot }
if (-not $SkillRoot) { $SkillRoot = Default-SkillRoot }
if (-not $InputDir) { $InputDir = Default-InputDir }
if (-not $OutputDir) { $OutputDir = Default-OutputDir }

$ContextPack = Get-ChildItem -LiteralPath $MemoryRoot -File -Filter "04_*context_pack.md" -ErrorAction SilentlyContinue | Select-Object -First 1 -ExpandProperty FullName
$BottomLogic = Get-ChildItem -LiteralPath $MemoryRoot -File -Filter "08_*video_editing_logic.md" -ErrorAction SilentlyContinue | Select-Object -First 1 -ExpandProperty FullName
$AssetIndex = Get-ChildItem -LiteralPath $MemoryRoot -File -Filter "07_*asset_index.md" -ErrorAction SilentlyContinue | Select-Object -First 1 -ExpandProperty FullName
if (-not $ContextPack) { $ContextPack = Join-Path $MemoryRoot "04_*context_pack.md" }
if (-not $BottomLogic) { $BottomLogic = Join-Path $MemoryRoot "08_*video_editing_logic.md" }
if (-not $AssetIndex) { $AssetIndex = Join-Path $MemoryRoot "07_*asset_index.md" }

$items = @(
    @{ Label = "Project root"; Path = $ProjectRoot; Type = "Directory" },
    @{ Label = "Workflow memory root"; Path = $MemoryRoot; Type = "Directory" },
    @{ Label = "Installed skill root"; Path = $SkillRoot; Type = "Directory" },
    @{ Label = "Input folder"; Path = $InputDir; Type = "Directory" },
    @{ Label = "Output folder"; Path = $OutputDir; Type = "Directory" },
    @{ Label = "Workflow context pack"; Path = $ContextPack; Type = "File" },
    @{ Label = "Workflow bottom logic"; Path = $BottomLogic; Type = "File" },
    @{ Label = "Workflow asset index"; Path = $AssetIndex; Type = "File" },
    @{ Label = "Skill entry"; Path = (Join-Path $SkillRoot "SKILL.md"); Type = "File" },
    @{ Label = "Skill workflow reference"; Path = (Join-Path $SkillRoot "references\workflow.md"); Type = "File" },
    @{ Label = "Skill style rules"; Path = (Join-Path $SkillRoot "references\style-rules.md"); Type = "File" },
    @{ Label = "Skill local setup"; Path = (Join-Path $SkillRoot "references\local-setup.md"); Type = "File" },
    @{ Label = "Skill setup script"; Path = (Join-Path $SkillRoot "scripts\setup-video-workflow.ps1"); Type = "File" },
    @{ Label = "smart_talk_editor.py"; Path = (Join-Path $ProjectRoot "scripts\smart_talk_editor.py"); Type = "File" },
    @{ Label = "add_varied_sfx.py"; Path = (Join-Path $ProjectRoot "scripts\add_varied_sfx.py"); Type = "File" },
    @{ Label = "ffmpeg.exe"; Path = (Join-Path $ProjectRoot "tools\ffmpeg\bin\ffmpeg.exe"); Type = "File" },
    @{ Label = "venv python"; Path = (Join-Path $ProjectRoot ".venv\Scripts\python.exe"); Type = "File" }
)

foreach ($item in $items) {
    $exists = if ($item.Type -eq "Directory") {
        Test-Path -LiteralPath $item.Path -PathType Container
    } else {
        Test-Path -LiteralPath $item.Path -PathType Leaf
    }
    [PSCustomObject]@{
        Label = $item.Label
        Exists = $exists
        Path = $item.Path
    }
}
