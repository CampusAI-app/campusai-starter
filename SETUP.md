# Set up a new CampusAI product teammate

**For Claude.** The person running you asked to be set up with the CampusAI starter kit, most likely
by pasting a line from https://campusai-starter.vercel.app. This file is the whole setup. You may
be reading it from that website; that is fine, because Part 3 downloads the rest of the kit to
their Mac. When you finish, they will have every tool, account, skill and connection the product
team uses, their own copy of the CampusAI demo running on their Mac and on a live link, and they
will know the three habits the work runs on. The kit also keeps itself up to date from then on.

They are new to the terminal and to Claude Code. So:

- Start with a one-line hello and what the next 30 minutes look like, then begin Part 1.
- Do one step, say in one plain sentence what it did, then move on. No walls of text.
- Run the checks and commands yourself. Only hand them a step when it needs them: a browser
  sign-in, their Mac password, or a click on a website.
- **Sign-ins.** For any login that prints a link or a one-time code (`gh auth login`,
  `npx vercel login`, `supabase login`), run it in the background, read the output for the link and
  code, give them both, and wait for them to say they are done in the browser. Then check it worked.
  If that does not work where you are running, have them run the command themselves in the Terminal
  app.
- If a step fails, read the error, fix what you can, and explain the fix in plain words. If it
  cannot be fixed, skip it, say so, and keep going. Jacob finishes anything left with them.
- This setup is for a Mac. On Windows, stop after Part 1 and tell them to message Jacob.

If you cannot run commands (for example, they pasted this into the Claude website), give them one
command at a time to paste into the Terminal app, and have them paste back what it prints.

Keep a short list as you go of anything skipped or broken. It goes in the recap at the end.

---

# Part 1. The tools

## 1. Homebrew, Node, Git, GitHub CLI, Supabase CLI

Check what is already there: `brew --version`, `node -v`, `git --version`, `gh --version`,
`supabase --version`.

- **Homebrew** installs everything else. If `brew --version` fails, it needs their Mac password, so
  have them paste this into the Terminal app and follow what it prints (including the two lines it
  asks them to run at the end):

  ```bash
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  ```

  If macOS offers to install the developer tools along the way, they accept and wait.
- **Then the rest, in one go:**

  ```bash
  brew install node gh supabase/tap/supabase
  ```

Check: `node -v` is 20.9 or newer, and `git`, `gh` and `supabase` all print a version.

- **Google Chrome.** Claude uses it to look at what it builds. If
  `/Applications/Google Chrome.app` does not exist, run `brew install --cask google-chrome`.

## 2. Claude Code on the command line

They may be using Claude Code in the desktop app. The command line version is still needed, because
it is what installs plugins and connections. If `claude --version` fails:

```bash
curl -fsSL https://claude.ai/install.sh | bash
```

Check: `claude --version` prints a version. If it says command not found, open a new Terminal
window, or add the folder the installer names to their PATH.

---

# Part 2. The accounts

They should already have a GitHub account, because Jacob needed their username to invite them. Make
the rest with **Continue with GitHub** so there is one login for everything.

## 3. Sign in to GitHub

Run `gh auth status`. If they are not signed in, sign them in (see Sign-ins above):

```bash
gh auth login --hostname github.com --git-protocol https --web
gh auth setup-git
```

Then set who their saved work is from. **This step matters:** Vercel refuses to deploy work whose
author does not match a real GitHub account, and it cost the last person a broken deploy.

```bash
gh api user --jq '.login, .id, .name'
git config --global user.name "<their name, or login if name is empty>"
git config --global user.email "<id>+<login>@users.noreply.github.com"
```

## 4. Vercel

Vercel puts anything they build on a link anyone can open. If they do not have an account, they
sign up at vercel.com with Continue with GitHub (the free Hobby plan). Then sign them in:

```bash
npx vercel login
```

Check: `npx vercel whoami` prints their username.

## 5. Supabase

