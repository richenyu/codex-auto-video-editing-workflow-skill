# Bottom Logic

This file is the locked editing logic for the English version of the skill. New rules are additive unless a user explicitly cancels an older rule.

## Locked Rule Stack

1. Clean speech before visuals.
2. Keep the argument smooth and information-dense.
3. Apply the default talking-head speed after cleanup, normally 1.2x with pitch preserved.
4. Align captions and material timing to the final cleaned audio.
5. Use formal manuscripts as caption text truth when available.
6. Match visual assets at sentence level, not broad-topic level.
7. Require both beauty and relevance before using any asset.
8. Do not repeat files, templates, screenshots, generated scenes, source pages, or visually similar material.
9. Prefer real video, real screen recordings, official material, stock footage, or AI video over static slides.
10. Keep dynamic information overlays during talking-head moments, but make them large, readable, varied, and safe-zone aware.
11. Avoid tiny stickers, pill labels, or decorative chips near the speaker's face.
12. Add captions, upbeat low-volume BGM, and light varied SFX by default for publishable exports.
13. Track source, license, match, beauty, risk, and manual review for external materials.
14. Run technical QA, event-level material QA, contact-sheet QA, and non-regression QA before delivery.

## Source Preflight

For latest-video tasks, sort the configured input folder by modification time and inspect likely candidates. For multi-part tasks, verify filenames, hashes, duration, first and last frames, and transcript snippets. Do not merge unrelated files just because their names look similar.

## Speech Review

Use pause-aware or word-level timestamps when possible. Remove long pauses, restarts, wrong takes, filler fragments, low-information repeats, and local phrase restarts.

When repeated speech appears, prefer:

- the later complete sentence;
- the version with the clearest number, direction, or conclusion;
- the version that preserves the surrounding argument.

Do not delete structure markers or useful transitions merely because they are short.

## Caption Alignment

Raw ASR timing is not valid after cuts or speed changes. After the final voice timeline exists, regenerate or force-align captions to the final audio.

For manuscript-based work:

1. Use the manuscript as text truth.
2. Use ASR for locating speech and detecting deviations.
3. Align manuscript text to final audio.
4. Split captions for readability.
5. Move B-roll and overlay events with aligned sentence timestamps.

Important visual beats should start close to the sentence they illustrate unless intentionally previewed or used as a callback.

## Default Output Format

The current default final output is:

```text
4:3, 1440x1080, 30fps MP4
```

Also support:

- 16:9, 1920x1080, when explicitly requested.
- 9:16, 1080x1920, when explicitly requested.

For 4:3 projects, do not reject strong vertical or widescreen sources solely for aspect ratio. Normalize strong sources into 4:3 while preserving the subject.

## Visual Pack First

For finance, business, AI, technology, product, or training explainers, build a dedicated visual pack before final rendering when practical.

The visual pack should include:

```text
shot_id
matched_sentence
material_need
accepted_asset
asset_type
source_or_license
match_score
beauty_score
visual_fingerprint
rejection_notes
```

Use accepted visual-pack assets or newly reviewed candidates only. Do not randomly pull weak local packs into the timeline.

## Material Source Rules

Recommended source order:

```text
S tier: user-owned footage, original recordings, official videos, official/product screen recordings.
A tier: licensed stock video, official public pages, public-domain or Creative-Commons material after license review.
B tier: AI-generated video, cinematic generated scenes, high-quality stills with strong motion.
C tier: static cards, PPT-like slides, pure text cards, and fake dashboards.
```

C-tier material is allowed only as a limited fallback. It must not define the whole video.

API and stock searches only create candidate pools. Candidates must pass visual QA, license review, identity/scene review, match scoring, and beauty scoring before timeline use.

Reject strong semantic mismatches by default, including military, police, war, weapons, prison, riot, violence, and conflict imagery, unless the script explicitly requires them.

## Real Video Versus Animated Stills

Do not count image motion as real video. A still with zoom or pan can be useful, but it remains an animated still unless it has strong video-like motion.

Real or video-like material includes:

- real footage;
- screen recordings;
- webpage scrolling;
- product walkthroughs;
- chart/data animation;
- GIF-like continuous action;
- AI video;
- generated scenes with strong parallax, depth, foreground/background motion, light movement, or environmental motion.

For a roughly 2-minute explainer, plan about 5-7 real or video-like full-screen cutaways when enough strong material exists. Animated stills should not dominate formal exports.

## Dynamic Information Overlays

Do not remove dynamic information overlays. They are part of the desired visual language during talking-head sections.

Use overlays for:

- key numbers;
- comparisons;
- steps;
- risks;
- conclusions;
- checklists;
- before/after frames;
- mini timelines;
- compact supporting evidence.

Overlay rules:

- Use medium or large elements.
- Keep text short.
- Keep away from face, hands, and captions.
- Vary motion, size, position, timing, and color.
- Avoid fixed templates and fixed SFX.
- Do not let overlays replace real cutaways.

## Music And SFX

Final exports default to bright, positive, light, upbeat, lyric-free BGM. Reject dark, oppressive, suspenseful, heavy, or gloomy music for ordinary business and finance videos.

Keep BGM below the voice, fade in/out, and reduce it further when the voice recording is noisy.

Use light varied SFX for material entrances, large cards, transitions, and emphasis. Do not use the same sound at fixed intervals.

## Final QA

A formal export is not complete until it has:

- source-file preflight pass;
- speech-cleanup pass;
- caption alignment pass;
- technical decode pass;
- visual event sheet;
- contact sheet;
- source manifest;
- match/beauty/risk review;
- material uniqueness and visual-similarity check;
- layout distribution report;
- non-regression checklist.

If strong material cannot be found, label the output as a draft or fallback instead of pretending it is a mature final version.
