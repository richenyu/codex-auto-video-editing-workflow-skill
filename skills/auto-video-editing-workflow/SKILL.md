---
name: auto-video-editing-workflow
description: Automatic short-form video and talking-head editing workflow. Use when Codex is asked to edit raw talking-head footage, cut the latest recorded video, apply a saved video-editing workflow or 底层逻辑, process 自动剪视频/口播 footage, remove pauses and repeated speech, build finance/tech/business explainer videos, match B-roll and large dynamic materials, add captions, add light upbeat BGM, add light SFX, export 4:3/16:9/9:16 versions, or run source/material/caption QA. Also use this in new windows when the user says the new oral video is already in the folder and wants the saved workflow applied.
---

# Auto Video Editing Workflow

Use this skill to turn raw talking-head footage, a manuscript, or a topic brief into a polished short-form explainer video.

## New Window Contract

If the user says any of the following, immediately use this workflow instead of asking them to retrain the rules:

```text
自动剪视频 / 口播视频 / 最新口播 / 新视频放到文件夹了
按之前底层逻辑剪 / 按工作流剪 / 按训练好的规则剪
剪成片 / 加字幕 BGM 音效 / 财经 商业 技术 解释视频
```

For this user's Windows setup, first try the local P08 workflow paths from `references/local-setup.md`. Also read these project memories when available:

```text
D:\CodecX全项目管理\P08_C02_自动剪视频_auto_video_editing\04_新窗口上下文_context_pack.md
D:\CodecX全项目管理\P08_C02_自动剪视频_auto_video_editing\08_短视频自动剪辑底层逻辑_video_editing_logic.md
D:\CodecX全项目管理\P08_C02_自动剪视频_auto_video_editing\07_核心资产索引_asset_index.md
```

If the current project is unrelated but the task is video auto-editing, route back to P08 and this skill.

## Core Rule

Rules are cumulative. A new user correction is an addition to the active rule stack, not permission to forget older locked rules. Only remove or downgrade an older rule when the user explicitly cancels that specific rule.

Do the work in this order:

```text
1. Understand the topic, audience, and story.
2. Clean the speech first: repeated lines, restarts, wrong takes, dead air, weak fragments.
3. Build a smooth spoken timeline before adding visuals.
4. Apply the user's default talking-head tempo: 1.2x speech speed after cleanup, with pitch preserved.
5. Match or generate materials only after the sped-up clean timeline exists.
6. Select materials with two equal gates: visual beauty and script relevance.
7. Use varied visual layouts: face, overlay, feature, full.
8. Add only light, varied SFX by default.
9. Add clear captions and light upbeat BGM by default for final publishable exports.
10. Export a clean no-caption/no-BGM variant only when requested or useful for handoff.
11. Run non-regression QA so new style choices did not erase older locked rules.
12. QA the result before delivery.
```

Never use materials, motion, or sound effects to hide a broken speech timeline.

## Hard Rules From User Training

Treat these as QA failure conditions, not soft preferences:

- Clean speech first; do not use visuals to cover repeated, wrong, or weak speech.
- Default talking-head speed is `1.2x` for this user's oral videos. Apply it after speech cleanup and before captions, B-roll timing, final mixing, and QA. Preserve pitch with audio tempo processing; do not chipmunk the voice. Only override when the user explicitly asks for normal speed or another multiplier.
- Formal publish exports default to burned captions, low-volume upbeat BGM, and light varied SFX unless the user asks otherwise.
- Material must pass both gates: beautiful and sentence-matched.
- Material match must be sentence-level, not broad-topic. If the current sentence says a camera becomes an AI report, do not insert a generic AI/business scene unless it directly shows that idea.
- A material asset must not repeat later in the same finished video. Reusing the same source image, clip, screenshot, generated scene, or template instance is a QA failure.
- Material moments must be dynamic. Prefer real video/GIF/screen recording; if the source is a still image, animate it into a visible video-like clip instead of holding a static picture.
- No tiny pill labels, stickers, or floating text chips on or near the speaker's face. They are not acceptable "small effects."
- Use large, polished, readable material shots. Prefer video-like materials, animation, GIF-like clips, UI walkthroughs, webpage scrolls, chart motion, cursor movement, push-ins, highlights, or real footage over static cards.
- Large material shots may show 1, 2, or occasionally 3 materials at once when useful. Multi-material layouts must have hierarchy, stay readable, and remain large; never turn into small sticker clutter.
- For a 2-minute business, finance, or technical explainer, plan roughly 5-7 real or video-like full-screen cutaways, with 6 as the normal target. `full_card`, pure chart cards, and opinion slides do not count as `full_broll`.
- Before final delivery, create a rule audit and contact sheet. If the audit fails, revise and re-run QA.

## Reference Loading

Load only the references needed for the current request:

- For any real edit: read `references/workflow.md`.
- For visual, material, and SFX decisions: read `references/style-rules.md`.
- For the latest locked bottom logic, aspect defaults, material-source rules, caption alignment, and source-preflight accident fixes: read `references/bottom-logic.md`.
- For finance, stock market, macro, or business explainer videos: read `references/finance-explainer.md`.
- For local project paths, commands, setup/bootstrap behavior, and handoff conventions: read `references/local-setup.md`.
- For every formal edit after user training changes: read `references/non-regression-checklist.md`.
- For this user's P08 project, also read the latest P08 `04`, `08`, and `07` files listed in "New Window Contract" when available.

## Default Behavior

