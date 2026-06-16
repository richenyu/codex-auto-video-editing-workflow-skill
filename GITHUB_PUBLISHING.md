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

This repository should be installable as a Codex skill by collaborators. It preserves the latest automatic video editing workflow and bottom logic so the user does not need to retrain Codex in every new chat.

## Public Name

```text
Codex Auto Video Editing Workflow Skill
```

Optional Chinese display name:

```text
Codex 自动视频剪辑工作流
```

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
- `references/bottom-logic.md` is synced from the latest P08 bottom logic.
- README and INSTALL mention the current 4:3 default and custom aspect overrides.
- The non-regression checklist preserves old locked rules.
- The workflow distinguishes real video cutaways from PPT-like MP4 files.
- Stock/API material candidates require source manifests and visual QA.
- Source preflight is required before multi-part video merging.
- Formal scripts are used for captions and visual timing when available.
- `.gitignore` excludes raw/generated media and secrets.
- Validation passes before pushing.
