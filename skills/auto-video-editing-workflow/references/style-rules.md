# Style Rules

## Captions And Music

- Formal exports include burned captions unless the user asks for no captions.
- Captions come from the cleaned speech timeline, not raw ASR.
- Captions should usually be 1-2 lines, placed in the lower safe area, and must avoid the speaker's mouth, eyes, and important material text.
- Use readable bold white or yellow text with dark stroke/shadow for phone viewing.
- Highlight only important terms; do not animate every word.
- Export a no-caption clean variant when requested or useful for handoff.
- BGM should be light, upbeat, lyric-free, and far below voice.
- For finance and business content, prefer confident "money-making / momentum / positive action" energy over dark, tense, cold, or heavy corporate moods.
- Use user-provided BGM from the configured BGM folder. If the folder is empty, ask for music or export without BGM.

Reject music that feels:

- oppressive;
- gloomy;
- suspenseful;
- cynical;
- too dark;
- too cinematic;
- like bad news;
- bass-heavy enough to make speech feel heavy.

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
- Trigger on material entrances, large cutaways, transitions, and major emphasis points.
- Full or feature visuals may use `soft_hit` or `whoosh`.
- Ordinary overlays should use lighter `tap` or `click`.
- Total SFX count should be lower than visual changes.
- SFX should sit above BGM but below voice.

## Visual Layout Rhythm

Use varied roles:

```text
face
overlay
feature
full_card
full_broll / cutaway
```

Avoid:

- fixed one-card/two-card/three-card repetition;
- fixed card position and size;
- covering eyes, mouth, or key expressions;
- unrelated material just to fill space;
- making the whole video one animated slide deck.

## Speaker And Material Ratio

For mature talking-head explainers:

- Speaker visible time target: about `45%-55%` when enough strong materials exist.
- Material-dominant time target: about `45%-55%`.
- A full-screen cutaway may completely cover the speaker while voice continues.
- Trust/personality videos may lean more face-heavy.
- Product, finance, business, or evidence-driven videos may lean more material-heavy.
- Audit should record approximate `speaker_visible_ratio` and `material_dominant_ratio`.

## Content Motion Overlays

The user still wants dynamic content overlays on face moments, but not tiny stickers.

Allowed:

- large claim cards;
- number cards;
- two-step cards;
- comparison strips;
- compact report panels;
- large readable motion overlays.

Rules:

- Use them only when they support the sentence.
- Vary size, position, timing, and color.
- Keep them away from the face, hands, and subtitle safe area.
- Prefer one overlay at a time.
- Use two only for clear comparison.
- Use three rarely and only with hierarchy.
- They are not a substitute for real/video-like material.

## Full-Screen Cutaways

Use `full_broll` / `cutaway` for:

- real footage;
- screen recordings;
- product walkthroughs;
- official pages;
- company buildings;
- maps;
- market scenes;
- factories;
- stores;
- warehouses;
- cameras;
- data centers;
- chips;
- charts with real motion;
- realistic AI video or AI-generated cinematic scene clips.

Planning rule:

- Standard 60-180 second business/finance/technical explainers should aim for about 3 real or video-like full-screen cutaways per minute when enough strong material exists.
- A roughly 2-minute explainer usually lands around 5-7 cutaways, with 6 as the normal target.
- Do not force weak material. A clean face shot is better than an ugly or wrong cutaway.

Counting rule:

- `full_card`, opinion cards, pure chart cards, and slide cards do not count as real cutaways.
- Animated stills count only as video-like fallback, not true real footage.
- Audit should separate true video, screen recording, AI video, animated still, and static card counts.

## Chinese-First Cinematic Material Rule

This rule was added after the user rejected English-heavy fake UI and PPT-like visuals.

Hard requirements:

- Visual materials should be Chinese-first unless showing a real brand, stock symbol, official English page, product name, or unavoidable technical term.
- Do not create large English fake UI, English fake reports, or English fake dashboards.
- Do not make the whole video look like PPT, dashboard panels, software UI loops, or card stacks.
- The primary material direction should be realistic, cinematic, documentary, stock-footage-like, official-recording-like, or AI-video-like.
- Static images are allowed only as source material. The final insert must be strongly video-like.

Strong video-like motion requires several of these:

- noticeable push-in or lateral camera move;
- foreground/background separation;
- parallax;
- focus or depth change;
- light sweep;
- shadow movement;
- particles, smoke, screen reflection, or environment motion;
- moving people, vehicles, devices, charts, cursor, webpage, or UI elements;
- dynamic transition or foreground occlusion.

Weak motion failures:

- slight pan/zoom only;
- static image with a title;
- generic dashboard animation;
- English fake UI;
- repeated material source;
- visual beauty without sentence match;
- sentence match with ugly material.

## Material Selection Gates

Every material must pass:

```text
beauty_gate == pass
sentence_relevance_gate == pass
source_uniqueness_gate == pass
dynamic_motion_gate == pass
```

If no strong material exists, keep the face shot or generate a clean designed visual rather than inserting weak material.

## Creator References

When learning from a public creator, copy only abstract principles:

- pacing;
- material density;
- cutaway rhythm;
- visual hierarchy;
- narrative clarity.

Never put visible labels such as "X-style", "inspired by X", or creator names in the video, card titles, filenames intended for publishing, or captions.