- Current default video format: 4:3, 1440x1080, stable 30fps MP4, unless the user explicitly asks for vertical 9:16, landscape 16:9, source aspect, or a platform-specific format.
- Default subtitles: burn clear, readable captions into the final publishable MP4 unless the user asks for a no-caption version.
- Default manuscript lookup: if the input folder contains a `.txt`, `.md`, `.docx`, or `.srt` manuscript with the same base name as the source video, or a clearly latest manuscript named `文案`, `script`, `稿子`, or `manuscript`, use that manuscript as the preferred caption text and cleanup reference.
- Default speech speed: `1.2x` for oral/talking-head videos after the clean timeline is built; all captions, cutaways, card timings, BGM/SFX, report durations, and QA should use the accelerated timeline.
- Default music: add a low-volume, light, upbeat, lyric-free BGM bed unless the user asks for a no-BGM version.
- Default sound: light varied SFX only, mixed below voice.
- Default talking-head look: subtle background blur or dim while keeping face, eyes, and mouth clear.

If local paths or project scripts are missing, ask for equivalent input, output, and project directories.

## Editing Workflow

1. Locate the intended source video. If the user says "latest", sort the configured input folder by modification time and confirm the chosen file if there is ambiguity.
2. For multi-part inputs such as `1/2`, `上/下`, or `part1/part2`, run a source preflight before editing: verify the exact filenames, hashes, durations, first/last frames, and opening/ending transcript snippets. File names alone are not enough. If any part appears to be a different topic or wrong take, stop and report the mismatch instead of producing a mixed video.
3. Transcribe with pause-aware or word-level timestamps.
4. Normalize obvious ASR errors before judging repetition, especially finance terms, company names, stock symbols, and homophones.
5. Perform manuscript-level review before cutting:
   - remove repeated points,
   - remove half-sentence starts before complete sentences,
   - trim in-segment restarts,
   - preserve structural markers such as "first", "second", "third", and "finally".
6. If a user provides a formal script, use it as the preferred caption text and manuscript-cleanup reference. ASR is used mainly for timestamps and detecting where the speaker actually said each sentence. Do not blindly burn raw ASR text when a manuscript exists.
7. Speed the clean talking-head timeline to `1.2x` by default, preserving pitch; recalculate the edited duration and all downstream timing from this sped-up timeline.
8. Generate or select topic-specific B-roll after the sped-up clean timeline exists.
9. Render varied layouts:
   - `face` for trust, emotion, transitions, and breathing room;
   - `overlay` for light supporting information;
   - `feature` for large material shots;
   - `full_card` for occasional full-screen charts, frameworks, or opinion cards;
   - `full_broll` / `cutaway` for full-screen real materials such as photos, GIFs, footage, webpages, products, buildings, maps, or scene shots.
10. Add varied SFX at material entrances, transitions, and emphasis points.
11. Add captions from the sped-up cleaned speech timeline, then mix low-volume BGM below the voice.
12. Re-encode the final output to stable 30fps.
13. QA with media parameters, full decode, volume check, caption readability, contact sheet, layout distribution, BGM level, speech speed, and SFX event review.

## Material Principle

Materials must match the sentence currently being spoken and must look good. If no strong, good-looking material exists, keep the face shot or generate a clean designed visual rather than inserting ugly, blurry, watermarked, or unrelated visuals.

Visual material quality and script relevance are equal requirements:

- Relevance gate: the material must connect directly to the sentence, example, company, product, place, market, analogy, or claim being spoken.
- Beauty gate: the material must be clear, high-resolution enough for the target canvas, well-framed, clean, modern, and pleasant at phone size.
- Reject low-quality materials even if they are relevant: blurry screenshots, cluttered pages, random stock-looking scenes, ugly crops, distracting watermarks, messy UI, tiny unreadable text, or images that feel cheap.
- Reject beautiful materials if they are off-topic. Aesthetic polish cannot compensate for wrong meaning.
- When choosing among several relevant materials, pick the one with the strongest combined score for beauty, clarity, and semantic match.

## Local Material Pack Gate

Local visual material packs are candidate libraries, not mandatory sources. Do not force a weak local material pack into a video just because it already exists.

Hard rules:

```text
1. Before using a local material pack, inspect whether its assets truly match the current script and look good enough for a publishable video.
2. If the local pack is PPT-like, template-like, weakly related, ugly, low-resolution, visually repetitive, or from the wrong topic, reject it instead of forcing it into the edit.
3. Rejected local pack assets must not count toward real/quality cutaway targets.
4. When local assets fail, actively search or create better material: licensed stock video, official/public product footage, official webpages, real screen recordings, user-provided footage, or AI-generated video.
5. The material source priority is: sentence-matched and beautiful external/official/stock/recorded material first, then good local assets, then generated cinematic assets, and only last resort clean information cards.
6. Never use one resource pool as a hard constraint. A single poor pack cannot define the visual quality of the final video.
7. If network/API access or account credentials are needed to fetch better stock materials and are not available, mark the output as a test/fallback version rather than pretending the local pack is sufficient.
```

QA must record whether local material packs were accepted, partially accepted, or rejected, and why. A video that relies mostly on rejected-quality local pack assets is not a mature deliverable.

For finance and business explainers, do not turn the whole video into animated slide cards. Mix talking head, short video-like materials, screenshots, charts, photos, animated explainers, full-screen real cutaways, and a small number of cards. A cutaway may fully cover the speaker while the speaker's voice continues.

