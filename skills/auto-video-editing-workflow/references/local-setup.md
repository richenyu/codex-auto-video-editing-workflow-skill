# 本地环境配置

这个 Skill 是可迁移的。所有路径都应该视为项目配置，不要写死在某一台电脑上。

## 推荐 Windows 通用目录

如果当前电脑没有项目专用路径，默认使用用户目录下的工作区：

```text
项目根目录：
%USERPROFILE%\auto-video-editing-workflow

原始口播输入目录：
%USERPROFILE%\auto-video-editing-workflow\input

成片输出目录：
%USERPROFILE%\auto-video-editing-workflow\output

BGM 目录：
%USERPROFILE%\auto-video-editing-workflow\bgm

工具目录：
%USERPROFILE%\auto-video-editing-workflow\tools

Python 虚拟环境：
%USERPROFILE%\auto-video-editing-workflow\.venv
```

如果用户说“新口播已经放到文件夹里了”或“剪最新视频”，按输入目录的 `LastWriteTime` 选择最新视频；如果多个文件时间接近，先确认。

## 需要配置的路径

如果无法自动推断，向用户确认这些路径：

```text
原始口播输入目录：
<path-to-raw-talking-head-videos>

成片输出目录：
<path-to-final-video-exports>

BGM 目录：
<path-to-default-bgm-library>

项目代码目录：
<path-to-auto-video-editing-code>

项目记忆或工作流说明：
<path-to-video-editing-workflow-notes>
```

## 新电脑第一次启动

安装 Skill 只会给 Codex 提供工作流、规则和脚本，不会在安装瞬间静默下载软件。新 Windows 电脑上，Codex 应该：

1. 读取 `SKILL.md`、`references/workflow.md` 和本文件。
2. 运行 `scripts/check-video-workflow.ps1` 检查目录、FFmpeg、Python、项目代码和工作流文件。
3. 如果缺少工具，先说明缺什么，再请求授权运行 `scripts/setup-video-workflow.ps1`。
4. 根据需要运行安装脚本，例如：

```powershell
powershell -ExecutionPolicy Bypass -File scripts\setup-video-workflow.ps1 -DownloadFfmpeg -InstallPythonPackages -WithTranscription
```

安装脚本可以创建工作目录、下载 FFmpeg、创建 Python 虚拟环境，并安装 MoviePy、auto-editor 等核心剪辑包。网络下载和包安装必须明确说明并获得授权。

## 兼容项目脚本

如果宿主项目已经有自动剪辑实现，优先寻找：

```text
scripts/smart_talk_editor.py
scripts/add_varied_sfx.py
tools/ffmpeg/bin/ffmpeg.exe
.venv/Scripts/python.exe
```

兼容实现中常用参数：

```text
--reference-script
--reference-token-align
--visual-mode overlay
--overlay-style showcase
--base-motion
--background-blur-mode fast
--broll-every 1
--broll-layout-bias balanced|feature|full
--no-fill-overlay-assets
--allow-asset-fallback
--write-subtitles
--burn-subtitles
--bgm <path-to-music-file>
--bgm-volume <low-mix-value>
--speech-speed 1.2
```

## 财经/商业解释视频常用参数

```text
--visual-mode overlay
--overlay-style showcase
--base-motion
--background-blur-mode fast
--background-blur-sigma 10
--background-blur-dim 0.74
--broll-every 1
--broll-layout-bias feature
--max-assets-per-chunk 1
--no-fill-overlay-assets
--hook-face-duration 2.2
--broll-min-gap 1.05
--max-consecutive-broll 2
--speech-speed 1.2
```

## BGM 规则

使用用户配置的 BGM 目录里的音乐，不要假设固定默认曲目。

BGM 必须低于人声，淡入淡出；如果录音环境噪声明显，进一步降低 BGM。BGM 目录为空时，询问用户添加音乐，或者导出无 BGM 版本。

## 交付

QA 完成后，把最终 MP4 和抽帧图复制到配置的输出目录。报告、音效事件 JSON 和中间文件保留在项目输出目录中。
