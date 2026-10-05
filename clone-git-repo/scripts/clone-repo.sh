#!/usr/bin/env bash
# Clone any remote git repo into a target folder.
# Usage: clone-repo.sh <repo-url> [target-folder]
set -euo pipefail

[ $# -ge 1 ] || { echo "usage: clone-repo.sh <repo-url> [target-folder]" >&2; exit 1; }

url="${1%/}"                                # strip trailing slash
default_name="$(basename "$url" .git)"
target="${2:-$default_name}"                # default: folder named after the repo

if [ -d "$target/.git" ]; then              # already cloned -> update instead
  git -C "$target" pull --ff-only
elif [ -e "$target" ] && [ -n "$(ls -A "$target" 2>/dev/null)" ]; then
  echo "error: '$target' exists and is not empty" >&2
  exit 1
else
  mkdir -p "$(dirname "$target")"
  git clone "$url" "$target" \
    || git -c http.version=HTTP/1.1 clone "$url" "$target" \
    || git -c http.version=HTTP/1.1 clone --depth 1 "$url" "$target"
fi

git -C "$target" log --oneline -1           # verify
