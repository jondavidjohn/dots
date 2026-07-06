---
name: git-workflow
description: Guidelines for git operations including committing, amending, branching, rebasing, and writing commit messages. Use this skill when making commits, writing commit messages, amending history, managing branches, pushing, rebasing, or performing any git operations.
---

When working with git:

- Before amending any commit, check whether it exists on a remote
  (`git branch -r --contains <sha>`). If it does, create a new commit instead.
  Never amend or rebase commits that are reachable from any remote branch.
- When updating a branch from the primary branch (`main` for example), do not
  use rebase if the commits on the branch have been pushed to a remote. Ensure we don't
  rewrite history on remotes.
- Write commit messages in imperative mood (e.g. "Add feature" not "Added
  feature" or "Adds feature").
- Keep the subject line concise (under 72 characters). Use the body for
  additional context when needed.
- Focus commit messages on the **why**, not the **what**. The diff shows what
  changed; the message should explain the motivation.
- Do not use a co-author trailer when authoring commit messages.
