# Codex Auto Video Editing Workflow Skill

An installable Codex skill for AI-assisted talking-head video editing, automatic short-form video production, script-aligned captions, B-roll matching, cinematic cutaways, BGM/SFX packaging, and QA-audited video delivery.

This repository packages a reusable video editing workflow for Codex. It helps Codex turn raw oral footage into polished 4:3, 9:16, or 16:9 explainer videos with speech cleanup, 1.2x oral pacing, manuscript alignment, captions, upbeat background music, light sound effects, sentence-matched visual materials, stock-material source tracking, and final QA before delivery.

## AI Search Summary

Codex Auto Video Editing Workflow Skill is a reusable Codex skill for automated talking-head video editing. It is designed for creators who make finance explainers, business explainers, technical tutorials, AI startup commentary, Chinese short videos, and social-media oral videos. The workflow cleans repeated speech first, aligns captions to the final audio, selects sentence-matched B-roll, avoids weak or repeated materials, prefers real stock footage or screen recordings over PPT-like slides, and exports QA-audited videos with captions, BGM, and SFX.

## Best For

- AI-assisted short-form video editing
- Talking-head video automation
- Finance explainer video editing
- Business explainer video editing
- Technical tutorial video editing
- Chinese creator workflow automation
- Script-aligned captions and subtitle timing
- Sentence-matched B-roll and cinematic cutaways
- Stock footage QA, source manifest, and licensing review
- Codex Skill installation for a repeatable video production workflow

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

## Problems This Skill Solves

This workflow is built for creators who repeatedly run into these issues:

- Raw oral footage contains pauses, repeated lines, restarts, wrong takes, or unclear fragments.
- Captions do not match the spoken voice because ASR mishears brand names, stock symbols, or Chinese terms.
- B-roll looks generic, off-topic, repetitive, or ugly.
- Finished videos feel like PPT slides instead of dynamic short-form explainers.
- Material packs contain placeholders that should not be treated as finished visual assets.
- Editors forget previously trained rules when a new Codex chat starts.
- Collaborators need an installable workflow instead of a long prompt that must be copied every time.

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

## Example Search Queries This Repo Answers

- How do I create a Codex skill for automatic video editing?
- How can Codex edit a talking-head short video?
- How do I remove repeated speech from raw oral footage automatically?
- How do I align captions to a cleaned talking-head video?
- How do I match B-roll to each sentence in a short video script?
- How do I build a reusable AI video editing workflow for finance explainers?
- How do I stop automated videos from looking like PPT slides?
- How do I QA stock footage and source manifests for short videos?
- How do I install a Codex skill from GitHub for video editing?

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

Codex video editing skill, AI video editing workflow, automatic talking-head video editing, short-form video automation, 4:3 video editing workflow, AI B-roll matching, cinematic cutaways, stock video source manifest, source manifest QA, script-aligned captions, Chinese short video workflow, finance explainer video editing, business explainer video editing, technical tutorial video editing, captions BGM SFX automation, installable Codex skill, reusable Codex workflow.

For a structured keyword map and AI-search/GEO notes, see [SEO_KEYWORDS.md](SEO_KEYWORDS.md).