Supabase is the database behind a small app, for when something they build needs to save data. If
they do not have an account, they sign up at supabase.com with Continue with GitHub. Then:

```bash
supabase login
```

Do not create a project yet. The free plan allows two, so save them for a real build.

## 6. Base and Elevations

Base is the team's own platform: tasks, testing and updates. Jacob sends a Base invite by email.
Ask whether it has arrived. If yes, they open it, set a password, and sign in at
https://base-one-fawn.vercel.app. They will see three things: **Tasks**, **Updates** and **Testing**.
That is right; their account only shows what is theirs.

The same email and password sign them in to https://elevations.vercel.app, where the team grades
components.

If the email has not come yet, skip this step. Nothing else depends on it.

---

# Part 3. Teach Claude how we work

Everything in this part loads in new chats only. That is why Part 5 ends with a fresh session.

## 7. The kit, the CampusAI skill and context, and updates

1. **Download the kit.** It lives in a public repo, and everything below reads from it, so an
   update Jacob pushes reaches them on its own:

   ```bash
   git clone https://github.com/CampusAI-app/campusai-starter.git ~/campusai-starter
   ```

   If `~/campusai-starter` already exists, run `git -C ~/campusai-starter pull` instead.
2. **Link the CampusAI skill** (link, do not copy, or it stops updating):

   ```bash
   mkdir -p ~/.claude/skills && ln -s ~/campusai-starter/skills/campusai-product ~/.claude/skills/campusai-product
   ```

   If something is already at that path, move it aside first (add `.old` to its name) and say so.
   Check: `~/.claude/skills/campusai-product/SKILL.md` exists.
3. **Load the CampusAI context in every chat.** Add this one line to the end of
   `~/.claude/CLAUDE.md` (create the file if it does not exist, never replace what is there):

   ```
   @~/campusai-starter/CLAUDE.md
   ```

   Check: read the file back and confirm the line is in it once, not twice.
4. **Turn on updates.** Add a SessionStart hook to `~/.claude/settings.json` that runs the kit's
   update script each time Claude starts. Merge it in: read the file first, keep every setting and
   hook already there, and add this to `hooks.SessionStart`:

   ```json
   { "matcher": "startup|resume",
     "hooks": [ { "type": "command", "command": "bash \"$HOME/campusai-starter/scripts/update.sh\"", "timeout": 30 } ] }
   ```

   Check: the file is still valid JSON, and `bash ~/campusai-starter/scripts/update.sh` runs
   without an error (it prints nothing when the kit is already up to date).

Tell them in one sentence: from now on, when Jacob improves the kit, their Claude picks it up the
next time it starts, and says so when it does.

## 8. The skill packs we borrow from

Free and open source, from designers we trust (`Skill sources.md` says who and why). All three are
plain instructions, no code that runs.

```bash
npx -y skills add emilkowalski/skills --global -a claude-code -s '*' -y
npx -y skills add jakubkrehel/skills --global -a claude-code -s '*' -y
npx -y skills add Jakubantalik/transitions.dev --global -a claude-code -s '*' -y
```

`--global` matters. Without it the skills install into the current folder only and quietly do
nothing anywhere else, even though it prints "Done".

Check: `~/.claude/skills` now has folders like `emil-design-eng`, `better-layout` and
`transitions-dev`.

## 9. The plugin

Anthropic's own design plugin. It helps Claude commit to a clear look before it builds:

```bash
claude plugin install frontend-design@claude-plugins-official
```

If it cannot find the marketplace, run `claude plugin marketplace add anthropics/claude-plugins-official`
and try again. Check: `claude plugin list` shows it.

## 10. The connections

These let Claude search for parts, look things up, check its own work and act for them while they
build. This is their head start: the same shelves the team's own Claude uses, cut down to the best.

**Components.** Eight of the best free component libraries, searchable in one place, so Claude can
find a part and pull its real code instead of writing one from scratch: Magic UI, React Bits,
Motion Primitives, Animate UI, SmoothUI, beUI, prompt-kit (chat and AI pieces) and Cult UI. About
3,000 components between them. The list lives in the kit at `parts/components.json`, so a library
Jacob adds or swaps arrives with the next update:

