# Non-Regression Checklist

Use this before any formal delivery.

## Rule Stack Contract

New user feedback adds to the rule stack. It does not erase older locked rules unless the user explicitly cancels the older rule.

When adding a rule:

1. Keep older rules active.
2. State what behavior changes.
3. Add a QA item that can fail the export.
4. Record the rule in the skill or project memory.
5. Update the audit fields before the next delivery.

## Locked Rules

Every formal talking-head edit must preserve:

```text
speech_cleanup_first
default_speech_speed_1p2
formal_publish_has_captions_bgm_sfx
bgm_from_user_folder_only
beauty_and_relevance_material_gate
sentence_level_material_match_gate
no_reused_material_assets_in_one_video
dynamic_material_not_static_image_only
real_or_video_like_materials_preferred
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
chinese_first_generated_visuals
no_large_english_fake_ui
no_ppt_dashboard_dominance
contact_sheet_and_decode_qa
```

## Required Audit Fields

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
real_video_cutaway_count
screen_recording_cutaway_count
ai_video_cutaway_count
animated_still_cutaway_count
static_card_count
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

## Hard Failure Examples

Do not deliver as a finished version if:

- speech still contains obvious repeated or wrong lines;
- materials are used to hide broken speech;
- the edit mostly becomes a static slideshow;
- generated visuals contain large fake English UI;
- the whole video feels like PPT, dashboards, or card stacks;
- the same material asset appears twice;
- material does not match the current sentence;
- still images only receive weak pan/zoom;
- tiny stickers or pill labels appear near the face;
- BGM ignores the user's configured BGM folder;
- captions block the face, mouth, or key material text;
- creator reference names appear visibly in the video.

## Final Self-Check

Before final response:

```text
No old locked rule was silently dropped.
The newest user correction is represented in QA.
The audit proves the rule with counts or ratios where possible.
The contact sheet supports the audit.
The final file exists in the delivery folder.
```
