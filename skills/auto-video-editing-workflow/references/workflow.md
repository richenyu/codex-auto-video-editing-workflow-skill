# Workflow

## Priority

Short videos must keep attention. Optimize in this order:

```text
1. Voice continuity and information density
2. Smooth argument and complete point of view
3. Default 1.2x talking-head tempo after cleanup, with pitch preserved
4. Natural visual variation, not template repetition
5. Relevant, readable, attractive materials
6. Clear captions, light upbeat BGM, and varied SFX that never overpower voice
7. Optional clean handoff version without captions or BGM when requested
```

## Source Handling

- Use the configured raw folder when the user says "latest video".
- If several candidates are close in time or the user mentions a filename, inspect names and timestamps before editing.
- Keep project outputs and reports in the project code folder, then copy the final user-facing MP4 and QA image to the output folder.

## Transcript And Manuscript Review

Before adding materials, create a clean speech timeline.

Detect and remove:

- long pauses, thinking time, waiting, no-speech sections;
- filler fragments and single-word debris;
- wrong takes followed by corrected takes;
- a half-sentence start followed by the complete sentence;
- repeated points across a nearby window;
- repeated stock or ETF lists inside one segment;
- repeated lead words such as "market, market..." or "oil price, oil price...".

Default decisions:

- Keep the later, more complete version when a speaker restarts.
- Keep the version with numbers, conclusion, direction, or clearer object.
- Do not delete structure markers such as "first", "second", "third", and "finally" merely because they are short.
- Prefer local trims inside a segment over deleting the whole segment when the latter contains valid information.

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
```

## Formal Script Mode

When the user provides a formal manuscript:

- Use the manuscript as the highest content reference.
- Normalize ASR errors and simplified/traditional variants before alignment.
- Use soft monotonic alignment by idea and order.
- Do not hard-splice every token by default; this often makes the video choppy.
- If strict token alignment is used, treat it as diagnostic unless the resulting audio is natural.
- Protect against low-confidence jumps that skip a large middle section.

## Pause-Aware Cutting

- Use word-level timestamps when available.
- Cut when word gaps are roughly longer than `0.75s`.
- Split long continuous speech into short-video chunks, roughly under `7s` or about `32` Chinese characters for Mandarin workflows.
- Do not keep silence unless it is clearly intentional emphasis.

## Speech Speed

- For this user's oral/talking-head videos, default to `1.2x` final speech speed.
- Apply speed after speech cleanup and before captions, B-roll/cutaway timing, BGM/SFX mixing, reports, and QA.
- Preserve pitch with audio tempo processing such as FFmpeg `atempo=1.2`; do not make the voice sound chipmunked.
- Video timing must match the audio speed, such as `setpts=PTS/1.2`, and the report should record `speech_speed_multiplier: 1.2`.
- Only use `1.0x` or another speed when the user explicitly asks.

## Export QA

Before final delivery:

- Use `ffprobe` to confirm resolution, duration, streams, and frame rate.
- Use `ffmpeg -v error -i final.mp4 -f null -` for full decode.
- Use `volumedetect`; keep SFX under voice and avoid clipping.
- Confirm the final talking-head speech speed is `1.2x` unless the user explicitly requested otherwise.
- Create a contact sheet from the final MP4.
- Check caption readability and make sure captions do not cover faces, mouths, or key material text.
- Review layout distribution; it must not be one fixed style for the whole video.
- Check BGM level; voice must remain clearly dominant.
- Confirm the contact sheet contains real or video-like full-screen cutaways when the topic calls for them, not only talking head plus small cards.
- For videos over 60 seconds, confirm real or video-like full-screen cutaways are planned. For 2-minute finance/business/technical explainers, target 5-7 and normally use about 6.
- Confirm `full_card`, pure chart cards, and opinion slides were not counted as `full_broll` / `cutaway`.
- Confirm no tiny pill labels, stickers, or floating text chips appear on or near the speaker's face.
- Confirm large material shots are large, readable, polished, and preferably dynamic instead of mostly static slides.
- Confirm each material is sentence-matched, not merely topic-adjacent.
- Confirm no material source asset is reused later in the same finished video.
- Confirm still-image sources have been turned into visible video-like motion; a static picture held on screen is a failure for formal delivery.
- Confirm suitable comparison/process/evidence moments include 2-material or occasional 3-material large layouts when useful, with clear hierarchy and no clutter.
- Review SFX events; they must not all be the same sound at a fixed interval.
- Run the non-regression checklist: a new visual/music/material correction must not silently remove older locked rules.
- Confirm the report records the old-rule preservation fields: speaker/material ratio, full_broll count, content overlay count, BGM source, SFX variation, and tiny-sticker violations.

## Rule Audit Table

Before saying the edit is complete, record a short rule audit in the report or final notes:

```text
Speech cleanup: pass/fail
Default speech speed 1.2x: pass/fail
Captions/BGM/SFX default publish package: pass/fail
Beauty + sentence relevance gates: pass/fail
Sentence-level material match gate: pass/fail
No repeated material assets inside one video: pass/fail
No static-image-only material moments: pass/fail
No tiny sticker labels near face: pass/fail
Large dynamic material shots: pass/fail
Multi-material 1/2/3 rhythm where useful: pass/fail
Full-screen real/video-like cutaway target: pass/fail
Speaker/material balance target: pass/fail
Content motion overlays preserved when face moments exist: pass/fail
No old locked rule dropped by latest style change: pass/fail
Contact sheet and technical QA: pass/fail
```

If any item fails, revise the edit and rerun QA before delivery.