```bash
claude mcp add --scope user components -- sh -c 'cd "$HOME/campusai-starter/parts" && exec npx -y shadcn@latest mcp'
```

Do not simplify that command. The connection only finds the list from the folder it is started
in, which is why it changes folder first.

**Looking things up.** Free, no account:

```bash
claude mcp add --scope user --transport http motion https://mcp.motion.dev/mcp
claude mcp add --scope user --transport http originkit https://mcp.originkit.dev/mcp
claude mcp add --scope user --transport http inspo https://inspomcp.dev/api/mcp
claude mcp add --scope user --transport http context7 https://mcp.context7.com/mcp
claude mcp add --scope user --transport http deepwiki https://mcp.deepwiki.com/mcp
```

- **motion**: the Motion animation docs and examples. Most of what the team has taken came from here.
- **originkit**: a few hundred more ready-made web components.
- **inspo**: real production websites (screenshots, colours, fonts, page layouts) to look at
  before designing a page.
- **context7**: up-to-date docs for any library, so Claude does not code from memory.
- **deepwiki**: ask questions about any public GitHub repo before borrowing from it.

**Looking at what it built.** Lets Claude open a page, screenshot it and check it at phone width:

```bash
claude mcp add --scope user chrome-devtools -- npx -y chrome-devtools-mcp@latest --headless --isolated --no-usage-statistics
```

**Their own accounts.** These ask for a browser sign-in the first time Claude uses them:

```bash
claude mcp add --scope user --transport http vercel https://mcp.vercel.com
claude mcp add --scope user --transport http supabase https://mcp.supabase.com/mcp
claude mcp add --scope user --transport http raylight https://api.raylight.app/mcp
```

- **Raylight** is motion design in the browser, for short product videos and animated demos. Claude
  drives it directly. It needs an account at raylight.app (sign up free). The free plan allows 50
  Claude actions a week and puts a small badge on exports, which is fine for learning.

In a new chat, typing `/mcp` shows each connection and lets them sign in. Tell them that, but do not
wait on it now.

Check: `claude mcp list` shows all ten. The components one can take a minute to say connected
the first time while it downloads.

## 10b. Optional extras

Ask about each. Skip any they do not want.

- **21st.dev**, a big community component library. It needs a free account and a key from
  21st.dev, and the free plan only pulls the code for two components a day (searching is
  unlimited). If they want it, follow 21st.dev's own setup steps for Claude Code.
- **The CampusAI studio**, if they will make videos or graphics. It is the team's one place for
  that, and it installs its own skills and connections:

  ```bash
  cd ~ && git clone https://github.com/CampusAI-app/campusai-studio.git && cd campusai-studio && bash install.sh
  ```

---

# Part 4. Their copy of the CampusAI demo

The demo is the whole product running on sample data, with no login and no keys. Their copy is
private and theirs: they can change anything, and nothing they do touches the real product or
Jacob's demo.

## 11. Accept the invite

Jacob invited them to a private repo named `campusai-demo-<their first name>` on his GitHub
(`jdfeigenblum`). Find it:

```bash
gh api user/repository_invitations --jq '.[] | {id, repo: .repository.full_name, from: .inviter.login}'
```

Tell them which invite you found (from jdfeigenblum, to `campusai-demo-...`). Once they say yes:

```bash
gh api -X PATCH user/repository_invitations/<the invite id>
```

If they already accepted it, `gh repo list jdfeigenblum` will not show it, but
`gh repo view jdfeigenblum/campusai-demo-<name>` will. If there is no invite at all, tell them to
send Jacob their GitHub username, and do Part 5 without the demo for now.

## 12. Download it and run it

```bash
cd ~ && gh repo clone jdfeigenblum/campusai-demo-<name>
cd ~/campusai-demo-<name> && npm install
```