For standard finance, business, or technical explainers, aim for about 3 real full-screen cutaways per minute when enough relevant material exists. A 2-minute video should usually have 5-7 real full-screen cutaways, with 6 as the normal target. Slide cards and chart cards do not count toward this target.

## Utility Script

Run `scripts/check-video-workflow.ps1` to inspect whether configured local folders, project code, and key scripts exist on the current Windows machine.

On a new Windows computer, if required tools are missing, ask the user for permission before running `scripts/setup-video-workflow.ps1`. The setup script can create working folders, download FFmpeg, create a Python virtual environment, and install the core editing packages such as MoviePy and auto-editor. Skills should not silently download or install software; Codex should explain what is missing, request approval for network/system changes, then run the setup script.

## 2026-06-14 追加更新：图片动效不能冒充真实视频素材

用户反馈：上一版 CoramAI 成片虽然做到了素材不重复、句子匹配和动态化，但很多插入素材本质仍是生成图片加推拉/扫光，观感像“图片穿插”，不像成熟财经/商业博主那种自然的视频 B-roll。该反馈成立，后续规则必须升级。

核心判断：
```text
图片做运动 = 兜底视频化素材，不等于真实视频素材。
真实视频素材 = 有真实时间流动、真实动作、镜头变化、网页/软件操作、人物/车辆/设备运动、屏幕滚动、数据动态变化、短视频片段或 GIF 感连续动作。
```

新的素材优先级：
```text
S 级：用户自有实拍视频、口播配套录屏、产品/网页/软件真实录屏、官方公开视频片段、可授权 stock video、AI 生成短视频。
A 级：真实网页滚动、GitHub/官网/公告页录屏、行情图/数据图动态绘制、鼠标移动和高亮的操作录屏。
B 级：高质量照片/生成图做明显镜头运动、景深、局部放大、视差、数据层动画，只能作为兜底。
C 级：静态图、PPT 卡、纯文字卡，不能计入真实视频 cutaway。
```

硬规则：
```text
1. 正式成片的 full_broll / real_cutaway 默认必须优先使用 S/A 级真实视频、录屏、GIF 或 AI 短视频。
2. B 级图片动效只能作为补位，不能成为整条视频主要插入形式。
3. 2 分钟左右视频里，如果规划 5-7 个全屏 cutaway，至少 60% 应为 S/A 级真实视频类素材；图片动效不得超过 40%。
4. 如果没有足够真实视频素材，必须提前标注“素材不足，当前只能做图片动效兜底版”，不能把它当成最终成熟版交付。
5. 规则审计要区分：real_video_cutaway_count、screen_recording_cutaway_count、ai_video_cutaway_count、animated_still_cutaway_count、static_card_count。
6. animated_still_cutaway_count 过高时 QA 失败或降级为试剪版，不再标记为优质成片。
7. 图片动效可用于补充抽象概念，但公司、产品、场景、案例、流程、软件、网页、交易/财经主题，应优先找真实视频或录屏。
```

后续执行方案：
```text
1. 先按文案拆分素材需求。
2. 对每个素材点先找/录 S/A 级视频素材：官网录屏、产品页滚动、行情图动态绘制、真实场景 stock video、用户提供素材。
3. 找不到再生成 AI 短视频；仍找不到才使用高质量图片动效。
4. 不允许整条片子大部分由生成图推拉构成。
5. QA 抽帧之外要抽查连续播放片段，确认插入镜头有真实运动，不只是照片移动。
```

本条规则新增，不覆盖旧规则。旧规则“素材必须美观、匹配、不重复、动态化、50/50 真人/素材、禁止小贴纸、字幕/BGM/SFX、口播先清理”全部继续保留。

## 2026-06-14 追加更新：中文优先与电影感真实素材运动

用户反馈：上一版“录屏动态素材版”虽然解决了图片推拉问题，但出现大量英文 UI/英文标签，且整体又变成动态 PPT/仪表盘堆叠，不符合目标风格。用户真正想要的是：以中文为主，素材像真实照片、电影感场景、真实视频或 AI 视频片段，运动也不能只是轻微推拉，而要有更自然的镜头运动和场景运动。

硬规则：
```text
1. 成片默认中文优先。除品牌名、股票代码、真实官网/软件原文、必要技术名词外，画面文字、标签、提示、说明、报告标题一律用中文。
2. 禁止在自制素材里大面积出现英文假 UI、英文假报表、英文假仪表盘。英文过多视为 QA 失败。
3. 禁止把“动态 UI 面板、数据仪表盘、流程卡片”当成主要视觉方向；这种形式只能少量用于确实需要解释数据/流程的句子。
4. 不要再把整条视频做成 PPT、仪表盘、软件界面轮播、卡片堆叠。即使每一帧都在动，只要观感像 PPT，也判定失败。
5. 主素材方向改为：真实照片感、电影感、纪录片感、真实场景感、AI 视频感、stock footage 感、官网/产品真实录屏感。
6. “电影感照片的动”不能只是轻微推拉。必须至少具备一种明显视频感：前后景分离、视差运动、镜头横移/推进/环绕、景深变化、光影变化、粒子/烟雾/屏幕反光、人物/车辆/设备/数据元素运动、动态遮挡或转场。
7. 静态生成图只允许作为源素材。最终出现在视频里时，必须做成强视频化片段；如果只有轻微 zoom/pan，不能算优质 cutaway。
8. 真实视频/AI 短视频/授权素材/真实录屏优先级高于自制动态图。自制动态图只能作为兜底或补充。
9. 抽帧 QA 之外，必须抽查连续播放片段，判断它是否像真实视频/电影感动图，而不是像一张图被拖动。
```

