# Finding inspiration

Inspiration answers one question: how did someone good already solve this? It comes before parts.
`where-parts-live.md` lists the places. This file is how to use them.

## How much to look

Size it first. Most changes need no research at all.

| The change | Look at |
|---|---|
| A tweak: a colour, spacing, copy, one icon | Nothing. Do it well against `taste.md` and move on. |
| One component or one section | One or two references for that one thing. |
| A page, a new surface, or "make it feel like X" | The full loop below. |

When unsure, pick the smaller size. Research costs time and rarely changes a small fix.

## The loop, for page-sized work

1. **Plan before you look.** Say the problem and plan the sections (`building.md`, steps 1 and 2).
   You go looking for answers to that plan, not for something pretty. Look first and you anchor
   on the first nice thing you see.
2. **Search by the job, not the brand.** "Filter bar for a long list", "empty state for saved
   jobs", "onboarding, one question per screen". Searching a brand name only finds what you
   already know.
3. **Look in two kinds of places, on purpose.**
   - *Product:* how real apps solve the same screen. Mobbin first, Inspo for real web products.
   - *Feel:* motion and websites. The galleries, Motionsites, the creators' feeds.

   Product alone gives you a page that works and feels dead. Feel alone gives you a page that
   looks good and does not work. Use both.
4. **Keep three to five.** For each one, write one line on exactly what is good about it: the
   layout, the way it moves, how it handles an empty list. "It looks clean" is not an answer.
5. **Combine them.** Take the best part of each into one recommendation, in CampusAI's look
   (`taste.md`), and say which reference each piece came from. Copying one reference whole is not
   the goal.
6. **Build from parts** (`building.md`, step 3), then put your result next to the references and
   look at both.

## Reading a reference

- **Take how it is arranged and how it moves.** Not its colours, fonts or logo. Those come from
  the CampusAI demo.
- **Real shipped sites break rules.** Take the composition, not every choice they made.
- **Look at it running, not just a screenshot.** The motion, the loading state and the empty
  state are often the best part, and a still hides all three. Click through the flow if you can.
- **Check it on a phone and with nothing in it.** That is where most references stop being good.
- **A reference never outranks what the person already told you.** If Jacob has asked three times
  for a full, dense layout and the reference has lots of air, adapt the reference. We learned
  this on a card that copied Mercor's empty space and got sent back.

## When the same thing misses twice

Stop guessing. Put three or four real references on one page, side by side, each with one line
on what it does, and let the person pick or mix. A third guess usually lands where the first two
did. A board of real examples gets a decision in one round.

## Keep the range wide

Do not reach for the same two sites every time. If your last few things came from the same place,
look somewhere else first. The galleries in `where-parts-live.md` are split by job so there is
always a new place to start.

## How Claude gets to each source

Claude reads code well but cannot see a page unless it opens or screenshots it. So every
reference has to reach it as a real image or a real page.

| Source | How |
|---|---|
| **Inspo** (connected, free) | Real production websites: screenshots, colours, fonts, page structure. Start with `recommend` and the brief, then one or two `search_screens`, then `get_screen` on the three to five you keep. That is a complete study. More searches cost more than they find. |
| **Mobbin** | In the browser. Claude's Mobbin connection needs a paid Mobbin plan, so on the free plan you search mobbin.com yourself, screenshot what you like and drop it into the chat. On a paid plan, connect it once: `claude mcp add --scope user --transport http mobbin https://api.mobbin.com/mcp` |
| **A live site you like** | Give Claude the link. It opens it with chrome-devtools, screenshots it, and reads the real colours, fonts, spacing and timing from the page instead of guessing them. |
| **A gallery** | Open it in the browser, screenshot what stops you, paste it in. |
| **A reel or a video** | Claude cannot watch an Instagram or X link. Screenshot the frames that matter, or screen-record it and say what you liked. |

## Asking Claude

Not "make this look better". Instead:

> Find how three real products show [the job]. Use Inspo and the screenshots I paste. For each
> one, tell me in one line what is good about it. Then recommend one version that combines them
> in CampusAI's look, and say where each piece came from.

## Saving what you find

When something stops you in a gallery or your feed, save it with one line on why. Send Jacob
anything that could help a student, with that line. A save with no reason is forgotten in a week.
