# GitHub Publishing Notes

Recommended repository:

```text
richenyu/codex-auto-video-editing-workflow-skill
```

Recommended install path:

```text
richenyu/codex-auto-video-editing-workflow-skill/skills/auto-video-editing-workflow
```

## Publishing Goal

This repository should be installable as a Codex skill by collaborators. It should preserve the latest automatic video editing workflow and bottom logic without requiring the user to retrain Codex in every new chat.

## Public-Facing Name

Recommended English name:

```text
Codex Auto Video Editing Workflow
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

Version these files:

- `skills/auto-video-editing-workflow/SKILL.md`
- `skills/auto-video-editing-workflow/agents/openai.yaml`
- `skills/auto-video-editing-workflow/references/*.md`
- `skills/auto-video-editing-workflow/scripts/*.ps1`
- `README.md`
- `INSTALL.md`
- `SEO_KEYWORDS.md`
- `.gitignore`

Do not version local generated videos, raw oral footage, private BGM files, temporary QA screenshots, `.venv`, or downloaded FFmpeg binaries.

## Safety Boundary

The skill may include setup scripts, but Codex must not silently download or install dependencies. It should explain what is missing and request approval before running setup commands that download FFmpeg, install Python packages, or create local tool folders.

## Release Checklist

- README is readable English, not mojibake.
- `SKILL.md` has clear frontmatter and trigger terms.
- References include the latest non-regression rules.
- The skill explicitly preserves cumulative rules.
- SEO keywords are present.
- `.gitignore` excludes raw media and generated outputs.
- GitHub remote is correct.
- The pushed branch matches the intended install branch.