素材优先级更新：
```text
S 级：真实实拍视频、授权 stock video、AI 生成短视频、官方公开视频、用户提供的真实场景视频。
A 级：真实网页/产品/软件录屏，真实行情/图表动态录制，真实官网滚动、鼠标操作、高亮演示。
B 级：电影感真实照片/生成图 + 强 2.5D/视差/景深/光影/粒子/前后景运动，必须明显不像静态图片。
C 级：普通图片推拉、仪表盘动效、PPT 卡片、流程卡、假 UI，只能少量辅助，不得作为主素材。
```

QA 新增字段：
```text
chinese_first_pass
english_fake_ui_violation_count
ppt_dashboard_violation_count
cinematic_photo_motion_count
strong_motion_cutaway_count
weak_pan_zoom_only_count
real_or_ai_video_cutaway_count
stock_or_screen_recording_count
```

执行建议：
```text
1. 先按文案列素材需求，再为每个素材点判断是否能找到 S/A 级真实视频或录屏。
2. 找不到 S/A 级时，再生成电影感照片，并用强 2.5D/AI 视频工具做成短片段。
3. 不要为了“信息量”堆英文 UI 和仪表盘。宁愿少字、中文大字、真实场景画面更高级。
4. 对商业/财经/AI 创业口播，优先用真实公司场景、城市、办公楼、设备、门店、仓库、人物背影、交易屏、服务器、车辆、客户现场等电影感素材。
5. 若当前工具无法生成真实视频，只能导出“过渡测试版”，不能标为成熟优质成片。
```

本条规则新增，不覆盖旧规则。旧规则“口播先清理、1.2 倍语速、字幕/BGM/SFX、素材美观且匹配、不重复、50/50 真人/素材、禁止小贴纸、真实视频优先、规则审计和 QA”全部继续保留。

## 2026-06-14 Addendum: MP4 Format Is Not Enough

A file being `.mp4`, `.gif`, or video-like is not enough to count as a qualified real-video cutaway. Some generated/local MP4s are only animated slide cards, fake dashboards, UI templates, or PPT-style loops. These must be classified as C-grade material and must not be counted as `real_video_cutaway`.

Hard rules:

```text
1. Judge real-video material by continuous playback, not by file extension.
2. A qualified real-video cutaway must show real scene motion, real camera motion, real people/vehicle/device movement, real screen recording, true webpage/software operation, stock footage, official footage, or AI-generated video with visible temporal change.
3. Animated PPT cards, fake UI dashboards, template loops, and chart-card videos remain C-grade even if exported as MP4.
4. If local videos fail the visual gate, search/download licensed stock footage, use official/public product footage, record a real webpage/software demo, or generate AI video. Otherwise label the export as a fallback/test cut.
5. QA must include both a source-material contact sheet and a final-output contact sheet.
6. Audit must distinguish stock_video_cutaway_count, source_mp4_but_ppt_like_count, format_is_mp4_but_rejected_count, and real_video_visual_gate_pass.
```

This addendum preserves all previous locked rules: clean speech first, 1.2x speed, Chinese-first visuals, no repeated assets, no tiny stickers, beautiful plus sentence-matched materials, captions/BGM/SFX by default, and final QA.

## 2026-06-14 追加更新：强匹配混合素材与真实视频后期规则

用户反馈：上一版真实视频素材虽然解决了“图片不是真视频”的问题，但部分 stock footage 与当前句子弱相关，且真实视频上叠加进度线/扫光线会显得多余；同时之前训练过的中大号中文小卡片不能丢。

硬规则新增：

```text
1. 素材选择优先级改为：句子级匹配度第一，美观第二，最后才是形式比例。真实视频如果只是泛场景、弱相关、看起来无关，宁愿不用，改用更匹配的电影感强运动素材或重新找素材。
2. 真实视频 cutaway 必须通过“强匹配门槛”：画面主体、场景、动作或业务关系要直接对应当前口播句子。泛办公室、泛仓库、泛学校、泛门店不能自动判定合格。
3. 2 分钟左右商业/技术/财经解释视频，素材层默认采用近似 50/50 混合：约一半强匹配真实视频/录屏/stock/AI 视频，约一半电影感强运动图/动图/视频化素材。这个比例是目标，不得牺牲匹配度硬凑。
4. 如果真实视频匹配度不足，优先替换为电影感强运动素材；不要为了“真实视频占比”插入无关视频。
5. 真实视频本身已经有运动，不需要再加横向进度线、扫描线、扫光条来证明它在动。真实视频镜头只做调色、裁切、淡入淡出、轻标题/必要中文信息。
6. 中大号中文小卡片继续保留，用于强调观点、转折、风险、结论和行动建议；但必须放在安全区，不能贴脸、不能贴嘴、不能变成小贴纸。
7. 电影感强运动素材仍可使用，但必须有明显视频感：视差、光影、景深、前后景、粒子、镜头推进/横移/遮挡等；不能只是轻微 pan/zoom。
8. 同一成片内素材源继续严禁重复。即使是同一主题，也要换源、换场景、换角度或换镜头语言。
```

QA / 审计新增字段：

```text
strong_match_stock_video_count
cinematic_strong_motion_count
hybrid_stock_to_cinematic_ratio_by_count
weak_related_stock_used_count
weak_related_stock_rejected
true_video_progress_line_removed
true_video_sweep_line_removed
```

