# Publishing Notes

Recommended GitHub repository:

```text
richenyu/codex-auto-video-editing-workflow-skill
```

Repository structure:

```text
repo-root/
├── README.md
├── GITHUB_PUBLISHING.md
└── skills/
    └── auto-video-editing-workflow/
        ├── SKILL.md
        ├── agents/
        │   └── openai.yaml
        ├── references/
        │   ├── workflow.md
        │   ├── style-rules.md
        │   ├── finance-explainer.md
        │   └── local-setup.md
        └── scripts/
            ├── check-video-workflow.ps1
            └── setup-video-workflow.ps1
```

Install prompt for teammates:

```text
Please install this skill from GitHub:
richenyu/codex-auto-video-editing-workflow-skill/skills/auto-video-editing-workflow
```

First-use prompt:

```text
Use $auto-video-editing-workflow to edit the latest talking-head video. If local tools are missing, inspect the environment and install the required dependencies first.
```

Security note: the skill should not silently download software. Codex should explain missing dependencies and ask for permission before running setup scripts, downloading FFmpeg, or installing Python packages.
