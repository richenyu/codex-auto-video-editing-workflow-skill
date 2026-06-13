# Style Rules

## Captions And Music

- Default final exports should include burned-in captions unless the user asks for a no-caption version.
- Generate captions from the cleaned speech timeline, not from unreviewed raw ASR.
- Captions should usually be 1-2 lines, placed in the lower safe area, and must avoid the speaker's mouth, eyes, and important material text.
- Use readable bold white or yellow text with dark stroke/shadow for phone viewing.
- Highlight only important terms; do not turn every word into animated emphasis.
- Write `.srt` or `.ass` as an intermediate file when useful, especially if the user may revise captions later.
- Export a no-caption clean variant when the user explicitly asks or when the video is intended for further editing in another app.
- Default final exports should include light, upbeat, lyric-free BGM unless the user asks for a no-BGM version.
- Default BGM mood should be bright, positive, lightly inspirational, and forward-moving. For finance and business videos, prefer "making money / momentum / confidence" energy over dark, tense, cold, or heavy corporate moods.
- Keep BGM far below the voice; if the voice or room noise is messy, reduce BGM further or skip it.
- Fade BGM in and out; if looping is needed, hide loop points with fades.
- Add light SFX by default only when appropriate.

Default local BGM library:

```text
<configured-bgm-folder>
```

Default selection rule:

```text
Use user-provided music files currently inside the configured BGM folder.
Do not rely on hard-coded generated tracks.
If several files exist, choose by filename, mood, duration, and topic fit.
If the folder is empty, do not invent a default; ask the user to add music or export without BGM.
```

Music rejection rules:

- Reject tracks that feel oppressive, gloomy, suspenseful, cynical, too dark, too cinematic, or like bad news.
- Reject tracks whose bass or low mids make the spoken content feel heavy.
- Prefer major-key, light percussion, clean plucks, bright piano/synth, gentle claps/snaps, and an upward melodic contour.
- For finance content, the emotional target is optimistic but not childish: confident, clean, energetic, and money-making.
- Previously generated BGM tracks should not be used as defaults. The user should provide preferred music in the configured BGM folder.

## SFX

Use varied, quiet effects:

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
- Trigger on material entrance, large card, full-screen insert, or major turn.
- Full or feature visuals may use `soft_hit` or `whoosh`.
- Ordinary overlays should use lighter `tap` or `click`.
- Total SFX count should be lower than visual changes.
- SFX should sit above the BGM but below the voice.

## Visual Layouts

Use four layout roles:

```text
face    -> talking head only; trust, emotion, transition, breathing room
overlay -> small or medium supporting material
feature -> large material shot, semi-main visual
full_card  -> full-screen chart, framework, checklist, or opinion card
full_broll -> full-screen real material cutaway, regular high-impact visual reset
```

Avoid:

- fixed one-card, two-card, or three-card repetition;
- fixed card position and size;
- covering eyes, mouth, or key expressions;
- using unrelated material just to fill space;
- making the whole video one animated slide deck.

## Attribution And Style References

- When learning from a public creator, copy only abstract editing principles: pacing, story structure, material density, cutaway rhythm, and visual hierarchy.
- Never place visible labels such as "X-style", "inspired by X", "creator-style explainer", "mimicking X", or any creator/person name on cards, overlays, captions, filenames intended for publishing, or in-video titles.
- Public-facing cards should speak in the user's own voice and brand. Use neutral topic labels like "market view", "key signal", "watchlist", "earnings logic", or direct content copy.
- If a draft asset contains a reference-creator name or style label, it must fail QA and be regenerated before final export.

## Full-Screen Cutaways

Do not assume the speaker must always remain visible. A mature explainer can cut away to full-screen materials while the speaker's voice continues.

Use `full_broll` or `cutaway` for:

- real footage;
- animated GIFs;
- photos;
- official pages or screenshots;
- product closeups;
- company buildings and signs;
- maps, locations, aircraft, ships, factories, data centers, servers, chips, or market scenes.

Rules:

- A cutaway may cover the talking head completely.
- Default cutaway duration is roughly 1-3 seconds.
- Target density is about 3 real full-screen cutaways per minute for finance, business, and technical explainers when relevant material exists.
- A 2-minute video should usually land around 5-7 real full-screen cutaways, with 6 as the default planning target.
- Use cutaway timing as visual punctuation: anchor to concrete nouns, turning points, analogies, examples, company names, products, locations, charts, or market scenes.
- Do not place cutaways at mechanical intervals. Let some gaps be short and some longer so the rhythm feels edited, not automated.
- Keep total full-screen cutaway time roughly 8-18% of the video unless the topic is highly visual.
- Use cutaways when the spoken sentence names a concrete object, company, product, place, event, or analogy.
- Do not force every material into a half-screen or floating card.
- Keep the voice clear and continuous while the picture cuts away.
- Return to `face` when expression, trust, or emotional emphasis matters.
- Separate `full_card` from `full_broll` in reports when possible, so full-screen cards do not masquerade as real material cutaways.

