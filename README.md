# Codex Auto Video Editing Workflow

An installable Codex skill for automated short-form talking-head video editing.

This repository packages the editing workflow, visual rules, QA checklist, local setup guidance, and helper scripts that let Codex turn raw oral footage into a polished vertical video with speech cleanup, captions, upbeat BGM, light SFX, and sentence-matched dynamic materials.

## What This Skill Does

- Finds the intended raw talking-head video, including the latest file in a configured input folder.
- Cleans speech first: pauses, restarts, repeated phrases, wrong takes, weak fragments, and duplicate ideas.
- Builds a smooth spoken timeline before adding visuals.
- Applies the default talking-head speed of `1.2x` after cleanup, with pitch preserved.
- Adds captions, low-volume upbeat BGM, and light varied SFX by default for publishable exports.
- Plans large visual materials instead of tiny stickers or face-adjacent labels.
- Matches every material to the current sentence, not just the broad topic.
- Uses a balanced rhythm between the speaker and visual materials.
- Prefers real video, screen recordings, official pages, realistic footage, GIF-like clips, or strong cinematic motion over static images.
- Runs QA with media checks, contact sheets, volume checks, and a rule audit before delivery.

## Core Editing Philosophy

The workflow is built around one hard rule:

```text
Clean the speech first. Never use visuals, music, or effects to hide a broken oral timeline.
```

After that, visual materials must pass two equal gates:

```text
Beauty gate + sentence relevance gate
```

A material should look good on a phone and match the exact sentence being spoken. If a relevant material is ugly, reject it. If a beautiful material is off-topic, reject it.

## Current Locked Style Rules

- Default final format: vertical `1080x1920`, `30fps`, MP4.
- Default oral speed: `1.2x` after cleanup.
- Default publish export: burned captions, light upbeat lyric-free BGM, and light varied SFX.
- Default clean handoff export: no captions and no BGM when useful.
- Use large overlays and large cutaways; no tiny stickers, pill labels, or face clutter.
- For 1-3 minute business, finance, and technical explainers, aim for a balanced speaker/material rhythm.
- For a roughly 2-minute explainer, plan around 5-7 real or video-like full-screen cutaways when enough strong materials exist.
- Do not count pure slide cards, chart cards, or opinion cards as real `full_broll`.
- Do not reuse the same source asset inside one finished video.
- Chinese-first visual rule: avoid large English fake UI or fake dashboards unless the real source itself is in English.
- Do not turn the whole video into PPT, dashboard panels, or card-stack animations.
- Static images may be used as source material, but the final video must make them visibly video-like with strong motion.

## Install From GitHub

Ask Codex to install this skill:

```text
Please install this skill from GitHub:
richenyu/codex-auto-video-editing-workflow-skill/skills/auto-video-editing-workflow
```

If the repository is private, give the collaborator GitHub access first.

## First Use Prompt

After installation, a collaborator can say:

```text
Use $auto-video-editing-workflow to edit the latest raw talking-head video. If this computer is missing tools, check the environment first and ask before installing dependencies.
```

Codex should then:

1. Read the skill.
2. Load the relevant references.
3. Check local paths and tools.
4. Ask before downloading or installing anything.
5. Edit the video only after the environment is ready.

## Repository Structure

```text
skills/auto-video-editing-workflow/
  SKILL.md
  agents/openai.yaml
  references/
    workflow.md
    style-rules.md
    bottom-logic.md
    finance-explainer.md
    local-setup.md
    non-regression-checklist.md
  scripts/
    check-video-workflow.ps1
    setup-video-workflow.ps1
```

## SEO Keywords

Codex video editing skill, AI video editing workflow, automatic talking-head video editing, short-form video automation, vertical video editor, AI B-roll matching, Chinese short video workflow, finance explainer video editing, business explainer video editing, video captions BGM SFX automation, Codex skill for video editing.

## Important Boundary

This repository stores the workflow and skill instructions. It is not a complete video editing product by itself.

To produce finished videos on another computer, that computer still needs configured input/output folders, FFmpeg, Python packages, optional transcription tools, BGM files, fonts, media assets, and compatible editing scripts.
