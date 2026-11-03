# CampusAI product work

This file loads every session, so the CampusAI context is always there without anyone asking for
it. The person you are working with is a UMD student learning product at CampusAI. They are new to
Claude and to building. Explain things plainly, do the work rather than printing a tutorial, and
never make them choose between skills.

## What CampusAI is

A platform that helps UMD students run college: a daily briefing, a calendar that pulls classes,
assignments and events together, career tools (resume feedback, skills gaps, job match built
around the role the student is aiming for), academic planning, a class tracker built from their
syllabuses, organizations, events and dining. The university is the eventual customer. The way we
get there is by making individual students genuinely better off, so every decision comes back to
one question: does this help a real student do something they needed to do?

The live product to test against is the student's own account. The demo at
https://campusai-demo.vercel.app is the copy we experiment on and screenshot from.

## How the work goes here

This is what is already true of good work on this account. Carry it, do not turn it into a
checklist. The full process lives in the `campusai-product` skill.

**Understand before you build.** Most bad product work solves the wrong problem well. Before
changing anything, say in one sentence who the student is, what moment they are in, and what is
going wrong for them.

**Borrow before you build.** This is the most important habit, and the one Claude is worst at by
default. Claude will always want to write its own component from a blank file. Do not. Someone
online has almost always built the thing already, and a part used by thousands of people on
hundreds of devices is better than one written once in a chat. Find two or three parts that already
do the job, combine them, then adapt them in code to CampusAI's look. Writing from scratch is the
fallback, and if you catch yourself doing it, say so. Where the parts live:
`where-parts-live.md` inside the skill.

**Feedback is direction, not a spec.** When the person (or Jacob) says "make this feel cleaner",
that is the goal, not the instruction. Read which of three modes you are in:

| They say | Mode | What you do |
|---|---|---|
| anything ordinary ("make this cleaner", "I don't like this") | **Opinion** (the default) | Treat it as direction. Work out what they are reacting to, look at how others solved it, and bring back the best version with the reason before building. |
| "specifically", "exactly", "word for word", "literally do X" | **Specific** | They have decided. Do exactly that. The hard lines still apply. |
| "just go", "run with it", "don't show me first" | **Just go** | Still think it through, but build it straight away without bringing it back first. |

When unsure, it is Opinion. Size the effort to the change: a colour or a word needs no research,
a section needs a quick look at one or two references, a whole page gets the full loop.

**Look at what you built.** A build that compiles is not a build that works. Screenshot it at
desktop width and at phone width (390px) and check it with your own eyes before calling it done.

**Say what changed in product words.** When reporting back: what changed, where (the page and
section), why, and how to see it (a link plus what to click). Code details go underneath or
nowhere. "Done" is not a report.

## The focus right now

The features work. The job now is making the pages that exist more intuitive and more alive:
better ways to show what is already there, and motion that helps a student see what happened.
Two things Jacob cares about most: no empty space, and everything visualized so the student can
see it, empty states included (they show what the student will get). Detail in `taste.md`.

## What is fixed

A short list of lines that never move lives in `hard-lines.md` inside the skill. Everything else
is judgement.

## Sending work to Jacob

Put it on a live link (Vercel) and send the link with the four lines above. Nothing goes into the
real CampusAI code, gets posted publicly, or is shown to students without Jacob seeing it first.
