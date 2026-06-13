# Bottom Logic Rule Stack

This file is the cumulative rule stack for the automatic video editing workflow. New corrections add to this stack. Do not remove an older rule unless the user explicitly cancels that exact rule.

## 1. Speech Is The Foundation

- Clean speech before visual editing.
- Remove repeated speech, wrong takes, restarts, weak fragments, and dead air.
- If a speaker stops because of real-time thinking, that silence should usually be cut.
- A short video must feel like someone is continuously speaking with meaningful information.
- Do not leave long pauses just because the face shot is usable.
- Do not use B-roll to hide repeated or wrong speech.
- If the user provides a manuscript, use it as a soft content reference for repairing the spoken timeline.

## 2. Default Tempo

- Default oral/talking-head speed is `1.2x`.
- Apply speed after speech cleanup.
- Recalculate captions, B-roll timing, BGM, SFX, reports, and QA from the sped-up timeline.
- Preserve pitch.
- Do not use another speed unless the user asks.

## 3. Default Publish Package

Formal finished exports default to:

- burned captions;
- low-volume upbeat lyric-free BGM;
- light varied SFX;
- vertical `1080x1920`;
- stable `30fps`;
- H.264 MP4;
- clean no-caption/no-BGM variant when useful.

## 4. BGM Rules

- Use the user's configured BGM folder.
- Reject dark, oppressive, gloomy, suspenseful, or heavy tracks.
- Prefer bright, positive, lightly inspirational, forward-moving tracks.
- For business and finance, the emotional target is confident and money-making, not childish.
- If the BGM folder is empty, ask for music or export without BGM.

## 5. SFX Rules

- SFX should be light and varied.
- Do not use one fixed effect repeatedly.
- Do not place effects at mechanical intervals.
- Trigger effects on meaningful visual changes, material entrances, and emphasis points.
- SFX must not overpower voice.

## 6. Material Gates

Every material must pass all gates:

```text
beauty_gate
sentence_relevance_gate
source_uniqueness_gate
dynamic_motion_gate
caption_safety_gate
```

Definitions:

- Beauty: clear, polished, high-quality, attractive at phone size.
- Sentence relevance: directly supports the exact sentence or example being spoken.
- Source uniqueness: same asset source is not reused later in the same finished video.
- Dynamic motion: final insert is not static and not weak pan/zoom only.
- Caption safety: captions do not block face, mouth, or important material text.

## 7. Material Priority

Preferred material priority:

```text
S tier: user-owned footage, product/screen recordings, official public footage, licensed stock video, AI-generated short video
A tier: real webpage scrolls, official pages, GitHub/product/documentation recordings, chart motion, cursor movement, real screenshots with operation
B tier: high-quality photos or generated images with strong cinematic/video-like motion
C tier: static images, PPT cards, pure text cards
```

Rules:

- Prefer S/A tier whenever possible.
- B tier can support the edit, but should not be the whole mature version.
- C tier cannot count as real `full_broll`.
- If only B/C materials are available, label the output as a test or fallback version rather than a fully mature material edit.

## 8. Static Image Motion Rule

Static images are source material only. Final inserts must be video-like.

Strong motion should combine multiple elements:

- push-in;
- lateral camera movement;
- parallax;
- foreground/background separation;
- focus/depth changes;
- light/shadow movement;
- screen reflections;
- particles, smoke, rain, dust, or other environment texture;
- moving UI/chart/cursor elements;
- foreground occlusion or transition.

Weak motion failures:

- slight pan/zoom only;
- still image with text overlay;
- repeated image source with different crop;
- generic dashboard loop;
- PPT/card-stack look.

## 9. Chinese-First Visual Rule

- User-facing generated visual text should be Chinese-first.
- Do not create large English fake UI, fake English dashboards, or fake English reports.
- Real English sources are allowed when the source itself is English, such as GitHub, product pages, official announcements, or stock tickers.
- If the topic is Chinese short video, visible labels should be concise Chinese.

## 10. No PPT-Like Dominance

Avoid:

- full-video slide decks;
- repeated cards;
- dashboard template loops;
- static chart cards;
- software-like panels that are not real product screenshots;
- generic "AI data" panels with fake English;
- repeated same layout.

Use instead:

- real or video-like cutaways;
- cinematic scenes;
- real photos with strong motion;
- screen recordings;
- official pages;
- product walkthroughs;
- large varied overlays only when needed.

## 11. Speaker And Material Balance

For mature 1-3 minute business/finance/technical explainers:

- speaker visible target: about `45%-55%`;
- material-dominant target: about `45%-55%`.

If the video is trust/personality-driven, speaker may be higher. If product/evidence-driven, material may be higher.

Audit should record:

```text
speaker_visible_ratio
material_dominant_ratio
```

## 12. Full Cutaway Density

For a 2-minute business/finance/technical explainer:

- plan 5-7 real or video-like full-screen cutaways when enough strong materials exist;
- 6 is the normal target;
- 3 real/video-like cutaways per minute is a good planning heuristic.

Cutaways may cover the face completely while voice continues.

## 13. Overlays And Stickers

Allowed:

- large readable claim cards;
- number cards;
- comparison strips;
- compact report panels;
- 1/2/3 material layouts with hierarchy.

Forbidden:

- tiny stickers;
- tiny pill labels;
- face-adjacent labels;
- clutter near eyes, mouth, or hands;
- fixed repeated positions and fixed repeated sounds.

## 14. QA Audit Required Fields

Each formal delivery should record:

```text
speech_cleanup_pass
speech_speed_multiplier
captions_enabled
bgm_path
sfx_event_count
beauty_relevance_gate_pass
material_match_gate_pass
low_match_material_count
unique_material_asset_count
reused_material_asset_count
real_video_cutaway_count
screen_recording_cutaway_count
ai_video_cutaway_count
animated_still_cutaway_count
static_card_count
static_image_only_count
dynamic_material_count
speaker_visible_ratio
material_dominant_ratio
full_broll_count
video_like_cutaway_count
content_motion_overlay_count
multi_material_layout_count
tiny_sticker_violation_count
english_fake_ui_violation_count
ppt_like_material_violation_count
weak_pan_zoom_only_count
caption_face_overlap_pass
decode_pass
volume_mean
volume_max
contact_sheet_path
```

## 15. Non-Regression Principle

When adding a new style preference, check that older rules still hold:

- new cinematic materials did not remove talking-head overlays;
- new real materials did not hide bad speech;
- new captions did not cover face;
- new cutaway style did not become PPT;
- new BGM came from the configured folder;
- new language rules did not remove real official English sources when needed;
- new AI-generated scene style did not repeat the same asset.
