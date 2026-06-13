# 发布说明：Codex自动剪视频神器

推荐 GitHub 仓库：

```text
richenyu/codex-auto-video-editing-workflow-skill
```

说明：GitHub 仓库 slug 建议继续用英文，安装更稳定；对外展示名和 README 标题使用中文名“Codex自动剪视频神器”。

## 仓库结构

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

## 同事安装提示词

```text
请从 GitHub 安装这个 skill：
richenyu/codex-auto-video-editing-workflow-skill/skills/auto-video-editing-workflow
```

## 第一次使用提示词

```text
用 $auto-video-editing-workflow 自动剪最新口播视频；如果环境缺工具，先帮我检查并安装依赖。
```

## 第一次会发生什么

```text
1. Codex 读取 Skill 主规则和参考文件
2. Codex 检查 FFmpeg、Python、MoviePy、auto-editor、输入输出目录
3. 如果缺工具，Codex 说明缺什么
4. 用户授权后，Codex 才运行 setup-video-workflow.ps1
5. 依赖准备好后，再按底层逻辑自动剪视频
```

## 安全说明

Skill 不应该在安装瞬间静默下载软件。下载 FFmpeg、安装 Python 包、创建本地工具目录，都需要 Codex 说明并获得用户授权。

## 备注

这个仓库提供的是“可安装 Skill + 工作流规则 + 检查/安装脚本”。如果要让同事电脑剪出和原机器几乎一样的效果，还需要同步核心剪辑代码、BGM、字体、素材库、模型/转写配置。
