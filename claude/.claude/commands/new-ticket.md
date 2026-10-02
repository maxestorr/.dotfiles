Initialize a new ticket workspace for: $ARGUMENTS

Follow these steps:

**1. Parse arguments**
The first token is the ticket ID (e.g. `DEN-1234`, `PROJ-42`). Any remaining text is the optional title.

**2. Create the directory structure**
- `tickets/{TICKET_ID}/CLAUDE.md` — ticket brief and context
- `tickets/{TICKET_ID}/plan.md` — the plan (empty to start)

Use these exact templates:

`tickets/{TICKET_ID}/CLAUDE.md`:
```
# {TICKET_ID}: {title or "untitled"}

## Brief

{paste the ticket description here, or leave for user to fill in}

## Plan

@plan.md
```

`tickets/{TICKET_ID}/plan.md`:
```
# Plan: {TICKET_ID}

## Approach

## Tasks

- [ ] 

## Notes
```

**3. Ask for the brief**
If the ticket description was not included in the arguments, ask the user to paste it now. Once you have it, write it into the `## Brief` section of `CLAUDE.md`.

**4. Explore the codebase**
Read the brief and explore the project to find files, modules, or components relevant to this ticket. Focus on the source directories most likely to be in scope based on the brief.

**5. Write a preliminary plan and discuss**
Summarise what you found: which files are likely in scope, what the current implementation looks like, and any non-obvious constraints or risks. Then immediately write a preliminary `tickets/{TICKET_ID}/plan.md` with your best current understanding. Where you have open questions that need the user's input before the task can be fully specified, leave explicit placeholder comments (e.g. `[OPEN: how should X be handled?]`) rather than leaving those sections blank. Present the plan and the open questions to the user together.

**6. Refine the plan through discussion**
As the user answers open questions or steers the approach, update `plan.md` in place — replace each placeholder with the resolved decision. Continue until all placeholders are resolved and both parties are satisfied with the plan.

**7. Confirm setup**
Remind the user that future sessions on this ticket should start with:
```
cd tickets/{TICKET_ID} && claude
```
This ensures the global, project, and ticket CLAUDE.md files are all loaded automatically.
