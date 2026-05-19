---
name: coding
description: Coding style and practices to follow when writing or modifying code. Use this skill when implementing features, fixing bugs, writing functions, refactoring, or editing source code in any language.
---

Follow these practices when writing or modifying code:

- Avoid single-use variables. If a variable is only used once, inline it.
- Tests are not optional. Always assess whether the behavior you're changing
  requires new or updated tests.
- Never introduce pointless whitespace (trailing spaces, lines with only
  spaces). When adding blank lines for visual separation, ensure those lines
  are truly empty.
- When writing code comments, wrap lines at 100 columns.
- Prefer small logical changesets, sometimes the scope of work cannot be made smaller in a
  logical way, but if possible keep the change sets small and focused.  Mega commits are an antipattern.
- When making changes to an existing system, be sure to consider the system as a whole. Your changes should
  seek to blend in with the existing patterns and design decisions.  There may be times to break from
  existing patterns when they are problematic, but you should rely on the user to make these decisions.
- Remember that lines of code is not a measuring stick of productivity or quality. Sometimes the
  highest signal of quality and productivity is not the volume of the change, but the precision of the change.

Before you start implementation, ask me if I would like to be in the loop reviewing your changes. If.
I do want to review, use the reviewer MCP server if it is available.
