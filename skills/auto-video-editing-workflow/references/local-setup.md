# Local Setup

This skill is portable. Treat all paths as local configuration.

## Recommended Folder Layout

Create a workspace similar to:

```text
auto-video-workflow/
  input/
  output/
  bgm/
  assets/
  stock-cache/
  reports/
  code/
```

Put raw talking-head videos in `input/`, final videos in `output/`, approved music in `bgm/`, and downloaded or generated visual assets in `assets/` or `stock-cache/`.

## Per-Project Configuration

Configure these values for each machine:

```text
raw_input_folder
final_output_folder
bgm_folder
project_code_folder
workflow_memory_folder
stock_cache_folder
```

If the user says the newest source video is already in the input folder, sort `raw_input_folder` by modification time and inspect likely candidates before choosing one.

## Portable Bootstrap On A New Computer

Skill installation gives Codex the workflow, rules, and bundled scripts. It does not install video tools by itself.

On a new Windows computer, Codex should:

1. Read `SKILL.md`, `references/workflow.md`, and this file.
2. Run `scripts/check-video-workflow.ps1` with the target folders.
3. Report missing tools, folders, or scripts.
4. Ask for permission before running `scripts/setup-video-workflow.ps1`.
5. Only then download FFmpeg, create a virtual environment, or install packages.

Example:

```powershell
powershell -ExecutionPolicy Bypass -File scripts\setup-video-workflow.ps1 -DownloadFfmpeg -InstallPythonPackages -WithTranscription
```

## Useful Tools

Common tools for a complete implementation:

```text
ffmpeg
ffprobe
python
moviepy
opencv
auto-editor
transcription or forced-alignment tools
```

Compatible host projects may provide rendering scripts such as:

```text
smart_talk_editor.py
stock_material_api.py
add_varied_sfx.py
make_contact_sheet.py
normalize_visual_package.py
```

## Common Render Options

Host implementations vary, but useful options often include:

```text
--reference-script
--reference-token-align
--target-aspect 4:3
--target-width 1440
--target-height 1080
--target-fps 30
--speech-speed 1.2
--visual-mode overlay
--overlay-style showcase
--background-blur-mode fast
--write-subtitles
--burn-subtitles
--bgm <path-to-music-file>
--bgm-volume <low-mix-value>
```

## Music

Use user-provided, approved, lyric-free music from the configured BGM folder. Do not rely on hard-coded generated tracks.

If the BGM folder is empty, ask the user to add music or export without BGM.

## Secrets And Media

Keep these local and out of Git:

```text
.env.local
API keys
raw videos
finished videos
BGM files
downloaded stock media
QA images
contact sheets
cache folders
virtual environments
model caches
```

## Handoff

After final QA, place the final MP4 and the key QA preview/contact sheet in the configured output folder. Keep detailed reports and intermediate files inside the project workspace.