本轮 CoramAI 测试目标版本：

```text
输出：D:\自动剪视频成片\2026-06-14_CoramAI摄像头_AI安防报告_强匹配混合版_字幕BGM_1p2倍语速.mp4
干净版：D:\自动剪视频成片\2026-06-14_CoramAI摄像头_AI安防报告_强匹配混合版_干净版_1p2倍语速.mp4
审计结果：8 段强匹配真实视频 + 8 段电影感强运动；素材主导 53%，真人 47%；重复素材 0；弱相关 stock 使用 0；真实视频进度线/扫线已移除。
```

本条规则只新增，不覆盖旧规则。旧规则“口播先清理、1.2 倍语速、字幕/BGM/SFX、中文优先、素材美观且匹配、不重复、禁止贴脸小贴纸、真实视频优先、QA 抽帧与规则审计”全部继续保留。

## 2026-06-14 追加更新：正规素材站检索与授权记录规则

用户提出：为了提升素材与文案的匹配度，后续不要只依赖自生成图片/视频，也要优先去正规素材站寻找高质量视频、照片、动图、音效和可授权素材。

硬规则新增：

```text
1. 素材优先级新增“正规素材站检索”步骤：先根据文案拆成关键词，再去授权明确的素材源搜索，再按句子级匹配度、美观度、可商用风险排序。
2. 素材站素材不能盲用。每个下载素材必须记录：来源网站、素材页面 URL、作者/上传者、许可证页面 URL、下载时间、搜索关键词、匹配到的文案句子、是否需要署名、是否包含人物/商标/品牌/地标/私人场所风险。
3. 真实视频素材只在强匹配时使用。即使来自正规素材站，只要与当前文案弱相关，也不能硬插入成片。
4. 优先使用可商用、可修改、署名要求低或可控的素材；需要署名的素材必须在审计文件中标出，必要时在视频简介/素材表中留出处。
5. 含明显品牌 Logo、商标、名人脸、私人场所、敏感场景的素材，需要降级或弃用；不能暗示素材中的人物或品牌为视频观点背书。
6. 如果免费素材无法强匹配，才进入 AI 生成视频/电影感强运动图兜底；不要为了省事直接生成一堆泛图。
7. 每条成片 QA 必须包含素材来源表和授权风险字段。未记录来源的外部素材不能进入正式成片。
```

推荐素材源分层：

```text
S 级：用户自有实拍、官方公开视频/官网素材、产品实录、自己录屏。
A 级：Pexels、Pixabay、Mixkit、Coverr、Unsplash 图片、Wikimedia Commons、NASA/政府公开媒体、公司官方 press/media kit。
B 级：Videvo、Storyblocks、Envato Elements、Motion Array、Artgrid、Shutterstock、Adobe Stock 等需要逐条确认授权或付费订阅的素材库。
C 级：来源不明搬运号、别人短视频截取、带水印素材、二创混剪素材、无法确认授权的社媒素材。正式成片禁用。
```

自动检索流程：

```text
1. 文案拆分为 8-16 个素材需求点。
2. 每个需求点生成中文关键词和英文关键词，例如“AI 安防 摄像头 异常检测 / AI security camera monitoring anomaly detection”。
3. 先查官方/自有素材，再查 Pexels/Pixabay/Mixkit/Coverr/Unsplash/Wikimedia Commons。
4. 下载前做三项评分：句子匹配度、视觉美感、授权风险。
5. 只保留高匹配高美感低风险素材；弱相关素材不得因为是真视频而进入成片。
6. 下载后保存到项目资产库，并生成素材来源 JSON/CSV。
7. 渲染审计中写入每个素材的 source_url、license_url、author、attribution_required、commercial_use_risk、script_match_score、beauty_score。
```

本条规则只新增，不覆盖旧规则。旧规则“口播先清理、1.2 倍语速、字幕/BGM/SFX、中文优先、素材美观且匹配、不重复、禁止贴脸小贴纸、真实视频优先、50/50 强匹配混合素材、真实视频不加进度线/扫线、QA 抽帧与规则审计”全部继续保留。

## 2026-06-15 Addendum: Visual Pack First And Visual-Similarity Deduplication

User feedback: the finished boss/employee training edit still looked like repeated materials, even when file paths were technically unique. The issue is not mainly unclear speech. It is a workflow problem: material selection was driven by a small generic stock pool and repeated generated visual templates, so the video had repeated visual language and weak sentence-level relevance.

Hard rules:

```text
1. Do not treat unique file paths as enough. A clip can be a QA failure if it feels visually repeated: same template, same palette, same card layout, same camera angle, same stock scene type, or same generated motion language.
2. Audit must distinguish file_duplication from visual_similarity_duplication. Both must pass.
3. For business/finance/AI explainers, prefer building a dedicated visual material pack before final editing. The pack must be generated from the manuscript or cleaned transcript, not from broad topic keywords only.
4. The visual pack must contain a shot table: shot_id, matched_sentence, material_need, accepted_asset, asset_type, source/license, match_score, beauty_score, visual_fingerprint, and rejection notes.
5. The editor may only pull from accepted visual-pack assets or newly reviewed candidates. It must not randomly reuse a weak local pack just because it exists.
6. If a script segment cannot get a high-match asset, keep the face shot, use a strong custom cinematic visual, or mark the edit as a fallback. Do not insert generic office/warehouse/AI stock footage.
7. The default match gate for important cutaways is high: match_score >= 0.88 and beauty_score >= 0.85. Anything below requires manual justification in the audit.
8. No generated visual template may appear more than twice in one video unless the camera language, palette, layout, and subject change clearly enough that it does not feel repeated.
9. For each video, create a material event QA sheet at event midpoints, not only evenly-spaced final contact sheets. The event QA sheet is the main check for repeated or weak materials.
10. If the user provides the exact manuscript, use it to build the visual pack. If only raw speech exists, use ASR only to draft the pack, then be stricter because ASR can blur the actual meaning.
```

