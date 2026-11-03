# Running your own elevation pass

An elevation pass takes something already in CampusAI and finds a better way to show it and move
it. Not a new feature: the same thing, more intuitive and more alive. This is the main way you
will contribute, and it is the building loop done for real.

**The focus right now:** the product's features work. What it needs is for the current pages to be
easier to understand at a glance and to have more motion that helps. Every pass should serve that.

## The steps

1. **Pick one page.** Events, Organizations, Job Match, the briefing, the calendar, the class
   tracker. One page per pass.
2. **Go through it as a student and list the weak moments.** Something static that should react
   when pressed. Something explained in words that could be shown. An empty page with nothing to
   show. A list that is hard to scan. Write each one as a sentence.
3. **Find parts for each moment.** In this order:
   - `elevations-catalogue.md` first. It may already be built for that exact page.
   - Then the libraries in `where-parts-live.md`.
   - Then the creators in `creators.md`, and anything you saved from your feed.
   Take two or three per moment.
4. **Rebuild them on CampusAI's real look.** Pull colours, fonts and content from the demo
   (https://campusai-demo.vercel.app). Use the demo's real events, clubs and jobs as content, not
   lorem ipsum.
5. **Put every candidate on one page, all visible and running.** Not a list of descriptions.
   Jacob judges by seeing.
6. **Write each one up as a card:**
   - **Name:** what it does, in words ("Add flies from the button to My Calendar").
   - **What:** one sentence on what happens.
   - **Where:** the page and the spot in CampusAI.
   - **Today:** what is there now, so the difference is obvious.
   - **Source:** the original, who made it, and its licence.
7. **Deploy it and send Jacob the link.** He grades, and the best ones get a home in the product.

## How to tell a good pass

- It brings several options, not one. Volume matters.
- Every option is visible and running.
- Each one makes something clearer for the student, not just more impressive.
- It passes `taste.md` and `hard-lines.md` before anyone else sees it.
