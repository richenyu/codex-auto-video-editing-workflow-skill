# GitHub Publishing Notes

Repository:

```text
richenyu/codex-auto-video-editing-workflow-skill
```

Install path:

```text
richenyu/codex-auto-video-editing-workflow-skill/skills/auto-video-editing-workflow
```

## Publishing Goal

This public English repository should be installable as a Codex skill by collaborators. It preserves a reusable automatic video editing workflow without requiring users to copy a long prompt into every new chat.

## Public Name

```text
Codex Auto Video Editing Workflow Skill
```

## Repository Metadata

Recommended GitHub description:

```text
Installable Codex skill for AI-assisted talking-head video editing: speech cleanup, script-aligned captions, BGM/SFX, sentence-matched B-roll, cinematic cutaways, source manifests, and QA.
```

Recommended topics:

```text
codex
codex-skill
video-editing
ai-video-editing
short-form-video
talking-head-video
workflow-automation
b-roll
captions
ffmpeg
creator-tools
finance-explainer
business-explainer
```

Public-facing docs in this repository should stay English-only. Use the Chinese edition repository for Chinese commands, Chinese SEO, Chinese folder conventions, and Chinese locked-rule notes.

## Install Prompt For Collaborators

```text
Please install this skill from GitHub:
richenyu/codex-auto-video-editing-workflow-skill/skills/auto-video-editing-workflow
```

## First Task Prompt

```text
Use $auto-video-editing-workflow to edit the latest raw talking-head video according to the saved workflow. If tools or folders are missing, check the environment first and ask before installing dependencies.
```

## What Should Be Versioned

- `skills/auto-video-editing-workflow/SKILL.md`
- `skills/auto-video-editing-workflow/agents/openai.yaml`
- `skills/auto-video-editing-workflow/references/*.md`
- `skills/auto-video-editing-workflow/scripts/*.ps1`
- `README.md`
- `INSTALL.md`
- `SEO_KEYWORDS.md`
- `.gitignore`

## What Must Not Be Versioned

- API keys and `.env.local`.
- Raw oral footage.
- Finished videos.
- BGM files.
- Downloaded stock media.
- Temporary QA screenshots and contact sheets.
- FFmpeg binaries, virtual environments, model caches, and generated output folders.

## Release Checklist

- `SKILL.md` has valid frontmatter and broad trigger terms.
- README and INSTALL mention the current 4:3 default and aspect overrides.
- The non-regression checklist preserves old locked rules.
- The workflow distinguishes real video cutaways from PPT-like MP4 files.
- Stock/API material candidates require source manifests and visual QA.
- Source preflight is required before multi-part video merging.
- Formal scripts are used for captions and visual timing when available.
- `.gitignore` excludes raw/generated media and secrets.
- Validation passes before pushing.
- README has AI-search summary, target query coverage, install prompt, and natural keyword placement.
- `SEO_KEYWORDS.md` has primary keywords, long-tail keywords, GEO answer blocks, and recommended GitHub topics.
