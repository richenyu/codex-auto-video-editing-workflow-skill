# Install Guide

## Install In Codex

Ask Codex:

```text
Please install this skill from GitHub:
richenyu/codex-auto-video-editing-workflow-skill/skills/auto-video-editing-workflow
```

If the repository is private, the collaborator must have GitHub access first.

## Optional CLI Install

If the Codex skill installer is available on the machine:

```powershell
python "$env:USERPROFILE\.codex\skills\.system\skill-installer\scripts\install-skill-from-github.py" "richenyu/codex-auto-video-editing-workflow-skill/skills/auto-video-editing-workflow"
```

## First Prompt After Install

```text
Use $auto-video-editing-workflow to edit the latest raw talking-head video according to the saved workflow. If this computer is missing tools or folders, check the environment first and ask before installing dependencies.
```

## What The Skill Needs Locally

- A raw talking-head input folder.
- A final output folder.
- A BGM folder with approved lyric-free tracks.
- FFmpeg.
- Python and editing packages.
- Optional transcription or forced-alignment tools.
- Optional stock/API keys for better material search.
- Optional project-specific rendering scripts.

## Recommended Input Layout

Put the source video and manuscript together when possible:

```text
input-folder/
  video-name.mp4
  video-name.txt
```

The manuscript can also be named:

```text
文案.txt
稿子.txt
script.txt
manuscript.txt
```

For multi-part videos, use clear names such as:

```text
topic_part1.mp4
topic_part2.mp4
topic_part1.txt
topic_part2.txt
```

The skill requires source preflight before merging multi-part videos.

## Original User Folder Defaults

On the original Windows setup:

```text
Input:   D:\自动剪视频口播
Output:  D:\自动剪视频成片
BGM:     D:\自动剪视频BGM
Project: D:\CodecX全项目管理\P08_C02_自动剪视频_auto_video_editing
```

Other computers can use equivalent folders. The setup scripts accept custom paths.

## Safety

The skill includes setup scripts, but Codex should not silently download or install tools. It should explain what is missing, ask for permission, and only then run setup.

API keys must stay local:

```text
PEXELS_API_KEY
PIXABAY_API_KEY
UNSPLASH_ACCESS_KEY
GETTY_API_KEY
SHUTTERSTOCK_API_TOKEN
HELLORF_CLIENT_ID
HELLORF_CLIENT_SECRET
```

Do not commit `.env.local`, raw videos, BGM, downloaded stock assets, QA images, or generated outputs.