Minimum count rules:

- Videos under 30 seconds should usually include 1 real full-screen cutaway unless the whole piece is intentionally face-driven.
- Videos from 30-60 seconds should usually include 2-3 real full-screen cutaways.
- Standard 60-180 second talking-head videos should aim for about 3 real full-screen cutaways per minute.
- Finance, business, or technical explainers around 2 minutes should usually include 5-7 real full-screen cutaways, with 6 as the normal target.
- Longer explainers should usually include 2-3 real full-screen cutaways per minute, adjusted by topic density and material quality.
- If strong real materials are not available, use fewer cutaways and keep the face shot rather than forcing weak or unrelated visuals.

Counting rules:

- Only `full_broll` / `cutaway` counts toward the minimum.
- `full_card`, full-screen slide cards, pure opinion cards, and pure chart cards do not count.
- Half-screen cards, floating overlays, and ordinary `feature` materials do not count unless the talking head is effectively cut away and real material becomes the main picture.
- Real cutaway materials include real photos, footage, GIFs, official pages, announcements, product shots, buildings, locations, maps, news scenes, licensed stock media, and sufficiently realistic AI-generated scene footage.

## Talking-Head Background

- Default subtle blur and dim on the background.
- Keep face, eyes, mouth, hands, and expression clear.
- Disable blur if the original background is already clean or if the user asks to preserve it.

## Materials

Choose materials after transcript cleanup:

- Match materials to the current sentence or idea.
- Treat beauty and relevance as equal gates. A material must be both good-looking and meaningfully connected to the spoken line.
- Use 0, 1, 2, or 3 materials depending on rhythm.
- Prefer no material over wrong material.
- Use full-screen material only for strong nodes.
- If reusing a material, vary crop, motion, zoom, highlight, or duration.

## Generated Scene Materials

Generated visuals are allowed, and sometimes preferred, when real footage, official pages, screenshots, or photos are not strong enough. But generated visuals must not default to flat PPT-style cards.

Prefer generated visuals that look like:

- realistic photos, cinematic stills, product-use scenes, office scenes, trading-screen scenes, data-room scenes, storefront/service scenes, or concrete analogy scenes;
- technology visuals with real desks, monitors, code screens, devices, servers, teams, or product interfaces;
- business and finance visuals with market screens, company buildings, investors, meetings, charts on real displays, or economic scene context;
- local-service visuals with real environments, workers, customers, tools, delivery, quotes, or before/after scenes.

Reject generated visuals that are merely:

- big text plus icons on a gradient background;
- repeated poster/card templates with different words;
- generic tech or finance wallpaper that does not match the current sentence;
- AI-looking images with broken hands, warped faces, unreadable fake text, watermark-like artifacts, or cheap poster styling.

A generated scene can count as `full_broll` / `cutaway` only when it behaves like a large photo, scene, product shot, or video insert: sentence-matched, beautiful, full-screen or dominant, and animated with push-in, pan, detail zoom, or another subtle camera move. Pure title cards, opinion cards, chart cards, and infographic slides remain `full_card`, not real cutaways.

## Premium Cinematic Finance And Tech Visuals

The user provided a reference creator profile whose visuals feel polished, cinematic, high-end, and strongly themed. Learn only the abstract visual method. Do not copy that creator's account identity, avatar, exact cover text, exact images, branding, packaging, or visible labels.

Distilled method:

- Every strong visual needs a clear main subject: company building, product, trading screen, city, executive silhouette, industrial equipment, data wall, workplace, customer scene, or a concrete analogy scene.
- Visuals should feel like premium editorial covers, cinematic stills, or high-end documentary inserts, not template slides, PPT backgrounds, or random stock images.
- Use layered composition: foreground subject, midground information, background environment, strong depth, clean framing, and phone-readable contrast.
- Dark cinematic atmosphere is allowed when it feels premium: side/back light, controlled haze, high contrast, red/cyan/gold accent light. Reject muddy, low-resolution, over-dark, cluttered, or cheap-looking frames.
- Do not generate text inside AI images. Prefer clean no-text images, then add any title or label in post-production with readable typography. Reject fake UI text, fake logos, watermark-like artifacts, and broken details.
- Map abstract finance/business ideas into concrete visual metaphors: housing prices -> city/buildings/market observer; capital -> stage/trading screen/fund flow; AI/tech -> products, chips, servers, work screens, industrial scenes.
- In talking-head videos, use this style mainly for roughly 3 full-screen cutaways per minute and occasional dominant 60%-75% `feature` shots. Do not turn the entire video into a sequence of posters.
- Beauty is the first gate and relevance is the second gate. Ugly but relevant material cannot be used as filler; replace, recrop, redesign, animate, or generate a better scene.

Default generation/search aesthetic prompt:

```text
poster-grade, cinematic editorial visual, premium finance/technology documentary style,
strong main subject, dramatic but clean lighting, depth, high contrast, polished composition,
no text in image, no watermark, no fake UI text, no deformed hands/faces, phone-readable framing
```

## Material Quality Gate

