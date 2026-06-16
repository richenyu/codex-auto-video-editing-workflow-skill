---
name: auto-video-editing-workflow
description: Automatic short-form video and talking-head editing workflow. Use when Codex is asked to edit raw talking-head footage, cut the latest recorded video, apply a saved video-editing workflow, remove pauses and repeated speech, build finance/business/technology explainer videos, match B-roll and large dynamic materials, add captions, add light upbeat BGM, add light SFX, export 4:3/16:9/9:16 videos, or run source, material, caption, and final-render QA.
---

# Auto Video Editing Workflow

Use this skill to turn raw talking-head footage, a manuscript, or a topic brief into a polished short-form explainer video.

## Core Contract

Rules are cumulative. A new correction adds to the active rule stack; it does not erase older locked rules unless the user explicitly cancels that exact rule.

Work in this order:

```text
1. Identify the source video and any manuscript.
2. Preflight source files before merging multi-part inputs.
3. Clean the speech first: pauses, restarts, wrong takes, repeated phrases, and weak fragments.
4. Build a smooth spoken timeline before adding visuals.
5. Apply the default talking-head tempo after cleanup, normally 1.2x with pitch preserved.
6. Align captions and visual beats to the cleaned final audio, not to raw ASR timings.
7. Build a visual material plan from the final script or cleaned transcript.
8. Select materials only after they pass both gates: sentence relevance and visual beauty.
9. Render varied layouts: face, face-with-overlay, feature, full card, and full B-roll.
10. Add burned captions, low-volume upbeat BGM, and light varied SFX unless the user asks otherwise.
11. Run non-regression QA and technical QA before delivery.
```

Never use visuals, motion, music, or sound effects to hide a broken speech timeline.

## Required References

Load only what the task needs:

- For any real edit, read `references/workflow.md`.
- For visual style, material choice, BGM, SFX, cutaways, and overlays, read `references/style-rules.md`.
- For the latest locked editing logic, aspect-ratio defaults, stock-source rules, source preflight, caption alignment, and material QA, read `references/bottom-logic.md`.
- For finance, market, macro, business, or stock explainer videos, read `references/finance-explainer.md`.
- For portable setup, folder configuration, commands, and handoff, read `references/local-setup.md`.
- For formal exports, read `references/non-regression-checklist.md`.

## Default Behavior

- Default final format: 4:3, 1440x1080, 30fps MP4.
- Support vertical 9:16 or landscape 16:9 when the user explicitly requests that format.
- Default speech speed: 1.2x after speech cleanup, with pitch preserved.
- Default final package: burned captions, low-volume upbeat lyric-free BGM, and light varied SFX.
- Default clean variant: export only when requested or useful for handoff.
- Default talking-head look: subtle background blur or dim while keeping the face, eyes, mouth, and hands clear.

If local paths, rendering scripts, or media tools are missing, inspect the environment and ask before installing or downloading dependencies.

## Source Handling

When the user says "latest video", sort the configured input folder by modification time. If several files are close in time or names are ambiguous, inspect filenames, durations, first/last frames, and transcript snippets before editing.

For multi-part files, do not trust filenames alone. Verify exact filenames, hashes, durations, first/last frames, and opening/ending transcript snippets. If a part appears to be from the wrong topic or a wrong take, stop and report the mismatch instead of producing a mixed video.

## Speech Cleanup

Before adding materials, create a clean speech timeline.

Remove:

- dead air and long thinking pauses;
- filler fragments and single-word debris;
- wrong takes followed by corrected takes;
- half-sentence starts before a complete sentence;
- near-duplicate phrases or repeated ideas;
- repeated lists, repeated lead words, and local restarts.

Keep:

- the later, more complete version of a restart;
- the version with clearer numbers, conclusion, object, or direction;
- structural markers such as "first", "second", "third", and "finally".

Prefer local trims inside a segment over deleting a whole useful segment.

## Manuscript And Caption Alignment

If a manuscript exists, use it as the preferred text truth for captions and content review. Use ASR mainly for timestamps, locating speech, and detecting what was actually said.

Do not burn raw ASR text when a manuscript is available. After cleanup and speed changes, regenerate or force-align captions to the final cleaned audio.

Caption rules:

- Rebuild caption timing after cuts and speed changes.
- Bind B-roll and overlay timing to aligned sentence timestamps.
- Keep caption blocks short and readable.
- Avoid covering faces, mouths, hands, or important material text.
- Record caption alignment QA for formal exports.

## Visual Material Principle

Material must be both relevant and beautiful. Either failure rejects the asset.