Preferred workflow:

```text
1. Clean speech and/or align manuscript.
2. Split the manuscript into 8-18 visual beats.
3. Build or fetch a dedicated visual material pack for those beats.
4. QA the pack before editing: reject weak, ugly, off-topic, visually repeated, or low-motion assets.
5. Render the video only from accepted assets plus face shots.
6. Run final QA: source/event contact sheet, visual similarity check, file duplication check, match/beauty scores, decode pass.
```

This addendum preserves all previous locked rules: speech cleanup first, 1.2x speed, captions/BGM/SFX by default, Chinese-first visuals, strong match before beauty, no repeated assets, no tiny face stickers, real video priority, no military/police/conflict mismatches, and final QA/audit.

## 2026-06-15 Addendum: Caption And Script Timing Must Be Re-Aligned After Cleanup

User feedback: captions/manuscript often do not match the spoken voice; sometimes captions appear too fast, sometimes too slow. This is a timeline alignment failure, not just a speech clarity problem.

Hard rules:

```text
1. Never reuse raw ASR chunk timings after speech cleanup, cuts, or 1.2x speed changes.
2. Captions must be regenerated or force-aligned against the final cleaned and sped-up speech audio.
3. If the user provides a manuscript, use the manuscript as text truth, but still align it to the final audio timestamps. Do not place manuscript sentences by equal duration or old ASR chunks.
4. B-roll/material events must bind to aligned sentence timestamps, not hard-coded old seconds. If caption timings change, material timings must move with them.
5. Important visual beats should start within +/-0.25s of the sentence they illustrate, unless intentionally used as a preview or callback and marked in audit.
6. Caption blocks should be short enough to read: prefer 8-18 Chinese characters per line, 1-2 lines, target 7-11 Chinese characters per second, min duration 0.85s, max duration 3.2s.
7. If one spoken sentence is too long, split it into smaller caption events at natural pauses. If a fragment is too short, merge it with the neighboring phrase unless it is an intentional emphasis.
8. Do not let captions lag behind the voice by more than 0.25s or lead the voice by more than 0.15s in normal speech sections.
9. Dense finance/business/technical segments may keep the user's default 1.2x audio speed, but captions must be split and paced so they do not feel rushed. If the spoken section itself becomes unintelligible at 1.2x, locally reduce that segment to 1.10-1.15x and document it.
10. Every formal export must create a subtitle_alignment_report.json or equivalent audit fields: source_text_type, alignment_method, average_drift, max_drift, fast_caption_count, slow_caption_count, cps_violation_count, and sampled_caption_checks.
```

Preferred alignment workflow:

```text
1. Clean speech and remove repeated/wrong takes.
2. Apply speed change and render final clean voice track.
3. Run word-level ASR or forced alignment on the final clean voice track.
4. Normalize ASR errors using manuscript/term dictionary.
5. Segment captions from aligned words or aligned manuscript sentences.
6. Rebuild material event timing from the aligned sentence table.
7. QA caption speed and sync before final mux.
```

This addendum preserves all previous locked rules and adds timing alignment as a QA failure condition.

## 2026-06-15 Addendum: Dynamic Info Overlays During Talking-Head Segments

User feedback: after increasing real/cinematic materials, the earlier PPT-like dynamic info overlays disappeared. The user does want more of those animated information cards, especially during talking-head sections, as long as the whole video does not become a PPT slideshow.

Important distinction:

```text
Full-video PPT slideshow = bad.
Large/medium dynamic info overlays during face shots = good when matched, varied, and polished.
```

Hard rules:

```text
1. Do not remove dynamic PPT-style/info-card overlays entirely. They are part of the desired visual language.
2. Overall video should still target roughly 50/50 between material-led moments and visible speaker moments, but visible speaker moments should not be visually empty.
3. During visible speaker/talking-head time, about 60% should include supporting dynamic overlays when the content benefits from it.
4. Overlay types may include: key-number cards, process steps, comparison chips, quote cards, mini flowcharts, checklist cards, warning cards, before/after cards, timeline cards, or 1-3 related material thumbnails.
5. Overlays must be medium or large, readable, and placed in safe zones. They must not cover the speaker's face, eyes, mouth, or important gestures.
6. Overlays are not tiny stickers. Avoid small floating labels, pill clutter, repeated icons, or decorative micro-tags near the speaker.
7. Overlay text must be Chinese-first, short, and directly tied to the current sentence. Do not add generic labels just to make the screen busy.
8. Overlay animation should vary: slide-in, scale-in, vertical stack reveal, progress highlight, number count-up, soft parallax, card swap, or subtle glow. Do not repeat the same entrance/motion every time.
9. No single overlay template, color palette, or layout may dominate the whole video. Vary size, position, number of cards, and motion.
10. Full-screen real/cinematic cutaways and face-with-overlay moments should alternate naturally. Do not let either mode disappear.
11. QA must report: face_clean_ratio, face_with_overlay_ratio, full_material_ratio, dynamic_overlay_count, overlay_face_overlap_violation_count, overlay_template_reuse_count, and overlay_readability_pass.
```

