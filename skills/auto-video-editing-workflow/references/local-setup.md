# Local Setup

This skill is portable. Do not hard-code one computer's paths unless the host project explicitly provides them.

## Generic Windows Workspace

If no host project paths are configured, use a workspace like:

```text
Project root:
%USERPROFILE%\auto-video-editing-workflow

Raw talking-head input:
%USERPROFILE%\auto-video-editing-workflow\input

Final output:
%USERPROFILE%\auto-video-editing-workflow\output

BGM library:
%USERPROFILE%\auto-video-editing-workflow\bgm

Tools:
%USERPROFILE%\auto-video-editing-workflow\tools

Python venv:
%USERPROFILE%\auto-video-editing-workflow\.venv
```

## User's Known Windows Profile

When this skill is used on the original user's machine, the preferred folders are:

```text
Raw oral video input:
D:\自动剪视频口播

Final video output:
D:\自动剪视频成片

BGM folder:
D:\自动剪视频BGM

Main project:
D:\CodecX全项目管理\P08_C02_自动剪视频_auto_video_editing

Editing code:
D:\CodecX全项目管理\P08_C02_自动剪视频_auto_video_editing\50_代码_code\auto_talk_cut_mvp
```

Project memory files to read when available:

```text
04_新窗口上下文_context_pack.md
08_短视频自动剪辑底层逻辑_video_editing_logic.md
07_核心资产索引_asset_index.md
```

## Latest Video Selection

When the user says "latest video" or "new video is in the folder":

1. Sort configured input folder videos by modification time.
2. If one file is clearly newest, use it.
3. If several files are close in time or the user mentioned a number/name, inspect filenames and timestamps.
4. Ask only if ambiguity could cause editing the wrong source.

## First Run On A New Computer

Installing the skill only installs instructions and scripts. It does not install FFmpeg or Python packages by itself.

Codex should:

1. Read `SKILL.md`, `workflow.md`, and this file.
2. Run:

```powershell
scripts/check-video-workflow.ps1
```

3. Explain missing folders or tools.
4. Ask before running setup.
5. If approved, run:

```powershell
powershell -ExecutionPolicy Bypass -File scripts\setup-video-workflow.ps1 -DownloadFfmpeg -InstallPythonPackages -WithTranscription
```

Setup may create folders, download FFmpeg, create a Python virtual environment, and install packages such as MoviePy and auto-editor. Network downloads and package installs require explicit user approval.

## Common Host Project Scripts

If the host project already has automation, prefer existing scripts and patterns. Common names:

```text
scripts/smart_talk_editor.py
scripts/add_varied_sfx.py
tools/ffmpeg/bin/ffmpeg.exe
.venv/Scripts/python.exe
```

Common parameters in compatible projects:

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

## Delivery

After QA, copy final user-facing files to the configured output folder:

- final MP4 with captions/BGM/SFX;
- clean MP4 when useful;
- contact sheet;
- rule audit JSON or report.

Keep intermediate files inside the project output folder.
