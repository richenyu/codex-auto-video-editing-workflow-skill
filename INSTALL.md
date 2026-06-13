# Install Guide

## Install In Codex

Ask Codex:

```text
Please install this skill from GitHub:
richenyu/codex-auto-video-editing-workflow-skill/skills/auto-video-editing-workflow
```

If the repository is private, the collaborator must have GitHub access first.

## First Prompt After Install

```text
Use $auto-video-editing-workflow to edit the latest raw talking-head video according to the saved workflow. If this computer is missing tools or folders, check the environment first and ask before installing dependencies.
```

## What The Skill Needs Locally

- Raw talking-head input folder.
- Final output folder.
- BGM folder with user-approved tracks.
- FFmpeg.
- Python environment and editing packages.
- Optional transcription tools.
- Optional project-specific editing scripts.

## Safety

The skill includes setup scripts, but Codex should not silently download or install tools. It should explain what is missing, ask for permission, and only then run setup.

## Default Original User Folders

On the original user's Windows setup:

```text
Input:  D:\自动剪视频口播
Output: D:\自动剪视频成片
BGM:    D:\自动剪视频BGM
Project: D:\CodecX全项目管理\P08_C02_自动剪视频_auto_video_editing
```

These paths are examples for that machine. Other computers should configure their own equivalent folders.