Every image, GIF, video, screenshot, page capture, chart, or generated visual must pass both gates before use:

- Beauty gate: clear, sharp, clean, well-framed, modern, not visually cheap, not awkwardly cropped, and readable on a phone.
- Relevance gate: directly tied to the sentence being spoken, such as a named company, product, market, location, analogy, object, event, or data point.
- If a material is relevant but ugly, replace it with a better source, crop, redesign, animate, or generate a cleaner visual.
- If a material is beautiful but not relevant, reject it.
- For official pages or screenshots, crop to the meaningful area, remove clutter where possible, and add subtle motion or highlight only when it improves readability.
- Avoid watermarks, random stock-photo feeling, dark muddy scenes, low-resolution images, messy UI, tiny unreadable text, and visuals that make the video look amateur.
- During QA, inspect representative frames for visual attractiveness and relevance, not only technical correctness.

## Video-Like Materials

Static images are allowed, but avoid slideshow feeling.

Prefer:

- real or simulated screen recordings;
- webpage or GitHub scrolling;
- mouse movement and button clicks;
- code typing or terminal running;
- interface switching;
- chart or data animation;
- photo and video cutaways;
- local zoom, pan, or highlight on screenshots.

If only static screenshots exist, animate them with push-in, pan, highlight, cursor movement, or small chart motion.

## Hard QA Failures From Local Training

For this user's automated talking-head workflow, the following are hard failures, not soft preferences:

- Visual accents, chips, or small supporting materials all appear at the bottom or in one fixed position.
- Every visual moment shows only one material; rhythm must include 0/1/2/3 material moments when the topic supports it.
- A `full_card`, slide, opinion card, or pure chart is counted as `full_broll` / `cutaway`.
- A 2-minute business, finance, or technical explainer lacks a plan for roughly 5-7 real or video-like full-screen cutaways, with 6 as the normal target.
- The contact sheet only proves one good frame while the middle of the video remains mostly talking head plus small cards.
- A post-processing pass removes or hides strong material shots that were already correct in the smart-edit base.
- Tiny pill labels, stickers, or floating text chips are placed on or near the speaker's face.
- Tiny text chips are used as a substitute for real visual material, large cards, video-like assets, or full-screen cutaways.

If any of these happen, do not deliver as final. Revise the edit, regenerate the contact sheet, and re-run technical QA.

## No Tiny Sticker Labels

Do not add small pill-shaped labels, sticker-like text chips, or tiny floating captions as visual accents on the talking-head frame. These look cheap and can damage the speaker's image, especially when they sit on the face.

Allowed alternatives:

- clean talking-head frame with no extra material;
- large, well-designed feature cards;
- half-screen or large screenshot panels;
- full-screen `full_broll` / `cutaway`;
- video-like material such as UI recordings, webpage scrolls, cursor movement, chart animation, GIFs, or short footage.

Any text-only emphasis must be large enough to feel intentional, designed as a proper card or full-screen explanation, and must avoid the speaker's eyes, nose, mouth, and subtitle area.

## Animate Large Material Shots

Large material shots should default to motion, not static slides. If a material can reasonably become an animation, GIF-like clip, UI recording, webpage scroll, chart animation, cursor movement, or short video, use that instead of a still image.

Priority:

- software/product topics: UI operation, cursor movement, button clicks, text input, page switching, list expansion;
- business/data topics: number rolling, chart growth, progress rings, comparison bars, flow lines, highlighted report/page areas;
- local-service or scene topics: short footage, GIFs, photo push-in, pan, highlight, or detail zoom;
- frameworks/processes: steps appearing progressively, nodes lighting up, arrows moving, not one static card held too long.

Pure static cards are fallback only. When a still image must be used, add subtle push-in, pan, highlight, crop movement, light sweep, or another small motion treatment.

Hard QA failure: the contact sheet looks acceptable, but playback reveals the large materials are mostly static slideshow cards with no motion or video-like behavior.

## Multi-Material Large Layouts

- Large material shots may include 1, 2, or occasionally 3 simultaneous materials when it improves explanation, comparison, process clarity, or evidence density.
- Valid layouts include primary material plus supporting material, side-by-side comparison, before/after comparison, top primary plus lower support strip, full-screen base material plus side detail, speaker PIP plus two material panels, and two synchronized animated panels.
- Multi-material layouts must still feel large, polished, and readable. They must not become tiny stickers, small pill labels, floating text chips, or decorative clutter.
- Every material must be tightly matched to the current sentence. Do not fill extra slots with unrelated icons, generic stock visuals, or weak decorative elements.
- Maintain visual hierarchy: the primary material usually owns 60%-75% of the visual area, while supporting material owns 25%-40%. With three elements, one must clearly remain primary.
- Panels can be animated with subtle synchronized motion, such as scrolling, progressive highlights, compare switches, zoom-ins, or number/chart movement.
- QA should fail if suitable comparison/process/evidence moments are always single-material with no layout variation, or if a 2/3-material layout is cramped, unreadable, off-topic, or lacks hierarchy.
