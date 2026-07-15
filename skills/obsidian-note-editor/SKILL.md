---
name: obsidian-note-editor
description: safe direct editing of markdown notes in the martini obsidian vault with minimal diffs, wiki links, and exact frontmatter preservation. use when modifying .md files in the vault at ~/Documents/Obsidian/Martini, especially when edits must avoid helper scripts, avoid reformatting, and preserve existing structure.
---

# Obsidian Note Editor

## Overview

Edit notes directly and conservatively. Optimize for tiny diffs and zero surprise formatting changes.

## Vault

`~/Documents/Obsidian/Martini`

## Hard rules

- Modify `.md` files directly using patch-style edits.
- Always add YAML frontmatter with date and tags
- Never generate helper scripts in Python, Node, Bash, or similar to modify notes.
- Never create temporary transformation scripts inside the vault.
- Do not use programmatic search/replace scripts unless the user explicitly asks for automation code.
- If multiple files must change, edit them sequentially.


## Editing rules

- Preserve YAML frontmatter exactly, including key order and spacing.
- Preserve existing formatting unless the user asked to reformat.
- Use `[[Wiki Links]]`.
- Keep diffs minimal.
- Do not rewrap paragraphs.

## Workflow

1. Read the target note.
2. Determine the smallest direct edit.
3. Apply a patch-style change.
4. Re-check that frontmatter and surrounding formatting are untouched.
5. Report exactly what changed.

## Response pattern

- State which note was edited.
- State the minimal change applied.
- Mention any linked notes added with `[[Wiki Links]]`.
- Call out any blocked case where the requested change would require forbidden automation.
