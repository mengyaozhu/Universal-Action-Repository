# examples/

Sample inputs and expected outputs, used to test the action end-to-end.

Example files for this action: test prompts ("clone <url> to <folder>", casual phrasings,
SSH URLs) paired with the expected script output (final `git log --oneline -1` line).

Used by the verification loop: run each example against the action, confirm the skill
triggers and the clone lands in the right folder.
