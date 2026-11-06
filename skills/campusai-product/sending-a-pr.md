# Sending a PR

A pull request (a PR) is how a change gets into the real CampusAI. You put your change on its own
branch, open a PR that says what it does, and someone else reviews it before it goes in. Jacob
looks at every PR first. Then it goes to the engineering lead, who merges it.

**Why this matters.** The moment a PR is merged into `main`, it goes live on the team's dev site
for everyone working on CampusAI. So these steps happen before anything reaches `main`, and
most of them exist because of a real mistake we already made once.

**Practice on your own copy first.** Everyone runs these exact steps on their own demo copy
(`campusai-demo-<your name>`) until Jacob gives them access to the real repo. The steps are the
same in both places, so the habit carries over when you get access.

---

## For Claude: how to run this

Run the steps in order and do the work yourself. At each step, tell the person in one plain line
what you did and why, so they learn the reason. Stop and ask them only where a step says so.

Never skip a step without saying which one and why. Never merge a PR, never push to `main`, never
open a PR as a draft.

---

## 1. Start from a fresh `main`, on your own branch

```
git fetch origin
git switch -c <your-name>/<what-it-does> origin/main
```

Never work on `main` itself. A branch name says who and what: `gio/events-empty-state`.

If the work started before this step, check the branch is based on today's `main`
(`git log --oneline origin/main..HEAD` shows only your commits). If it is not, rebase onto
`origin/main` before going further.

## 2. Check nobody else is in the same files

```
gh pr list --state open
gh pr diff <number> --name-only
```

For every open PR, check whether it touches a file you are about to change. If one does, tell the
person in these words: "things might change if that PR went through", and name the PR. Two PRs
rewriting the same file is how one person's fix silently undoes another's.

## 3. Stay on the screen side

Product work changes **what the student sees and does**. It does not change **what gets saved,
where it gets saved, or who is allowed to see it.** That is backend logic, and the engineering
team owns it.

Do not touch these without Jacob saying yes first:

| Where | What it is |
|---|---|
| `src/app/api/` | the app's own server routes |
| `src/lib/backend/` | the code that talks to the backend |
| `src/lib/auth/`, `src/proxy.ts` | sign-in, permissions, security |
| `.github/`, `infra/`, `Dockerfile` | the checks and the deploy |
| `package.json`, `package-lock.json` | adding or removing libraries |
| any `.env` file | secrets. Never commit one. |

**If a feature needs something the backend does not do yet, do not build it.** Write it in the PR
as a product ask, in two parts, clearly separated:

> **What it should do.** A student who adds an event to their calendar sees it still there
> tomorrow, on any device.
>
> **One way it could work (a suggestion, ignore it if there is a better shape).** ...

Only write the second part if you actually read the backend code. If you did not, the ask is the
first sentence alone. A confident wrong suggestion costs the engineers more than no suggestion.

**Before trusting that something saved, check that something reads it.** Find the code that
reads that field and shows it. A save that says "success" while nothing ever reads it back is the
worst kind of bug, because nobody sees it. We once shipped one: the answer saved, the screen said
"saved", and the job list never changed, because the field was written under the wrong name.

## 4. Edit the real file, never paste a file over it

Your copy, the demo and any lab are behind `main` as often as they are ahead. If you copy a whole
file from one of them onto `main`, you undo every fix that landed on `main` since. Make your
change as edits inside `main`'s version of the file, keeping how `main` wires things up.

## 5. Say every removal out loud, when it happens

The moment anything comes off a screen (a button, a section, a piece of text, a feature), tell
the person right then, in three lines:

- **what was there**, by name and by page
- **what goes in its place** (nothing is fine, as long as it is on purpose)
- **what depended on it**: tests, other files, text that mentioned it

Then read the full list of removed lines before sending (`git diff origin/main` and look at every
red line). Two kinds of removal never show up in a check and only show up to a student: a
behaviour (what happens when you press something) and accessibility (labels, keyboard focus, what
a screen reader says). If one of those goes, it goes on purpose and gets said.

## 6. Run the checks, then look at it anyway

Before pushing, run what GitHub will run:

```
npm run lint
npm run type-check
npm run test
npm run build
```

Fix everything that fails. If something was already failing on `main` before your change, show
that (run the same check on a clean `main`) and say so, rather than ignoring it.

**Green checks are not "it works."** A page can pass every check and still render blank. Run the
app, open every page you changed at desktop width and at phone width (390px), press the things you
changed, and check them against `evaluating.md`.

## 7. Walk it with the person, feature by feature

Before opening the PR, get the list of every page and component the change touches from the diff
(`git diff origin/main --stat`), not from memory. Go through them with the person one at a time:

1. **What it is**, named the way it looks on screen.
2. **How to test it**: the link and the clicks.
3. **What should happen**, in the words on the screen.

Wait for their answer before the next one. They should end this knowing exactly what is in the PR,
and this is also where you both catch something in it that should not be, or something missing
you both assumed was there.

## 8. Write the PR

The body, in this order:

0. **`Base task <number>`** on the first line, if the work has a Base task. Write the number as
   plain words, never `#123` (on GitHub that means something else).
1. **How to test**, at the top. A link, then one small table per feature from step 7: the action
   on the left, what appears on screen on the right, one thing per row. Every page the change
   touches gets a table, or a line saying why it cannot be tested.
2. **Removed or needs cleanup**, its own section with its own heading. Everything from step 5.
   If nothing was removed, say "Nothing removed."
3. **What changed and why**, in product words.
4. **Backend ask**, if any, in the two-part form from step 3.

Write the "how to test" rows from what you actually saw when you clicked through, never from what
the code should do. A row that sends a reviewer looking for something that is not there is worse
than no row.

One piece of work is one PR. Do not split it into several small ones; pieces get lost between PRs.

## 9. Open it, wait for green, send to testing

```
git push -u origin <branch>
gh pr create --base main --title "<what it does, in plain words>" --body-file <body.md>
```

- **Ready, never a draft.**
- **Always aimed at `main`.**
- **Never merge it yourself**, even if GitHub lets you.

Then wait for every check on the PR to finish (`gh pr checks <number> --watch`). It is not sent
until they are green. If one fails, fix it and push again; the PR updates itself.

Then send it to Jacob: the PR link and the four lines (what changed, where, why, how to see it).
He reviews it first, then it goes to the engineering lead. When it is ready to test, it goes to
the Product group in Base under **Testing**.

## When something goes wrong

- **You pushed to `main` by mistake**: stop, do not try to undo it yourself, tell Jacob right away.
- **You committed a secret** (a key, a password, a `.env` file): tell Jacob right away. Deleting
  the file in a new commit does not remove it from history.
- **A check is red and you cannot tell why**: open the check on GitHub, read the first error, and
  send it to Jacob with the PR link.
