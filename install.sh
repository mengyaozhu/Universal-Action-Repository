#!/usr/bin/env bash
# Install the actions in this repository into an agent's skill discovery directory.
#
# Usage:
#   ./install.sh                link all actions into ~/.agents/skills (cross-tool default)
#   ./install.sh --target DIR   link into a specific discovery directory
#   ./install.sh --all          link into every discovery directory detected on this machine
#
# Agent-agnostic: works with any Agent Skills-compatible agent. Actions are symlinked,
# so a later 'git pull' in this repository updates every installed action automatically.
# Re-running is safe: existing correct links are kept, foreign files are never touched.

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")" && pwd)"
DEFAULT_TARGET="$HOME/.agents/skills"
# Known discovery directories across common agents; consulted only by --all, never created.
KNOWN_TARGETS="$DEFAULT_TARGET
$HOME/.claude/skills
$HOME/.zcode/skills"

usage() {
  cat <<'EOF'
Usage: ./install.sh [--target DIR] [--all]

Install actions from this repository into an agent's skill discovery directory
by symlinking each action folder. Works with any Agent Skills-compatible agent.

  (no options)   link into ~/.agents/skills (cross-tool default)
  --target DIR   link into DIR (e.g. ~/.claude/skills, or a project's .agents/skills)
  --all          link into every discovery directory detected on this machine
  -h, --help     show this help

Actions are symlinked, so a later 'git pull' in this repository updates every
installed action automatically.
EOF
}

target=""
all=0
while [ $# -gt 0 ]; do
  case "$1" in
    --target)
      [ $# -ge 2 ] || { echo "error: --target needs a directory" >&2; exit 1; }
      target="$2"; shift 2 ;;
    --all) all=1; shift ;;
    -h|--help) usage; exit 0 ;;
    *) echo "error: unknown option: $1" >&2; usage >&2; exit 1 ;;
  esac
done
if [ "$all" -eq 1 ] && [ -n "$target" ]; then
  echo "error: use either --target or --all, not both" >&2
  exit 1
fi

# Discover action folders: any direct subdirectory containing SKILL.md.
actions=""
for dir in "$REPO_ROOT"/*/; do
  [ -f "${dir}SKILL.md" ] && actions="${actions}${dir%/}"$'\n'
done
if [ -z "$actions" ]; then
  echo "error: no actions found (no folder contains SKILL.md) in $REPO_ROOT" >&2
  exit 1
fi

link_into() {
  local dest="$1" src name link
  mkdir -p "$dest"
  printf '%s' "$actions" | while IFS= read -r src; do
    [ -n "$src" ] || continue
    name="$(basename "$src")"
    link="$dest/$name"
    if [ -L "$link" ] && [ "$(readlink "$link")" = "$src" ]; then
      echo "  ok      $link (already linked)"
    elif [ -e "$link" ] || [ -L "$link" ]; then
      echo "  skipped $link already exists and is not our symlink - left untouched" >&2
    else
      ln -s "$src" "$link"
      echo "  linked  $link -> $src"
    fi
  done
}

if [ "$all" -eq 1 ]; then
  detected=0
  while IFS= read -r t; do
    [ -d "$t" ] || continue
    detected=1
    echo "Installing into $t:"
    link_into "$t"
  done <<EOF
$KNOWN_TARGETS
EOF
  if [ "$detected" -eq 0 ]; then
    echo "no discovery directories detected; create one or use --target DIR" >&2
    exit 1
  fi
elif [ -n "$target" ]; then
  echo "Installing into $target:"
  link_into "$target"
else
  echo "Installing into $DEFAULT_TARGET:"
  link_into "$DEFAULT_TARGET"
fi
