---
name: code-review
description: Review code changes for quality and correctness
disable-model-invocation: true
allowed-tools: Read Bash(git diff:*) Bash(git log:*)
---

Review the current branch's diff against `origin/main` for correctness bugs, logic errors, and simplification opportunities.

## Steps

1. Run `git diff origin/main...HEAD` to get the full diff
2. If the diff is large, also run `git diff origin/main...HEAD --stat` for an overview and read individual files as needed
3. Do a single careful pass through the changes looking for:
   - Correctness bugs (wrong logic, off-by-one, missing edge cases, race conditions)
   - Security issues (injection, auth bypass, data exposure)
   - Simplification opportunities (dead code, redundant logic, clearer alternatives)
   - API misuse or contract violations
4. Report findings using the ReportFindings tool, most severe first. If no issues found, report an empty array.

## Rules

- Do NOT spawn subagents or workflows. Do all work inline in a single pass.
- Focus on real bugs and meaningful improvements, not style nits.
- Each finding must include a concrete failure scenario.
- If the user passes arguments (e.g. a file path, PR number, or effort level), scope accordingly.
