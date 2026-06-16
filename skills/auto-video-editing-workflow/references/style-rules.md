# Style Rules

## Captions And Music

- Final exports should include burned-in captions unless the user asks for a no-caption version.
- Generate captions from the cleaned and final-speed speech timeline, not from unreviewed raw ASR.
- Use the manuscript as caption text truth when available, then align it to final audio.
- Keep captions readable, usually 1-2 lines, and avoid the speaker's mouth, eyes, hands, and important material text.
- Use bold white or yellow text with dark stroke or shadow for phone viewing.
- Highlight only important words; do not animate every word.
- Export a no-caption clean variant only when requested or useful for handoff.
- Final exports should include low-volume, upbeat, lyric-free BGM unless the user asks for no BGM.
- The default mood is bright, positive, lightly inspirational, forward-moving, and confident.
- Reject dark, oppressive, suspenseful, gloomy, heavy, or bad-news music for ordinary business and finance videos.
- Keep BGM far below the voice and fade it in/out.

Use user-provided approved music from the configured BGM folder. Do not rely on hard-coded generated tracks.

## SFX

Use quiet, varied effects:

```text
click
tap
whoosh
soft_hit
shine
```

Rules:

- Do not repeat one fixed sound.
- Do not trigger sounds at fixed intervals.
- Trigger sounds on material entrance, large card, full-screen insert, transition, or major turn.
- Keep SFX below the voice and usually below the importance of the spoken line.
- Use fewer SFX events than visual changes.

## Visual Layouts

Use five layout roles:

```text
face       speaker only; trust, emotion, transitions, breathing room
overlay    speaker plus supporting material or information
feature    large material shot, semi-main visual
full_card  full-screen chart, framework, checklist, or opinion card
full_broll full-screen real or video-like material cutaway
```

Avoid:

- fixed one-card, two-card, or three-card repetition;
- fixed card position and size;
- covering eyes, mouth, hands, or key expressions;
- using unrelated material just to fill space;
- making the whole video one animated slide deck.

## Talking Head And Material Ratio

For mature 1-3 minute explainers:

- Speaker visible time: about 45%-55% when enough strong material exists.
- Material-led time: about 45%-55%.
- Full-screen cutaways may fully cover the speaker while voice continues.
- Adjust the ratio when the user explicitly asks for a more face-driven or more material-driven style.

## Dynamic Information Overlays

The workflow should preserve dynamic information overlays during talking-head moments. They are useful, but they must not become tiny stickers or decorative clutter.

Use overlays for:

- key numbers;
- short claims;
- comparison strips;
- process steps;
- risk warnings;
- checklists;
- quote cards;
- mini timelines;
- compact evidence panels.

Rules:

- Use medium or large overlays.
- Keep text short and sentence-matched.
- Keep overlays away from the face, hands, and subtitle safe area.
- Vary size, position, timing, motion, and palette.
- Prefer one overlay at a time; use two for clear comparison; use three rarely with hierarchy.
- Do not use overlays as a substitute for real/video-like material cutaways.

## Full-Screen Cutaways

Cutaways are a core editing language for finance, business, technology, product, and training explainers.

Use `full_broll` for:

- real footage;
- animated GIF-like clips;
- official pages or screenshots;
- product closeups;
- company buildings and signs;
- maps and locations;
- aircraft, ships, factories, data centers, servers, chips, markets, devices, or concrete analogy scenes.

Rules:

- A cutaway may cover the speaker completely while the voice continues.
- Typical duration is 1-3 seconds.
- Use cutaways as visual punctuation around concrete nouns, turning points, examples, analogies, companies, products, locations, charts, or market scenes.
- Do not place them mechanically at fixed intervals.
- Keep total cutaway time roughly 8%-18% unless the topic is highly visual.
- Return to face when expression, trust, or emotional emphasis matters.

Minimum planning targets:

- Under 30 seconds: usually 1 real or video-like cutaway if the topic supports it.
- 30-60 seconds: usually 2-3.
- 60-180 seconds: about 3 per minute.
- Around 2 minutes: usually 5-7, with 6 as the normal target.

Counting rules:

- Only `full_broll` or true cutaway moments count.
- `full_card`, slide cards, pure chart cards, and opinion cards do not count.
- Half-screen overlays do not count unless the talking head is effectively cut away and real material becomes the main picture.

## Materials

Choose materials after speech cleanup.

Material must pass:

```text
sentence_match
visual_beauty
asset_uniqueness
dynamic_form
license_or_source_review
```

Hard rules:

- Match the exact sentence, not only the broad topic.
- Do not use generic AI, business, finance, office, warehouse, or technology visuals unless they directly map to the spoken idea.
- Do not reuse the same source asset later in one finished video.
- Do not use visually repeated templates or scenes even if filenames differ.
- Prefer no material over wrong material.
- If a strong dynamic material cannot be created for a sentence, stay on face with a strong overlay.

## Generated Scene Materials

Generated visuals are allowed when real footage, official pages, screenshots, or photos are not strong enough. They must not default to flat PPT cards.

Prefer generated visuals that look like:

- realistic photos;
- cinematic stills;
- product-use scenes;
- trading-screen scenes;
- data-room scenes;
- storefront or service scenes;
- concrete analogy scenes;
- office, factory, server, customer, or product environments.

Reject generated visuals that are:

- big text plus icons on a gradient;
- repeated poster/card templates;
- generic tech or finance wallpaper;
- broken hands or faces;
- fake unreadable UI text;
- watermark-like artifacts;
- cheap poster styling.

Do not generate text inside AI images. Add titles or labels in post-production with readable typography.

## Premium Cinematic Finance And Tech Visuals

Learn only abstract visual methods from high-quality public creators: pacing, hierarchy, material density, and polished visual language. Do not copy a creator's account identity, avatar, exact covers, images, branding, music, or wording.

Desired visual language:

- a clear main subject;
- strong depth and layered composition;
- premium editorial or documentary feel;
- clean contrast and phone-readable framing;
- concrete finance, business, or technology metaphors;
- real environments, products, screens, buildings, people, equipment, or market context.

Default generation or search aesthetic:

```text
poster-grade, cinematic editorial visual, premium finance and technology documentary style,
strong main subject, dramatic but clean lighting, depth, high contrast, polished composition,
no text in image, no watermark, no fake UI text, no deformed hands or faces, phone-readable framing
```

## Stock And API Materials

Stock/API results are candidate pools only. They are not automatically approved.

Before timeline use, record:

```text
source_site
source_url
license_url
creator
downloaded_at
query
matched_script_sentence
identity_scene_check
commercial_risk
attribution_required
match_score
beauty_score
manual_review_flags
```

Reject military, police, war, weapons, prisons, riots, violent conflict, or other strong semantic mismatches unless the script explicitly needs them.

## Hard QA Failures

Do not deliver a formal export if:

- speech is still repetitive or broken;
- captions are not aligned to final audio;
- the video looks like a PPT slideshow;
- large materials are mostly static pictures without video-like motion;
- overlays become small stickers or face-adjacent labels;
- full cards are counted as real cutaways;
- cutaways are generic or off-topic;
- materials repeat by file or by visual similarity;
- source and license records are missing for external materials;
- BGM overpowers voice or feels emotionally wrong;
- the contact sheet hides issues that appear during continuous playback.