Relevance gate:

- Match the current sentence, object, company, product, scene, analogy, number, market, or claim.
- Reject broad-topic filler.
- Reject generic office, warehouse, finance, or AI stock footage unless it directly maps to the sentence.

Beauty gate:

- Clear, sharp, clean, modern, high-resolution enough, well-framed, and pleasant at phone size.
- Reject blurry, muddy, low-resolution, watermarked, cramped, unreadable, ugly, cheap, or awkwardly cropped assets.

Uniqueness gate:

- Do not reuse the same file, screenshot, generated scene, source page, clip, template instance, or visually similar material later in the same finished video.
- Treat visual similarity as a separate QA check from file duplication.

## Material Source Priority

Prefer, in order:

```text
1. User-owned footage, original recordings, and official/product screen recordings.
2. Official public videos, webpages, press pages, documentation, charts, and screen captures.
3. Licensed stock video or clearly licensed public-domain/Creative-Commons media.
4. AI-generated video or cinematic generated scenes with strong motion.
5. High-quality stills animated into strong video-like motion.
6. Clean information cards only as fallback.
```

External materials must produce a source manifest with source URL, creator, license URL, download time, search query, matched script sentence, match score, beauty score, commercial-risk notes, and manual review flags.

Do not insert stock/API results directly into the timeline. They are only candidate pools until reviewed.

## Cutaways And Overlays

Use varied layouts:

```text
face         speaker only
overlay      speaker plus large or medium supporting information
feature      large material shot with speaker still visible or secondary
full_card    full-screen explanation card, chart, framework, or opinion card
full_broll   full-screen real or video-like cutaway
```

Target rhythm for 1-3 minute explainers:

- about 45%-55% visible speaker when enough strong material exists;
- about 45%-55% material-led moments;
- about 3 real or video-like full-screen cutaways per minute when relevant material exists;
- about 5-7 real or video-like full cutaways for a roughly 2-minute business, finance, or technical explainer;
- about 8-14 dynamic information overlays during useful talking-head sections.

Dynamic overlays are wanted, but they must be large, readable, sentence-matched, varied, and kept away from the face and subtitle safe area. They are not tiny stickers or decorative labels.

## Forbidden Visual Mistakes

Treat these as QA failures:

- the whole video feels like a slideshow or animated PPT;
- PPT-like MP4 files are counted as real video cutaways;
- all assets appear in one fixed position or with one repeated animation;
- small pill labels, stickers, or floating chips sit on or near the speaker's face;
- real video receives fake progress lines or scanning lines just to show motion;
- broad-topic or unrelated stock footage is inserted because it is available;
- military, police, war, weapons, prisons, riots, violence, or conflict visuals appear unless the script explicitly discusses those topics;
- static images are held without visible motion in a formal export;
- material timing no longer matches the spoken sentence after caption realignment.

## Aspect Defaults

Current default final output and visual material package:

```text
4:3, 1440x1080, 30fps MP4
```

When the user explicitly requests 16:9, use 1920x1080 landscape and search for landscape candidates first.

When the user explicitly requests 9:16, use 1080x1920 vertical and respect platform safe zones.

For 4:3 material search, source orientation can be horizontal, vertical, or native 4:3. Choose by sentence match first, beauty second, aspect fit third. Normalize strong sources into the target aspect without destroying the subject.

## QA Before Delivery

Run or create:

- media parameter check with ffprobe or equivalent;
- full decode check with ffmpeg or equivalent;
- volume and clipping check;
- caption sync and readability review;
- source manifest and license-risk review;
- material event sheet at visual event midpoints;
- final contact sheet;
- non-regression checklist.

Record a rule audit with at least:

```text
speech_cleanup_pass
speech_speed_multiplier
caption_alignment_pass
bgm_present
sfx_variety_pass
sentence_match_pass
beauty_gate_pass
source_manifest_pass
unique_asset_pass
visual_similarity_pass
real_or_video_like_cutaway_count
animated_still_cutaway_count
dynamic_overlay_count
speaker_visible_ratio
material_dominant_ratio
tiny_sticker_violation_count
ppt_slideshow_violation_count
decode_pass
```

If the audit fails, revise and rerun QA before calling the video final.

## Utility Scripts

Run `scripts/check-video-workflow.ps1` to inspect whether configured folders, FFmpeg, Python, and common rendering dependencies exist.

On a new Windows computer, only run `scripts/setup-video-workflow.ps1` after explaining what will be installed and receiving approval. The setup script may create working folders, download FFmpeg, create a Python virtual environment, and install editing packages.