Preferred timing guideline:

```text
For a 2-minute explainer:
- 5-7 major full-screen / material-led cutaways.
- 8-14 dynamic info-overlay moments during talking-head sections.
- Speaker-only clean breathing room remains, but should feel intentional rather than empty.
```

This addendum preserves earlier locked rules: do not turn the whole video into PPT, keep real/cinematic materials, no tiny face stickers, no visual repetition, match the current sentence, and run event-level QA.

## 2026-06-15 追加更新：用户指定 16:9 时使用横屏素材与横屏素材站检索

用户确认：当前要拍的视频是 `16:9`。当用户明确说视频是 16:9、横屏、YouTube 横版、课程/访谈/横屏成片时，本 workflow 必须覆盖默认竖屏参数，按横屏执行。

Hard rules:

```text
1. Target format for explicitly 16:9 projects: landscape 16:9, prefer 1920x1080, stable 30fps MP4.
2. Do not reuse old vertical 9:16 / 1080x1920 visual package scripts for a 16:9 project without changing canvas, crop, QA, and stock search orientation.
3. Stock/material API search must request landscape candidates first. Use:
   python C:\Users\进步\Documents\自动前视频\scripts\stock_material_api.py search --kind video --orientation landscape ...
4. Pexels/Pixabay API candidates are only a candidate pool. Downloaded assets still require source_manifest.json and manual visual QA before timeline use.
5. If PEXELS_API_KEY / PIXABAY_API_KEY are missing, report missing_key and use public web/manual download, official materials, recordings, or AI-video fallback with source records. Do not claim API materials were downloaded.
6. 16:9 QA must check 1920x1080/16:9, decode pass, source/License manifest, sentence match, beauty, no duplicate assets, no wrong military/police/war/conflict material, and no PPT/fake-UI material posing as real video.
```

Vertical 9:16 remains valid when the user explicitly asks for vertical short video; explicit 16:9 requests take priority for that job; otherwise the current default is the later 4:3 final-output rule.

## 2026-06-15 Addendum: Current Visual Materials Default To 4:3

User updated the material package target: subsequent visual material search and package generation should use 4:3 materials, including video materials. The selection priority remains sentence match first, visual beauty second, and aspect fit/conversion third.

Hard rules:

```text
1. Current visual material target: 4:3, prefer 1440x1080, stable 30fps for MP4.
2. Do not choose a weakly related native 4:3 asset over a strong, beautiful 16:9 asset. Use the strong asset and center-crop/normalize it to 4:3.
3. Stock/material API search should use:
   python D:\CodecX全项目管理\P08_C02_自动剪视频_auto_video_editing\50_代码_code\auto_talk_cut_mvp\scripts\stock_material_api.py search --kind video --orientation auto --aspect 4:3 ...
4. Downloaded accepted candidates are normalized to 4:3 by default when ffmpeg is available:
   normalized_4x3\*_4x3_1440x1080.mp4
   normalized_4x3\*_4x3_1440x1080.jpg
5. The original source file must still be kept and recorded in source_manifest.json together with normalized_local_path.
6. QA must check 1440x1080 / 4:3, decode pass, source/license manifest, sentence match, beauty, no duplicate assets, and no wrong military/police/war/conflict material.
```

This addendum supersedes the previous current-project 16:9 target for P10/P11 visual material packages, unless the user explicitly switches back to 16:9 or 9:16.

## 2026-06-15 Addendum: Final Output Also Uses 4:3

User clarified that the final rendered video should also use 4:3. Source materials may be horizontal, native 4:3, or vertical/portrait. Do not reject a strong vertical material just because it is not already 4:3.

Hard rules:

```text
1. Current final video target: 4:3, prefer 1440x1080, stable 30fps MP4.
2. Current visual package target: 4:3, same 1440x1080 / 30fps standard.
3. For 4:3 material search, `--orientation auto` means source orientation `any`: horizontal, vertical, and native 4:3 are all valid candidate sources.
4. Selection order stays: sentence-level content match first, visual beauty second, aspect fit/conversion third.
5. A beautiful, strongly matched vertical clip can beat a weak native 4:3 clip. Normalize the strong source into 4:3.
6. Wide sources can be center-cropped to 4:3. Narrow/vertical sources should preserve the subject where possible, using a blurred 4:3 background plus centered source instead of destructive hard cropping.
7. QA must verify final rendered video and package assets are 1440x1080 / 4:3, decode cleanly, and retain source/license manifests.
```

Default commands:

```text
python D:\CodecX全项目管理\P08_C02_自动剪视频_auto_video_editing\50_代码_code\auto_talk_cut_mvp\scripts\stock_material_api.py search --kind video --orientation auto --aspect 4:3 ...
python D:\CodecX全项目管理\P08_C02_自动剪视频_auto_video_editing\50_代码_code\auto_talk_cut_mvp\scripts\smart_talk_editor.py input.mp4 --target-aspect 4:3 --target-width 1440 --target-height 1080 --target-fps 30 ...
```

## 2026-06-14 追加更新：素材站 API 接入落地

Pexels 和 Pixabay 已作为第一批自动化素材 API provider 接入本机项目；其他素材站保留在 provider registry 中，后续拿到账号、API 或授权方式后可启用。

