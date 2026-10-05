---
name: clone-git-repo
description: Clone any remote git repository (GitHub, GitLab, SSH or HTTPS URL) into a local folder. Use whenever the user says clone, check out, download, or fetch a repo, or pastes a git repo URL wanting it locally — even if they don't say "clone" exactly.
---

# Action: Clone Git Repo

Clone any remote git repository into a local folder by running the bundled script in `scripts/`.

## When to use

Activate this action when the user wants a remote git repo brought to their local machine,
in any of these forms:

- "clone <repo-url>"
- "download/fetch/check out this repo"
- pastes a git URL (https://, git@, ssh://) and wants it locally
- asks to update/sync an already-cloned repo (the script handles that too)

## How to execute

Run the bundled script (relative to this action's folder):

```bash
bash <this-action-folder>/scripts/clone-repo.sh <repo-url> [target-folder]
```

- `<repo-url>` — any URL git supports: `https://`, `git@host:owner/repo.git`, `ssh://`.
- `[target-folder]` — optional destination folder. If omitted, the repo is cloned into a
  folder named after the repo inside the current directory.
- If the target folder is already a clone of a repo, the script updates it (`pull --ff-only`)
  instead of failing.
- If the target exists and is not empty, the script exits with an error — report that to the
  user; never delete or overwrite anything yourself.

## Rules

- Always run the script; do not hand-roll `mkdir` + `git clone` steps.
- On success, report the last output line (the repo's latest commit) as proof of the clone.
- On failure, report the script's error output verbatim so the user can diagnose it.

## Examples

```bash
# Clone to an explicit folder
bash scripts/clone-repo.sh https://github.com/EverMind-AI/EverOS /Users/macm/git-repos/EverOS

# Clone into ./scidraft (folder name derived from the URL)
bash scripts/clone-repo.sh https://github.com/mengyaozhu/scidraft

# SSH URL, already cloned -> updates instead of re-cloning
bash scripts/clone-repo.sh git@github.com:EverMind-AI/SkillCorpus.git /Users/macm/git-repos/git-skillcorpus
```
