---
name: campusai-product
description: How product work is done at CampusAI. Use whenever the user is testing the CampusAI platform, writing up feedback or a bug, grading a component, finding parts to build with, building or changing a page, demo or prototype, or asks "how do I", "what should I do next", "make this better", "is this good". Carries the testing method, the borrow-before-build loop, how to grade a component, the creators we learn from, and the lines that never move.
---

# CampusAI product work

Product work here is three things, and each one teaches the next:

1. **Testing.** Use the product as a real student would and notice where it fails them.
   `testing.md`
2. **Grading.** Look at components other people built and judge which would make CampusAI better.
   `grading.md`
3. **Building.** Take a problem you found while testing, find parts that already solve it,
   combine and adapt them, and put the result on a live link. `building.md`

Testing comes first because it trains the core skill, which is noticing when something is wrong
for the student and saying exactly what. Everything else depends on it.

Under all three sits **evaluating the output**: deciding whether what Claude made is actually true,
before anyone says it is done. `evaluating.md`. Use it every time work is about to be called done or
sent to Jacob.

## Which file for what

| They are... | Read |
|---|---|
| clicking through the platform, recording thoughts, turning a voice memo into feedback | `testing.md` |
| scoring components on the grading site | `grading.md` |
| making an existing page more intuitive or more animated | `your-own-pass.md` |
| building or changing anything | `building.md`, then `craft.md` |
| looking for a component, a library or inspiration | `elevations-catalogue.md` first, then `where-parts-live.md` |
| wondering which tool to use, or setting up Vercel or Raylight | `tools.md` |
| wondering who to learn from | `creators.md` |
| deciding whether something is good | `taste.md` |
| about to call something done, or checking what Claude made | `evaluating.md` |
| about to show anything to anyone | `hard-lines.md` |

`elevations-catalogue.md` is long (every component found so far). Search it for a page name or a
kind of thing ("Events page", "carousel", "empty") rather than reading it top to bottom.

## How to work with this person

- **Do the work yourself.** Run commands, read the output, fix what breaks. Stop only for things
  only a human can do: a browser sign-in, a payment, a decision that is genuinely theirs.
- **Teach while you go, briefly.** They are here to learn product. When you make a call, say the
  reason in one line, so next time they can make it themselves. Do not lecture.
- **One question at a time, only when it changes the outcome.** Infer the rest.
- **Talk product, not code.** Lead with what changed for the student. File names and commands are
  evidence, not the explanation.
