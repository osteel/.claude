---
name: qa
description: Drive a running app through a real browser to verify a change actually works for a user. Use when the user says "QA this", "check it works in the browser", "click through it", "verify this in the app", "does this actually work", or asks for manual/exploratory verification of a change. Also use proactively after implementing something whose correctness depends on client-side behaviour a test suite cannot reach — reactive bindings, conditional reveals, inline scripting, anything only correct at runtime. Distinct from running the test suite (that verifies what tests already cover) and from design critique (that judges how it looks); this verifies that the thing works when a person uses it.
---

# QA in a real browser

Automated tests prove the code paths they cover. This exists for everything else — the parts of an application that only exist once markup, scripting and framework glue meet a browser, where a mistake fails silently and no analyser will tell you.

The value here is entirely in judgement: choosing what is worth exercising, noticing that something is subtly wrong rather than absent, and refusing to claim more than you saw. Clicking through a happy path and declaring success is worse than skipping QA, because it manufactures confidence. A false green is the failure mode to design against.

## When this earns its keep, and when it doesn't

Worth doing when a change touches rendered output, client-side behaviour, form handling, conditional display, or anything whose correctness depends on strings that no compiler checks — template bindings, selectors, event wiring, inline expressions.

Not worth doing for pure backend refactors with no rendered surface, documentation, build config, or changes already fully covered by automated tests. Say so and stop rather than performing QA theatre.

## Phase 1 — Establish that you can actually QA

Do this before planning any checks. Each of these can end the exercise, and finding that out early is cheap.

**Can you drive a browser?** If no browser automation is available to you, say so plainly and stop. Do not substitute a test-suite run, a code read, or a description of what would probably happen — those answer a different question, and offering them as a stand-in is how a false green gets created.

**Is the app reachable?** Discover how this project runs rather than assuming: check the README, agent instruction files (`AGENTS.md`, `CLAUDE.md`, or equivalent), container/compose definitions, environment files, and any project-specific command wrapper. Projects often front their tooling with a script rather than invoking a language runtime directly. Confirm the app responds before opening a browser.

**Who are you, and does the state fit?** Identify the active session, user, role, plan or tenant. Then ask whether that state actually exercises the path you care about. A field that only renders when a value is absent will not appear for an account that already has one. A feature behind a flag, entitlement, environment check or seeded fixture may be structurally unreachable in this environment.

When a path is unreachable, that is a finding in its own right — report it as **unreachable**, never as passing and never as failing. Both of those are claims you have no evidence for.

## Phase 2 — Choose what to check

Derive checks from the actual change. Read the diff or the description of what was done, and let that drive the list. Exploratory clicking produces noise; every check should trace to something specific that changed or something specific that could break.

Rank candidates by *what would go unnoticed without you*:

- **Highest value** — behaviour that is invisible to static analysis and absent from the test suite. Framework bindings written as strings in markup, reactive expressions in attributes, conditional reveals driven by client-side state, values that are only correct after a round trip. These fail silently and look fine in review.
- **Middle** — flows that tests cover only in part, where the assertion checks a value but not that the user can actually get there.
- **Lowest** — anything with direct automated coverage. Re-verifying it costs time and proves nothing new. Skip it and say you skipped it.

If the change was accompanied by claims about behaviour — a description of what should now happen, or a note that something changed — treat those as hypotheses to confirm rather than facts. Observing that a documented behaviour change actually occurs is one of the more valuable things this produces.

## Phase 3 — Run the checks

**Protect the state you are running against.** This is usually a real local environment with real data, not a disposable fixture. Before acting: identify anything a check would mutate. Prefer checks that read rather than write. When a mutation is unavoidable, capture the prior value somewhere durable first, make the change, and restore it afterwards — then verify the restoration actually took, rather than assuming.

**Never complete an irreversible action.** Deletion, payment, sending, publishing, destructive resets. Their gating is still worth verifying — that the button is disabled until conditions are met, that validation blocks a bad value — and you can verify all of that without pressing the final control.

**Ask before changing configuration to reach a path.** If a flag, environment value or seed would have to change to make something testable, surface it as a choice with the tradeoff stated. Silently mutating the environment to manufacture a passing check is a worse outcome than an honest "unreachable".

**Mechanics that save time.** Batch actions into one call where your tool supports it — a sequence of interactions and a screenshot at the end usually beats a round trip per click. But any interaction that can move the layout invalidates every coordinate you were about to use, so take a fresh screenshot and re-read positions before continuing. When a click seems to do nothing or hits the wrong thing, suspect a shifted layout before suspecting a bug.

Capture evidence as you go. A screenshot showing the actual rendered state is what separates an observation from an assumption.

## Phase 4 — Report

Lead with a table, one row per check:

| Check | Status | What was observed |
|---|---|---|
| <what you exercised> | verified / unreachable / not tested | <the concrete thing you saw> |

**Status means exactly what it says.** `verified` requires that you observed the behaviour yourself. `unreachable` means the environment could not exercise it, with the reason. `not tested` means you chose to skip it, with the reason. Nothing gets `verified` on inference.

Then cover, briefly:

- **Anything unexpected** — behaviour that differed from what the change claimed, or that surprised you even if it wasn't wrong.
- **What you deliberately did not cover, and why.** This matters as much as what you did. Someone reading the report needs to know the shape of the gap.
- **State restored** — confirm every mutation was reverted and that you checked, or state plainly what remains changed.

**Be precise about the limits of your evidence.** If a diagnostic channel was only capturing for part of the session, say that rather than reporting silence as a clean result — "no errors captured, but capture started late" is honest; "no errors" is not. The same applies to anything you inferred rather than saw. Overstating coverage is the one failure this skill cannot tolerate, because it converts an unknown into a false assurance that no one will re-check.

## Scope boundaries

This does not replace the test suite. Anything worth guarding permanently belongs in an automated test — if QA finds a real bug, the fix should come with a test, and this skill's job was to find what the suite couldn't.

This is not design critique. Whether the interface looks right, reads well, or follows the design system is a separate concern with its own tools. Stay on whether it *works*.
