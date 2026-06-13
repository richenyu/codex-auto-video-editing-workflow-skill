# Codex Auto Video Editing Workflow Skill

This repository contains an installable Codex Skill for automatic talking-head and short-form video editing.

## What It Does

The skill teaches Codex a reusable video-editing workflow:

- clean repeated speech, restarts, filler, dead air, and weak fragments first
- apply the default `1.2x` talking-head speed after cleanup while preserving pitch
- add large polished visual materials instead of tiny sticker-like labels
- use dynamic cards, real cutaways, screen captures, charts, photos, UI walkthroughs, and B-roll
- allow one, two, or occasionally three large materials on screen when useful
- add readable captions, light upbeat BGM, and varied quiet SFX
- export and QA vertical 1080x1920 MP4 outputs
- check or bootstrap local tools such as FFmpeg, MoviePy, and auto-editor

## Install In Codex

Ask Codex:

```text
Please install this skill from GitHub:
richenyu/codex-auto-video-editing-workflow-skill/skills/auto-video-editing-workflow
```

If the repository is private, give your teammate GitHub access first.

## First Use

After installing the skill, ask Codex:

```text
Use $auto-video-editing-workflow to edit the latest talking-head video. If local tools are missing, inspect the environment and install the required dependencies first.
```

On the first run, Codex should inspect the machine with:

```text
scripts/check-video-workflow.ps1
```

If dependencies are missing, Codex should ask for permission before running:

```text
scripts/setup-video-workflow.ps1
```

The setup script can create working folders, download FFmpeg, create a Python virtual environment, and install packages such as MoviePy and auto-editor. It should not silently download software.

## Important Boundary

The skill contains workflow rules, aesthetic rules, QA rules, and bootstrap scripts. It is not a complete video-editing application by itself.

For one-command production editing, the target computer also needs:

- a raw video input folder
- an output folder
- FFmpeg
- Python and the required packages
- the actual editing implementation or compatible project scripts
- optional BGM, fonts, asset libraries, and transcription/model configuration

Once those are configured, future requests can be as short as:

```text
Use $auto-video-editing-workflow to auto edit the latest video.
```

## Skill Location

```text
skills/auto-video-editing-workflow
```
