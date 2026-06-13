# Codex自动剪视频神器

这是一个可安装到 Codex 的自动剪视频 Skill，用来把口播、讲解、财经/商业/技术类短视频自动剪成更适合发布的竖屏成片。

## 它能做什么

这个 Skill 会让 Codex 按一套固定工作流剪视频：

- 先清理口播：停顿、重复、重说、废话、错误片段、弱信息片段
- 口播清理完成后，默认把语速调成 `1.2x`，并保持音调正常
- 自动规划大块资料镜头，避免贴脸小标签、小贴纸、小药丸字卡
- 资料镜头优先做成动态卡片、真实 cutaway、网页/产品/图表/截图/视频化素材
- 需要时可以 1/2/3 个资料同屏，但必须大块、美观、有主次
- 默认添加清晰字幕、轻快 BGM、轻量音效
- 默认导出竖屏 `1080x1920` MP4
- 导出前做规则审计、抽帧检查、音量检查、解码检查
- 第一次使用时可以检查并引导安装 FFmpeg、MoviePy、auto-editor 等剪辑依赖

## 安装方式

让同事在 Codex 里输入：

```text
请从 GitHub 安装这个 skill：
richenyu/codex-auto-video-editing-workflow-skill/skills/auto-video-editing-workflow
```

如果仓库是私有的，先给同事开 GitHub 访问权限。

## 第一次使用

安装后，让同事在 Codex 里输入：

```text
用 $auto-video-editing-workflow 自动剪最新口播视频；如果环境缺工具，先帮我检查并安装依赖。
```

第一次运行时，Codex 会先检查本机环境：

```text
scripts/check-video-workflow.ps1
```

如果缺少依赖，Codex 会先说明缺什么，再请求授权运行：

```text
scripts/setup-video-workflow.ps1
```

这个安装脚本可以创建工作目录、下载 FFmpeg、创建 Python 虚拟环境，并安装 MoviePy、auto-editor 等依赖。它不会在没有说明和授权的情况下偷偷下载软件。

## 重要边界

这个 Skill 保存的是“剪辑工作流、审美规则、QA 规则、环境检查脚本和安装脚本”，它本身不是完整剪辑软件。

要在同事电脑上做到一句话自动成片，还需要：

- 一个口播原视频输入文件夹
- 一个成片输出文件夹
- FFmpeg
- Python 和相关剪辑包
- 兼容的剪辑脚本或自动剪辑工程
- 可选的 BGM、字体、素材库、转写模型配置

这些配置好之后，以后就可以直接说：

```text
用 $auto-video-editing-workflow 自动剪最新视频。
```

## Skill 位置

```text
skills/auto-video-editing-workflow
```

## 对外名称

对外可以直接叫：

```text
Codex自动剪视频神器
```