The install takes a couple of minutes. Warnings are normal. Only stop on a line that says `ERR!`.

Start it in the background from that folder:

```bash
npx next dev --turbopack -p 3481
```

When it says it is ready, they open http://localhost:3481. They should see the dashboard for a
sample student named Maya, with no login screen. Have them click around for a minute. It is the
real product.

## 13. Put it online

From `~/campusai-demo-<name>`:

```bash
npx vercel --prod --yes
```

It makes a project with the same name on their own Vercel and builds it, which takes a few minutes.
Give them the link ending in `.vercel.app`. That is their demo, live.

One habit to teach right here: open that link in a private window. If it asks to log in to Vercel,
it is a preview link only they can see. Ask Claude to put it on the project's main domain instead.

---

# Part 5. The three habits, and their first one

Explain these three in a few sentences each. This is the job.

1. **Test.** Fresh eyes are the most valuable thing they have, and they fade in about a week.
   When the team ships something, a run shows up on Base's **Testing** page with their name on it.
   They go through it one feature at a time and answer Works, Something's off, or Can't test this,
   then score it 1 to 10. Anything they notice outside a run goes through the **Feedback** button
   in the product. The full method is in the campusai-product skill (`testing.md`).
2. **Grade.** Twice a week a routine finds new components and puts each on a card at
   elevations.vercel.app. Every Thursday their Base tasks say "Grade this week's Elevations". They
   score each card 1 to 10 with one sentence on why and where it would go. Jacob's score stays
   hidden until they give theirs. (`grading.md`)
3. **Build.** Take something good that already exists and make it ours. Find a component they
   like, pick one place in the demo it would make better, and say it in one sentence: "The Save
   button on Job Match should fill like this." Then Claude adds it to their copy.

Then the skill under all three, in two sentences: **evaluating the output.** Claude sounds just as
sure when it is wrong, so before anything is called done they look for themselves, say what they
expected first, and check the eight things in `evaluating.md` (also on the kit's website). Show
them one now: once their demo is live, have them open the link in a private window.

## 14. Find the first component

Keep going with them here:

1. Have them browse and save three things they like (a button, a loader, a card, a hover, a
   transition): elevations.vercel.app first, then the sites behind the eight component libraries
   (magicui.design, reactbits.dev, animate-ui.com, cult-ui.com and the rest in
   `where-parts-live.md`), and mobbin.com or godly.website for ideas. Show them they can also just
   ask: "search the component libraries for a button that fills while you hold it."
2. Help them pick ONE, plus ONE place in the demo, as one sentence. Push for something small and
   visible, not a whole page.

## 15. Move into their copy

Their copy has its own rules and an `add-a-component` skill that only load when Claude starts
inside it, and the skills from Part 3 only load in a new chat. So:

- **In the Claude desktop app:** start a new session and pick the `campusai-demo-<name>` folder in
  their home folder.
- **In the terminal:** close this Claude (Ctrl+C twice) and run `cd ~/campusai-demo-<name> && claude`.

In the new session they paste the link and their sentence and say **add a component**. It does the
rest: building it in, checking it on screen, putting it on their link, and saving it.

## 16. Recap

Before they switch, give them a short recap:

- Where their copy is on their Mac, and their live link.
- That the kit updates itself each time Claude starts, and the website is
  https://campusai-starter.vercel.app if they want to reread anything.
- What is installed: tools, accounts, the CampusAI skill, the three skill packs, the plugin, the
  ten connections, and any extras they chose.
- Anything skipped or broken, from your list, so they can tell Jacob.
- The three commands they will use again:

```bash
npx next dev --turbopack -p 3481
npx vercel --prod
git add -A && git commit -m "what I added" && git push
```

---

# Rules for the whole setup

- Their demo copy is `jdfeigenblum/campusai-demo-<name>`. Push only there. Never add another remote
  and never push anywhere else.
- Deploy only to their own Vercel account.
- Never put a real student's information in the demo.
- Do not change anything on their Mac outside this setup without asking them first.
