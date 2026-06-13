# Editing Workflow

## Priority

Short videos must keep attention. Optimize in this order:

```text
1. Voice continuity and information density
2. Smooth argument and complete point of view
3. Default 1.2x talking-head tempo after cleanup, with pitch preserved
4. Natural visual rhythm, not fixed template repetition
5. Beautiful and sentence-matched materials
6. Clear captions, light upbeat BGM, and varied SFX that never overpower voice
7. Technical QA, contact sheet, and rule audit
```

## Source Handling

- Use the configured raw folder when the user says "latest video".
- If several candidates are close in time, inspect names and timestamps before editing.
- If the user mentions a filename or number, prefer that file and verify it exists.
- Keep intermediate outputs and reports in the project output folder.
- Copy only final user-facing MP4s, contact sheets, and audit files to the configured delivery folder.

## Speech Cleanup First

Before adding materials, build a clean spoken timeline.

Detect and remove:

- long pauses, waiting, dead air, and no-speech sections;
- filler fragments and single-word debris;
- wrong takes followed by corrected takes;
- half-sentence starts followed by complete sentences;
- repeated phrases, repeated nouns, and nearby duplicate points;
- repeated lists, especially finance symbols, market terms, ETF lists, and company names;
- weak recaps that add no new information;
- timeline sections that are smooth visually but broken in meaning.

Default choices:

- Keep the later, more complete restart.
- Keep the take with clearer numbers, objects, conclusions, or direction.
- Preserve structure words such as "first", "second", "third", and "finally".
- Prefer local phrase trims over deleting an entire useful segment.
- Do not use B-roll to cover unclean speech.

Suggested report reason labels:

```text
fragment_before_complete
near_duplicate_window
low_new_information_recap
internal_phrase_restart_trim
internal_phrase_restart_suffix_trim
internal_finance_list_restart_trim
internal_lead_word_restart_trim
tiny_fragment
too_short
dead_air
wrong_take
```

## Formal Manuscript Mode

When the user provides a formal script:

- Treat the script as the highest content reference.
- Normalize ASR errors, simplified/traditional variants, finance terms, company names, stock symbols, and homophones before judging repetition.
- Use soft monotonic alignment by idea and order.
- Do not hard-splice every token by default; it often makes audio choppy.
- If strict token alignment is used, treat it as a diagnostic pass unless the resulting audio is natural.
- Protect against low-confidence alignment jumps that skip a large middle section.

## Pause-Aware Cutting

- Use word-level timestamps when available.
- Cut when word gaps are roughly longer than `0.75s`, unless the pause is intentional emphasis.
- Split long continuous speech into short-video chunks, roughly under `7s` or around `32` Chinese characters for Mandarin workflows.
- Keep breath and micro-pauses only when they support meaning.

## Speech Speed

- Default oral/talking-head speed: `1.2x`.
- Apply speed after cleanup and before captions, B-roll timing, BGM/SFX, final mixing, reports, and QA.
- Preserve pitch with audio tempo processing such as FFmpeg `atempo=1.2`.
- Match video timing to audio speed, such as `setpts=PTS/1.2`.
- Record `speech_speed_multiplier: 1.2` in the audit.
- Only use `1.0x` or another speed when the user explicitly asks.

## Visual Planning

Plan visuals after the sped-up clean timeline exists.

Use these roles:

```text
face       -> talking head only; trust, emotion, transition, breathing room
overlay    -> large supporting material over the face shot
feature    -> large semi-main material while speaker remains visible
full_card  -> occasional full-screen framework, chart, or claim card
full_broll -> full-screen real or video-like cutaway; may fully cover the speaker
```

Do not use one fixed visual formula across the whole video.

## Caption, Music, And SFX Order

1. Build the clean timeline.
2. Apply `1.2x` speed.
3. Recalculate all timings.
4. Write captions from the cleaned sped-up timeline.
5. Add material cutaways and overlays.
6. Generate light varied SFX for entrances and emphasis.
7. Mix low-volume upbeat BGM below voice.
8. Export final and clean variants.

## Export QA

Before delivery:

- Use `ffprobe` to confirm resolution, duration, stream count, and frame rate.
- Use `ffmpeg -v error -i final.mp4 -f null -` for full decode.
- Use `volumedetect`; avoid clipping and keep voice dominant.
- Confirm final speech speed is `1.2x` unless overridden.
- Create a contact sheet.
- Check caption readability and face/material overlap.
- Check layout distribution and material/speaker balance.
- Check SFX variety and volume.
- Check BGM mood: light, upbeat, positive, not gloomy or oppressive.
- Check real/video-like full-screen cutaway count and density.
- Confirm no `full_card` or pure chart card is counted as real `full_broll`.
- Confirm no tiny sticker or face-adjacent label appears.

If any gate fails, revise and rerun QA.
