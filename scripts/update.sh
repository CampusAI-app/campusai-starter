#!/usr/bin/env bash
# Keeps the CampusAI starter kit current without anyone running `git pull`. Claude Code runs this
# each time a session starts (a SessionStart hook in ~/.claude/settings.json, added during setup), so
# a change Jacob pushes reaches everyone on their next session. The skill, the context file and the
# component list are all read from this folder, so pulling is the whole update.
#
# It never blocks a session: no network, local edits in the way, or any other failure just keeps
# the version already here. What it prints is read by Claude at the start of the session.
# Borrowed from the CampusAI studio's scripts/update.sh.
set -u
KIT="$(cd "$(dirname "$0")/.." && pwd)" || exit 0
cd "$KIT" || exit 0

link_skill() {
  mkdir -p "$HOME/.claude/skills" 2>/dev/null || return 0
  LINK="$HOME/.claude/skills/campusai-product"
  [ -e "$LINK" ] || [ -L "$LINK" ] && return 0
  ln -s "$KIT/skills/campusai-product" "$LINK" 2>/dev/null \
    && echo "CampusAI kit: added the campusai-product skill. It is ready from the next session."
}

git rev-parse --is-inside-work-tree >/dev/null 2>&1 || { link_skill; exit 0; }
[ "$(git branch --show-current 2>/dev/null)" = main ] || { link_skill; exit 0; }

GIT_TERMINAL_PROMPT=0 git -c http.lowSpeedLimit=1000 -c http.lowSpeedTime=8 \
  fetch --quiet origin main >/dev/null 2>&1 || { link_skill; exit 0; }
behind="$(git rev-list --count HEAD..origin/main 2>/dev/null || echo 0)"

if [ "$behind" -gt 0 ]; then
  if git merge --ff-only --quiet origin/main >/dev/null 2>&1; then
    echo "CampusAI kit: updated with $behind new change(s) from Jacob. Latest: $(git log -1 --format=%s)."
  else
    echo "CampusAI kit: could not update because files changed in ~/campusai-starter are in the way." \
      "Working on the last version. Tell the person, and run git status there to see which files."
  fi
fi
link_skill
exit 0
