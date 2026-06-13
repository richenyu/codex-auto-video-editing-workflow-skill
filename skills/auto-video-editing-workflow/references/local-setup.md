# Local Setup

This skill is portable. Treat all paths as project-specific configuration.

## Recommended Portable Windows Layout

When no project-specific paths are available, use a workspace under the user's profile:

```text
Project root:
%USERPROFILE%\auto-video-editing-workflow

Raw input folder:
%USERPROFILE%\auto-video-editing-workflow\input

Final output folder:
%USERPROFILE%\auto-video-editing-workflow\output

Default BGM folder:
%USERPROFILE%\auto-video-editing-workflow\bgm

Tools folder:
%USERPROFILE%\auto-video-editing-workflow\tools

Python virtual environment:
%USERPROFILE%\auto-video-editing-workflow\.venv
```

For new windows, if the user says "the new talking-head video is in the folder", sort the configured input folder by `LastWriteTime` and use the latest video unless there is ambiguity.

## Configure These Paths

Ask for these paths or infer them from the local project:

```text
Raw input folder:
<path-to-raw-talking-head-videos>

Final output folder:
<path-to-final-video-exports>

Default BGM folder:
<path-to-default-bgm-library>

Project code folder:
<path-to-auto-video-editing-code>

Main project memory or workflow document:
<path-to-video-editing-workflow-notes>
```

## Portable Bootstrap On A New Computer

Skill installation gives Codex the workflow, rules, and bundled scripts. It does not silently install software by itself. On a new Windows computer, Codex should:

1. Read `SKILL.md`, `references/workflow.md`, and this file.
2. Run `scripts/check-video-workflow.ps1` to inspect folders, FFmpeg, Python, project code, and workflow files.
3. If tools are missing, explain the missing items and request approval before running `scripts/setup-video-workflow.ps1`.
4. Run setup with the switches needed for that machine, for example:

```powershell
powershell -ExecutionPolicy Bypass -File scripts\setup-video-workflow.ps1 -DownloadFfmpeg -InstallPythonPackages -WithTranscription
```

The setup script can create portable working folders, download FFmpeg, create a Python virtual environment, and install core video-editing packages including MoviePy and auto-editor. Network downloads and package installation should be explicit, not silent.

## Key Project Scripts

If the host project contains an implementation similar to the original workflow, look for:

```text
scripts/smart_talk_editor.py
scripts/add_varied_sfx.py
tools/ffmpeg/bin/ffmpeg.exe
.venv/Scripts/python.exe
```

Useful options in compatible implementations:

```text
--reference-script
--reference-token-align
--visual-mode overlay
--overlay-style showcase
--base-motion
--background-blur-mode fast
--broll-every 1
--broll-layout-bias balanced|feature|full
--no-fill-overlay-assets
--allow-asset-fallback
--write-subtitles
--burn-subtitles
--bgm <path-to-music-file>
--bgm-volume <low-mix-value>
--speech-speed 1.2
```

## Typical Finance Explainer Parameters

```text
--visual-mode overlay
--overlay-style showcase
--base-motion
--background-blur-mode fast
--background-blur-sigma 10
--background-blur-dim 0.74
--broll-every 1
--broll-layout-bias feature
--max-assets-per-chunk 1
--no-fill-overlay-assets
--hook-face-duration 2.2
--broll-min-gap 1.05
--max-consecutive-broll 2
--speech-speed 1.2
```

## Default Local Music Beds

Use the user-provided files in the configured BGM folder. Do not assume fixed generated defaults.

Mix BGM below the voice, fade in/out, and lower the music further when the recording has room noise. If the BGM folder is empty, ask the user for music or export without BGM.

## Handoff

After final QA, copy the final MP4 and contact sheet to the configured output folder. Keep reports, SFX event JSON, and intermediate files inside the project output directory.
