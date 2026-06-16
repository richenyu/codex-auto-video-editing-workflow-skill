# Non-Regression Checklist

This checklist prevents newly trained preferences from erasing older locked rules. Treat it as a delivery gate, not a reminder.

## Rule Stack Contract

New user corrections must be added to the active rule stack. They must not replace older rules unless the user explicitly says an older rule is cancelled.

When adding a new rule:

```text
1. State which old rules remain active.
2. State which behavior the new rule changes.
3. Add a QA item that can fail the export.
4. Record the rule in the project memory or skill reference.
5. Update the rule audit output before the next delivery.
```

## Locked Rules

Every formal talking-head edit must preserve all of these unless the user overrides the specific item:

```text
speech_cleanup_first
default_speech_speed_1p2
formal_publish_has_captions_bgm_sfx
bgm_from_user_folder_only
beauty_and_relevance_material_gate
sentence_level_material_match_gate
no_reused_material_assets_in_one_video
dynamic_material_not_static_image_only
no_tiny_face_stickers
large_content_motion_overlays_on_face_moments
video_like_materials_over_static_slides
speaker_material_balance_target
full_broll_cutaway_target
full_card_not_counted_as_full_broll
multi_material_layout_when_useful
varied_sfx_not_fixed_repetition
background_blur_or_dim_when_useful
no_visible_creator_style_label
contact_sheet_and_decode_qa
```

## Required Audit Fields

Each delivery report should include these fields:

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
static_image_only_count
dynamic_material_count
speaker_visible_ratio
material_dominant_ratio
full_broll_count
video_like_cutaway_count
content_motion_overlay_count
multi_material_layout_count
tiny_sticker_violation_count
ppt_like_material_violation_count
caption_face_overlap_pass
decode_pass
volume_mean
volume_max
contact_sheet_path
```

## Hard Failure Examples

Do not deliver if any of these are true:

```text
New visual style removes previously required talking-head overlays.
New cinematic images make the edit mostly static slideshow.
New full-screen cutaways remove the balanced face/material rhythm.
New overlays become tiny pill labels or sit near the face.
New BGM choice ignores the user's BGM folder rule.
New material density hides an unclean speech timeline.
New template counts full cards or chart cards as real cutaways.
New creator reference appears as visible "X-style" text.
New material pass repeats the same asset later in the same video.
New material pass uses broad-topic visuals that do not match the exact sentence.
New material pass uses still pictures without visible video/GIF-like motion.
```

## Final Self-Check

Before the final answer, compare the output against the active rule stack:

```text
No old locked rule was silently dropped.
New user correction was added as a QA field.
The audit file proves the rule with counts or ratios where possible.
The contact sheet visually supports the audit.
```
