# Universal Action Repository (UAR)

A growing collection of reusable, self-contained actions for AI agents. Each action is distributed using an Agent Skills–compatible structure, so agents that support the standard can discover and activate actions automatically; other agents can still use an action directly by reading its `action.md` and following its specifications.

## For AI agents

Clone, install, restart your agent session — done:

```bash
git clone <remote-url> universal-action-repository
cd universal-action-repository
./install.sh
```

* Default install target is `~/.agents/skills/` (the cross-tool discovery directory).
* `./install.sh --target <dir>` installs into a different discovery directory (for example `~/.claude/skills`, `~/.zcode/skills`, or a project's `.agents/skills/`).
* `./install.sh --all` installs into every discovery directory detected on this machine.
* Actions are symlinked, so after `git pull` in this repository every installed action is updated — no reinstall needed.
* Discovery happens at session start, so restart your agent after installing.
* `actions.json` is a machine-readable index of the available actions.

Agents without skill discovery can still use any action directly: read the action's `action.md` and follow it. The included scripts require only the dependencies specified by each action.

## Repository layout

```text
<action-name>/
├── SKILL.md       # discovery wrapper: frontmatter + pointer to action.md
├── action.md      # source of truth: trigger conditions, execution, rules, examples
├── scripts/       # executables the action runs
├── references/    # optional: background docs the agent reads on demand
├── examples/      # optional: test prompts and expected outputs
└── assets/        # optional: templates and fixtures
```

**SKILL.md / action.md convention:** skill discovery only reads files named `SKILL.md`, so each action folder contains a thin `SKILL.md` holding the frontmatter (`name`, `description`) and a pointer to `action.md`. All substantive action content is authored in `action.md`.

**Creating a new action:** copy the skeleton above, rename the folder to the new action's kebab-case name, fill in `action.md` and the `SKILL.md` frontmatter (`name` must match the folder name), then add a row to the table below and an entry to `actions.json`.

## Available actions

| Action                                     | Purpose                                                                                                                      | Entry point                                          |
| ------------------------------------------ | ---------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------- |
| [clone-git-repo](clone-git-repo/action.md) | Clone any remote git repo (HTTPS/SSH) into a local folder, with retries on SSL failure and safe handling of existing folders | [`clone-git-repo/SKILL.md`](clone-git-repo/SKILL.md) |



