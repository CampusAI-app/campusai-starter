# CampusAI starter kit

Everything a new CampusAI product teammate needs, in one place: a learning kit for the person and a
kit for their Claude. Start at https://campusai-starter.vercel.app.

- `index.html`, the website (the learning kit, for people).
- `SETUP.md`, the setup Claude follows. It installs the tools, accounts, skills and connections, gets
  their own copy of the CampusAI demo running, and turns on updates.
- `CLAUDE.md`, context loaded in every chat (imported from `~/.claude/CLAUDE.md`).
- `skills/campusai-product`, how we test, grade, build and evaluate the output.
- `parts/components.json`, the eight component libraries Claude can search.
- `scripts/update.sh`, run at the start of every Claude session so changes pushed here reach everyone.

To change the kit, edit it here and push to `main`. Everyone picks it up on their next session.
