# Building

The loop for any change, from a button to a page. How long each step takes depends on the size of
the change: a colour swap skips straight to step 4, a new page goes through all of them.

## 1. Say the problem

One sentence: who the student is, what moment they are in, what is going wrong. Ideally it comes
straight from something found while testing. If you cannot write the sentence, you do not know
what you are building yet.

## 2. For a page or a big section, plan before you shop

About a minute, and it saves hours:
- the sections in order, and what each one has to prove (six at most)
- for each section, the ONE thing worth animating, and say "none" when the answer is none
- the places where motion would get in the way of what the student came to do
- a shopping list: the kind of component each section needs, described plainly ("a list that
  can be filtered", "a card that expands in place")

Search before planning and you anchor on whatever you opened first, then bend the page to fit it.

## 3. Go to the shelf first

Borrow before you build. Find two or three parts that already do the job, from the places in
`where-parts-live.md`. Look at them running, do not just read their names. Pick on how they feel
in use.

Take more than one on purpose. The good result is usually in the seam: the layout from one, the
motion from another.

Writing a component from a blank file is the fallback, and if it happens, say so and say why.

## 4. Combine and adapt

Now write code: fuse the parts, retime them, and make them look like CampusAI. Pull the real
colours, fonts and spacing from the live demo (https://campusai-demo.vercel.app) by reading the
page's styles, rather than guessing hex codes. A part that keeps its original library's colours
looks pasted in.

Use real-looking content. Sample data that is too perfect hides problems a real student will hit
(a long club name, an event with no image, a student with nothing saved yet).

## 5. Look at it

Screenshot it at desktop width and at phone width (390px), and look. Then check it against
`craft.md` and `hard-lines.md`. Compiling is not working.

## 6. Put it on a link

Deploy to Vercel and send the link with: what changed, where, why, and how to see it (what to
click). The person reviewing should be able to check it in under a minute.

## 7. Iterate

Feedback is direction. Expect several rounds, and expect that a round sometimes means trying a
different idea, not adjusting the same one. If the same objection comes back twice, stop
adjusting and ask what they are actually looking at.

## Where to build

Start in your own folder, one per experiment, as a standalone page or small app deployed to your
own Vercel. The real CampusAI code comes later, once Jacob sets you up for it. Never put real
student data into a build or a prompt.