已落地文件：

```text
C:\Users\进步\Documents\自动前视频\scripts\stock_material_api.py
C:\Users\进步\Documents\自动前视频\config\stock_provider_registry.json
C:\Users\进步\Documents\自动前视频\.env.example
C:\Users\进步\Documents\自动前视频\STOCK_MATERIAL_API_SETUP.md
```

API key 规则：

```text
PEXELS_API_KEY：Pexels API key，只放本机环境变量或 .env.local，不写进 GitHub。
PIXABAY_API_KEY：Pixabay API key，只放本机环境变量或 .env.local，不写进 GitHub。
```

默认命令：

```text
python scripts\stock_material_api.py doctor
python scripts\stock_material_api.py search --query "security camera monitoring office warehouse" --sentence "当前口播句子" --kind video --per-provider 10
python scripts\stock_material_api.py download --candidates stock_api_cache\xxx_candidates.json --limit 3 --out-dir downloaded_stock_video_api
```

执行规则：

```text
1. 素材 API 只生成候选池，不直接进时间线。
2. 下载素材必须生成 source_manifest.json。
3. 每个候选保留 provider、source_url、creator、license_url、query、matched_script_sentence、match_score、beauty_score、commercial_risk、manual_review_flags。
4. Pexels/Pixabay 自动检索后仍必须过视觉 QA，确认不是军人、警察、战争、犯罪、冲突、武器、监狱等强语义错素材。
5. 其他 provider 包括 Unsplash、Wikimedia、Mixkit、Coverr、Videvo、Storyblocks、Envato Elements、Motion Array、Artgrid、Shutterstock、Adobe Stock 暂时只保留，不自动启用。
```

本条规则只新增，不覆盖旧规则。旧规则“匹配第一、美感第二、比例第三；真实视频优先；不重复；禁止错素材；中文优先；字幕/BGM/SFX；QA 抽帧；规则审计”继续保留。

## 2026-06-14 追加更新：素材站账号/API 与人物身份强审核规则

用户反馈：上一版成片出现外国军人/军装人物片段，完全不符合 CoramAI 摄像头、AI 安防、线下老板报告这类商业文案。该问题属于素材匹配失败，必须写入硬规则。

硬规则新增：

```text
1. 商业、财经、AI 创业、摄像头、门店、仓库、学校、老板报告类文案，默认禁止使用军人、战争、战术、警察执法、暴力冲突、海外军装、武器、审讯、监狱等强语义素材，除非文案明确讲这些场景。
2. “安防/security”不能自动等同于 military/soldier/police/war。优先搜索 commercial security、CCTV camera、security camera, office security, warehouse monitoring, retail surveillance, access control, security guard in office/campus/warehouse 等商业安防关键词。
3. 每个素材站结果必须做人物身份与场景审核：人物是谁、在哪里、在做什么、是否会让观众误解成军警/战争/犯罪/政治/冲突。如果答案不贴当前句子，直接拒绝。
4. 素材站素材必须先经过“候选池”而不是直接进时间线。每个需求点至少保留 3-10 个候选，按脚本强匹配、美感、授权风险排序，最后只选第一梯队。
5. 不允许因为素材是真视频、清晰、好看，就绕过文案匹配。错素材比没有素材更糟。
```

素材站账号/API 规则：

```text
Pexels：网页手动下载通常不需要登录；自动化 API 需要 Pexels 账号申请 API key，环境变量建议 PEXELS_API_KEY。
Pixabay：网页手动下载可作为临时方式；自动化 API 需要登录后获取 API key，环境变量建议 PIXABAY_API_KEY。
Unsplash：主要用于图片；自动化 API 需要开发者账号、注册应用和 access key，环境变量建议 UNSPLASH_ACCESS_KEY。
Mixkit：适合手动检索视频/音乐/音效；不同素材类型有不同 license，必须逐条确认，不默认走 API。
Coverr：可用于视频，但免费素材署名/品牌/人物/商标风险要逐条记录；API/Plus/免费下载规则要逐条确认。
Wikimedia Commons：读 API 通常不靠商业 API key，但必须设置规范 User-Agent，并逐条检查 CC/PD/署名/相同方式共享等许可证。
付费站：Storyblocks、Envato Elements、Motion Array、Artgrid、Shutterstock、Adobe Stock 等需要用户账号/订阅/授权记录，不能默认免费使用。
```

自动化执行规则：

```text
1. 如果用户没有提供素材站账号/API key，先用可公开访问的网页检索和少量手动下载方式做试剪；正式规模化自动检索建议用户注册 Pexels、Pixabay 两个基础账号并提供 API key。
2. API key 不写进视频项目公开文件，不提交 GitHub；只放本机环境变量或私有配置。
3. 下载素材后必须生成 source_manifest.json，记录 source_site、source_url、license_url、creator、downloaded_at、query、matched_script_sentence、identity_scene_check、commercial_risk、attribution_required。
4. 对每个素材生成缩略图/短预览，先过视觉审核，再允许进入渲染脚本。
5. 军人/战争/警察执法/冲突等敏感强语义素材默认加入 reject_tags，除非文案明确要求。
```

本条规则只新增，不覆盖旧规则。旧规则“口播先清理、1.2 倍语速、字幕/BGM/SFX、中文优先、素材美观且匹配、不重复、禁止贴脸小贴纸、真实视频优先、50/50 强匹配混合素材、真实视频不加进度线/扫线、QA 抽帧与规则审计”全部继续保留。
