---
name: auto-video-editing-workflow
description: Automatic short-form video and talking-head editing workflow. Use when Codex is asked to edit raw talking-head footage, cut the latest recorded video, apply a saved video-editing workflow or bottom logic, process oral video footage, remove pauses and repeated speech, build finance/business/technical explainer videos, match large B-roll and dynamic materials, add captions, add light upbeat BGM, add light varied SFX, export a clean no-caption/no-BGM variant, or run video QA. Also use in new windows when the user says the new oral video is already in the folder and wants the saved workflow applied.
---

# Auto Video Editing Workflow

Use this skill to turn raw oral/talking-head footage, a manuscript, or a topic brief into a polished vertical short video.

## New Window Contract

If the user mentions any of these ideas, use this skill immediately instead of asking them to retrain the workflow:

```text
automatic video editing
talking-head video
oral video
latest raw video
new video is in the folder
edit according to previous bottom logic
use the trained workflow
captions / BGM / SFX
finance explainer
business explainer
technical explainer
自动剪视频
口播视频
最新口播
新视频放到文件夹
按之前底层逻辑剪
按训练好的工作流剪
字幕 / 配乐 / 音效
财经 / 商业 / 技术讲解视频
```

Rules are cumulative. A new user correction adds to the active rule stack. It does not erase older locked rules unless the user explicitly cancels that specific rule.

## Quick Loading Guide

Load only what the current task needs:

- For a real edit: read `references/workflow.md`.
- For visual material, cutaway, BGM, SFX, and style decisions: read `references/style-rules.md`.
- For the locked bottom logic and latest non-negotiable rules: read `references/bottom-logic.md`.
- For finance, stock market, macro, or business explainers: read `references/finance-explainer.md`.
- For local folders, environment checks, setup, and handoff conventions: read `references/local-setup.md`.
- Before any formal delivery: read `references/non-regression-checklist.md`.

If a host project has its own memory files, also read its context pack, asset index, and video editing logic before editing.

## Core Order Of Work

Do the work in this order:

```text
1. Understand the topic, audience, point of view, and story.
2. Locate the intended source video.
3. Transcribe or inspect the speech timeline.
4. Clean the speech first: repeated lines, restarts, wrong takes, dead air, weak fragments.
5. Build a smooth spoken timeline before adding visuals.
6. Apply the default talking-head tempo: 1.2x after cleanup, with pitch preserved.
7. Match or generate materials only after the sped-up clean timeline exists.
8. Select materials with two equal gates: beauty and sentence-level relevance.
9. Render varied visual roles: face, overlay, feature, full_card, full_broll/cutaway.
10. Add clear captions, low-volume upbeat BGM, and light varied SFX by default.
11. Export a clean no-caption/no-BGM version when useful.
12. Run rule audit, contact sheet, media QA, and volume QA before delivery.
```

Never use materials, motion, BGM, or SFX to hide a broken speech timeline.

## Hard Rules

Treat these as QA failure conditions:

- Clean speech first.
- Default oral speed is `1.2x` after cleanup. Preserve pitch.
- Formal publish exports default to captions, low-volume upbeat BGM, and light varied SFX.
- BGM should come from the user's configured BGM folder. Do not rely on hard-coded generated tracks.
- Materials must be both beautiful and sentence-matched.
- Material match is sentence-level, not broad-topic.
- Do not reuse the same material source asset in one finished video.
- Material moments must be dynamic. Static stills are source material only; final inserts must be visibly video-like.
- Prefer real video, screen recordings, official pages, realistic footage, GIF-like clips, or AI video over static image motion.
- No tiny pill labels, stickers, or floating text chips on or near the speaker's face.
- Use large readable overlays and large material shots.
- A full-screen cutaway may fully cover the speaker while the user's voice continues.
- For a 2-minute business, finance, or technical explainer, plan roughly 5-7 real or video-like full-screen cutaways when enough strong materials exist.
- Do not count pure slide cards, chart cards, or opinion cards as real `full_broll`.
- Avoid English fake UI and large English fake dashboards unless the real source itself is English.
- Do not make the whole video feel like PPT, a dashboard slideshow, or card-stack animation.
- Before final delivery, create a rule audit and a contact sheet. If the audit fails, revise and rerun QA.

## Default Output

- Vertical `9:16`, `1080x1920`, stable `30fps` MP4.
- Final publish version with burned captions, BGM, and light SFX.
- Clean handoff version without captions and without BGM when useful.
- Report or JSON audit with speech speed, material count, material source uniqueness, material ratios, SFX count, BGM path, decode QA, and volume QA.
- Contact sheet for visual inspection.

## Local Setup

Run the environment check script when the computer or project state is unknown:

```powershell
scripts/check-video-workflow.ps1
```

On a new Windows computer, if required tools are missing, explain what is missing and ask for permission before running:

```powershell
scripts/setup-video-workflow.ps1
```

The setup script may create folders, download FFmpeg, create a Python virtual environment, and install editing packages. Do not silently download or install tools.
