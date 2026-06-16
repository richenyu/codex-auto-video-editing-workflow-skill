# Codex Auto Video Editing Workflow Skill

An installable Codex skill for automated talking-head and short-form explainer video editing.

This repository packages a reusable video editing workflow for Codex: speech cleanup, script alignment, 1.2x oral pacing, captions, upbeat BGM, light SFX, sentence-matched B-roll, cinematic cutaways, stock-material source tracking, and QA before delivery.

## What It Does

- Finds the intended raw oral video, including the latest video in a configured input folder.
- Runs source preflight for multi-part videos before merging, so wrong files are not mixed together.
- Cleans the voice first: pauses, restarts, repeated phrases, wrong takes, weak fragments, and duplicate ideas.
- Uses a formal manuscript when available, so captions and visual beats align with the intended script instead of raw ASR mistakes.
- Applies `1.2x` talking-head pacing after cleanup, with pitch preserved.
- Builds a visual plan from the cleaned timeline before rendering.
- Selects materials with two gates: visual beauty and sentence-level relevance.
- Prefers real video, screen recordings, official pages, stock footage, AI video, or strong cinematic motion over static slides.
- Preserves dynamic information overlays during talking-head moments without tiny face stickers.
- Adds captions, bright low-volume BGM, and light varied SFX by default for publishable exports.
- Runs technical QA, contact sheets, source manifests, caption timing checks, and non-regression audits.

## Current Default Style

The current default output is:

```text
4:3 video, 1440x1080, 30fps, MP4
```

Vertical `9:16` and landscape `16:9` are still supported when the user explicitly asks for them.

For 1-3 minute business, finance, AI, and technical explainers, the target rhythm is roughly:

```text
45%-55% visible speaker
45%-55% material-led moments
5-7 real or video-like full cutaways for a roughly 2-minute explainer
8-14 dynamic information overlays during useful talking-head sections
```

## Non-Negotiable Editing Rules

- Clean speech before adding visuals.
- Never use music, effects, or B-roll to hide repeated or broken speech.
- Do not reuse the same material asset inside one finished video.
- Do not force weak local material packs into the timeline.
- Do not treat PPT-like MP4 files as real video cutaways.
- Do not use generic stock footage if it does not match the current sentence.
- Reject military, police, war, weapon, prison, riot, or violent-conflict visuals unless the script explicitly discusses them.
- Prefer API/stock/official/recorded materials first; procedural or PPT-like cards are fallback only.
- If a formal script exists, use it as caption text truth and align it to the cleaned final audio.
- Store API keys only in local environment variables or private `.env.local` files, never in GitHub.

## Install From GitHub

Ask Codex:

```text
Please install this skill from GitHub:
richenyu/codex-auto-video-editing-workflow-skill/skills/auto-video-editing-workflow
```

Or run the Codex skill installer script if your Codex environment exposes it:

```powershell
python "$env:USERPROFILE\.codex\skills\.system\skill-installer\scripts\install-skill-from-github.py" "richenyu/codex-auto-video-editing-workflow-skill/skills/auto-video-editing-workflow"
```

If the repository is private, give the collaborator GitHub access first.

## First Use Prompt

After installation:

```text
Use $auto-video-editing-workflow to edit the latest raw talking-head video according to the saved workflow. If this computer is missing tools or folders, check the environment first and ask before installing dependencies.
```

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

## Important Boundary

This is a Codex skill, not a full standalone video editor. It gives Codex the workflow, rules, setup checks, and decision logic. A computer still needs input/output folders, FFmpeg, Python packages, optional transcription tools, BGM files, fonts, media assets, and compatible rendering scripts to produce finished videos.

## SEO Keywords

Codex video editing skill, AI video editing workflow, automatic talking-head video editing, short-form video automation, 4:3 video editing workflow, AI B-roll matching, cinematic cutaways, stock video source manifest, Chinese short video workflow, finance explainer video editing, business explainer video editing, captions BGM SFX automation, 口播视频自动剪辑, 自动剪视频工作流.
