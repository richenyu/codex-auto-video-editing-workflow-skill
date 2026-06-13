---
name: auto-video-editing-workflow
description: Automatic short-form video and talking-head editing workflow. Use when Codex is asked to edit raw talking-head footage, cut the latest recorded video, apply a saved video-editing workflow, process oral video footage, remove pauses and repeated speech, build finance/tech/business explainer videos, match B-roll and large dynamic materials, add captions, add light upbeat BGM, add light SFX, install/check local video-editing dependencies, or export a clean no-caption/no-BGM variant with QA. Also use this in new windows when the user says the new oral video is already in the folder and wants the saved workflow applied.
---

# Auto Video Editing Workflow

Use this skill to turn raw talking-head footage, a manuscript, or a topic brief into a polished vertical short video.

## New Window Contract

If the user says any of the following, immediately use this workflow instead of asking them to retrain the rules:

```text
auto edit this video / edit my talking-head video / latest oral video
new video is in the folder / cut by my saved workflow
make the final short / add captions, BGM, and SFX
business, finance, technology, or explainer video
```

For portable setups, first read `references/local-setup.md` and inspect the host computer with the bundled scripts. If the host has its own workflow memory or project files, read them when available:

```text
<project-memory-root>/04_new_window_context_pack.md
<project-memory-root>/08_video_editing_logic.md
<project-memory-root>/07_asset_index.md
```

If the current project is unrelated but the task is video auto-editing, route back to this skill and the configured video-editing project.

## Core Rule

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
11. QA the result before delivery.
```

Never use materials, motion, or sound effects to hide a broken speech timeline.

## Hard Rules From User Training

Treat these as QA failure conditions, not soft preferences:

- Clean speech first; do not use visuals to cover repeated, wrong, or weak speech.
- Default talking-head speed is `1.2x` for this user's oral videos. Apply it after speech cleanup and before captions, B-roll timing, final mixing, and QA. Preserve pitch with audio tempo processing; do not chipmunk the voice. Only override when the user explicitly asks for normal speed or another multiplier.
- Formal publish exports default to burned captions, low-volume upbeat BGM, and light varied SFX unless the user asks otherwise.
- Material must pass both gates: beautiful and sentence-matched.
- No tiny pill labels, stickers, or floating text chips on or near the speaker's face. They are not acceptable "small effects."
- Use large, polished, readable material shots. Prefer video-like materials, animation, GIF-like clips, UI walkthroughs, webpage scrolls, chart motion, cursor movement, push-ins, highlights, or real footage over static cards.
- Large material shots may show 1, 2, or occasionally 3 materials at once when useful. Multi-material layouts must have hierarchy, stay readable, and remain large; never turn into small sticker clutter.
- For a 2-minute business, finance, or technical explainer, plan roughly 5-7 real or video-like full-screen cutaways, with 6 as the normal target. `full_card`, pure chart cards, and opinion slides do not count as `full_broll`.
- Before final delivery, create a rule audit and contact sheet. If the audit fails, revise and re-run QA.

## Reference Loading

Load only the references needed for the current request:

- For any real edit: read `references/workflow.md`.
- For visual, material, and SFX decisions: read `references/style-rules.md`.
- For finance, stock market, macro, or business explainer videos: read `references/finance-explainer.md`.
- For local project paths, commands, setup/bootstrap behavior, and handoff conventions: read `references/local-setup.md`.
- For a host project with persistent workflow memory, also read the latest context, bottom-logic, and asset-index files listed in "New Window Contract" when available.

## Default Behavior

- Default video format: vertical 9:16, 1080x1920, stable 30fps MP4.
- Default subtitles: burn clear, readable captions into the final publishable MP4 unless the user asks for a no-caption version.
- Default speech speed: `1.2x` for oral/talking-head videos after the clean timeline is built; all captions, cutaways, card timings, BGM/SFX, report durations, and QA should use the accelerated timeline.
- Default music: add a low-volume, light, upbeat, lyric-free BGM bed unless the user asks for a no-BGM version.
- Default sound: light varied SFX only, mixed below voice.
- Default talking-head look: subtle background blur or dim while keeping face, eyes, and mouth clear.

If local paths or project scripts are missing, ask for equivalent input, output, and project directories.

## Editing Workflow

1. Locate the intended source video. If the user says "latest", sort the configured input folder by modification time and confirm the chosen file if there is ambiguity.
2. Transcribe with pause-aware or word-level timestamps.
3. Normalize obvious ASR errors before judging repetition, especially finance terms, company names, stock symbols, and homophones.
4. Perform manuscript-level review before cutting:
   - remove repeated points,
   - remove half-sentence starts before complete sentences,
   - trim in-segment restarts,
   - preserve structural markers such as "first", "second", "third", and "finally".
5. If a user provides a formal script, use it as a soft alignment reference, not a hard token-level splice.
6. Speed the clean talking-head timeline to `1.2x` by default, preserving pitch; recalculate the edited duration and all downstream timing from this sped-up timeline.
7. Generate or select topic-specific B-roll after the sped-up clean timeline exists.
8. Render varied layouts:
   - `face` for trust, emotion, transitions, and breathing room;
   - `overlay` for light supporting information;
   - `feature` for large material shots;
   - `full_card` for occasional full-screen charts, frameworks, or opinion cards;
   - `full_broll` / `cutaway` for full-screen real materials such as photos, GIFs, footage, webpages, products, buildings, maps, or scene shots.
9. Add varied SFX at material entrances, transitions, and emphasis points.
10. Add captions from the sped-up cleaned speech timeline, then mix low-volume BGM below the voice.
11. Re-encode the final output to stable 30fps.
12. QA with media parameters, full decode, volume check, caption readability, contact sheet, layout distribution, BGM level, speech speed, and SFX event review.

## Material Principle

Materials must match the sentence currently being spoken and must look good. If no strong, good-looking material exists, keep the face shot or generate a clean designed visual rather than inserting ugly, blurry, watermarked, or unrelated visuals.

Visual material quality and script relevance are equal requirements:

- Relevance gate: the material must connect directly to the sentence, example, company, product, place, market, analogy, or claim being spoken.
- Beauty gate: the material must be clear, high-resolution enough for 1080x1920, well-framed, clean, modern, and pleasant at phone size.
- Reject low-quality materials even if they are relevant: blurry screenshots, cluttered pages, random stock-looking scenes, ugly crops, distracting watermarks, messy UI, tiny unreadable text, or images that feel cheap.
- Reject beautiful materials if they are off-topic. Aesthetic polish cannot compensate for wrong meaning.
- When choosing among several relevant materials, pick the one with the strongest combined score for beauty, clarity, and semantic match.

For finance and business explainers, do not turn the whole video into animated slide cards. Mix talking head, short video-like materials, screenshots, charts, photos, animated explainers, full-screen real cutaways, and a small number of cards. A cutaway may fully cover the speaker while the speaker's voice continues.

For standard finance, business, or technical explainers, aim for about 3 real full-screen cutaways per minute when enough relevant material exists. A 2-minute video should usually have 5-7 real full-screen cutaways, with 6 as the normal target. Slide cards and chart cards do not count toward this target.

## Utility Script

Run `scripts/check-video-workflow.ps1` to inspect whether configured local folders, project code, and key scripts exist on the current Windows machine.

On a new Windows computer, if required tools are missing, ask the user for permission before running `scripts/setup-video-workflow.ps1`. The setup script can create working folders, download FFmpeg, create a Python virtual environment, and install the core editing packages such as MoviePy and auto-editor. Skills should not silently download or install software; Codex should explain what is missing, request approval for network/system changes, then run the setup script.
