---
name: mobile-ux-principles
description: Mobile and web app onboarding UX good practices and anti-patterns — 242 deduplicated principles across 18 categories, distilled from all 67 UserOnboard.com teardowns (Netflix, Slack, Duolingo, Dropbox, and others). Use whenever designing, building, or reviewing app onboarding and activation flows — landing/first-launch screens, signup and login, permission and notification prompts, first-run experience, tours and tooltips, empty states, paywalls and upgrade prompts, re-engagement emails — even if the user never says "onboarding". Also use when critiquing an existing flow ("why is our signup conversion bad?", "review this first-run experience"). Covers what the flow should *do*; for general usability rules also invoke `ux-principles`, for visual design `ui-rules`.
---

# Mobile UX Principles

Evidence-backed onboarding principles, each observed in real apps. The full list lives in `references/onboarding-principles.md`: 18 numbered categories, each with "Good practices" and "Anti-patterns" subsections, example apps in parentheses.

Read only the sections relevant to the task — the reference has a table of contents. Read the whole file only for a full onboarding audit.

## Section map

| Working on | Read sections |
|---|---|
| Landing page, app store listing, first screen | 1 Value proposition, 2 Trust/social proof, 9 Copywriting, 10 Visual hierarchy |
| Signup, login, account creation | 3 Signup, 4 Forms/validation, 2 Trust/legal |
| Permission, notification, contacts prompts | 5 Permissions |
| First-run experience, tutorials, tours | 6 Time-to-value, 7 Tours/tooltips, 8 Empty states, 12 Progress/feedback |
| Retention and engagement loops | 11 Personalization, 13 Gamification, 15 Social/virality, 16 Email/re-engagement |
| Pricing, paywalls, trials, upsells | 17 Monetization, 2 Trust |
| Loading states, errors | 14 Loading/errors |
| End of onboarding, handoff to product | 18 Ending onboarding, 6 Time-to-value |

## How to apply

**When designing or building:** before producing the flow, read the mapped sections. Follow the good practices; treat each anti-pattern as a constraint the design must not violate. The principles are directional, not legalistic — when two conflict (e.g. "minimize signup fields" vs "personalize early"), prefer whichever gets the user to experienced value sooner; that is the underlying theme of the whole corpus.

**When reviewing or critiquing:** walk the flow stage by stage against the mapped sections. Report each violation by citing the principle and, where useful, the example app that got it right or wrong. Flag matched anti-patterns first — removing friction usually beats adding polish.

## Scope notes

- Source teardowns span 2013-2021: the principles are evergreen, but verify OS-level specifics (e.g. notification permission mechanics) against current iOS/Android behavior before citing them.
- These principles cover onboarding and activation flows. For usability of the interface itself, also invoke `ux-principles`; for colour, spacing, and typography, `ui-rules`.
