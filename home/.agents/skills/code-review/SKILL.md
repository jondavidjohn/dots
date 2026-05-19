---
name: code-review
description: Guidelines for reviewing code changes. Use this skill when performing code review, analyzing diffs, or providing feedback on pull requests.
---

Before assessing the correctness of the code, ensure you have a deep and complete understanding of
the behavior that is being changed.  Do not make assumptions (or suggestions) without fully vetting
your understanding.

When reviewing code, maintain an extremely high signal-to-noise ratio.

- Bugs and logic errors
- Security vulnerabilities
- Performance regressions in hot paths
- Incorrect or missing error handling
- Race conditions or concurrency issues
- Cohesiveness with existing patterns

Do NOT comment on:

- Trivial naming preferences
- Minor refactoring opportunities unrelated to the change's intent
- Obvious code that doesn't need explanation

When providing feedback, be direct and specific. Explain *why* something is a
problem, not just *what* to change. If you're unsure whether something is
actually wrong, say so rather than presenting uncertainty as fact.
