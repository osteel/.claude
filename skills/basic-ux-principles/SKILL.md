---
name: basic-ux-principles
description: Applies strict usability, clarity, and accessibility rules when creating interfaces, flows, layouts, and UX copy. Use during design and generation, not for critique or reporting.
user-invocable: false
---

# Basic UX Principles

When **creating** interfaces, flows, layouts, or UX copy, ensure the result is immediately understandable, decision-light, and usable by an average or below-average user **without instructions**.

This skill is **generative and prescriptive**, not analytical.
It exists to **shape outputs at creation time**, not to produce UX audits or reports.

---

## When to use this Skill

Apply this skill automatically whenever the agent is asked to:

- Design a UI, screen, page, dashboard, or flow
- Propose layouts, wireframes, or interaction patterns
- Write UX copy, microcopy, labels, headings, or onboarding text
- Design forms, navigation, search, or information architecture
- Make UX trade-offs during product or interface creation

Do **not** invoke this skill when:
- The task is purely visual branding or illustration
- The user explicitly asks for a UX review or critique
- The task is backend, infrastructure, or non-interactive logic

---

## Operating assumptions (hard constraints)

Design **as if all of the following are true**:

- Users do not read carefully
- Users do not explore or experiment
- Users do not infer intent
- Users do not want to make decisions
- Any uncertainty increases cognitive load
- If something needs explaining, the design has already failed

---

## Design posture

While generating designs or interfaces, the agent must:

- Bias toward **obviousness over elegance**
- Prefer **effectiveness over conceptual understanding**
- Remove choices whenever a sensible default exists
- Follow conventions unless breaking them adds clear usability gains
- Treat every screen as a **billboard**, not a document

---

## Generative rules by domain

### 1. Core usability
- Design so success requires no effort or learning
- Eliminate question marks (“What is this?”, “Can I click this?”, “What happens next?”)
- Make the next action obvious at all times
- Avoid preferences; decide on behalf of the user

### 2. Clarity & self-evidence
- Every page or screen must be understandable at a glance
- Never require users to decide whether something is clickable
- Prefer self-explanatory interfaces over explanatory text
- Add guidance only when unavoidable; keep it brief and unmissable

### 3. Content & copy
- Eliminate “happy talk” and marketing filler
- Tell users what they want to know, not what the product wants to say
- Use short paragraphs, bullets, and front-loaded keywords
- Headings must be scannable and visually attached to their content
- Write for humans; copy is part of the interface

### 4. Visual design & layout
- Establish a clear visual hierarchy (importance must be obvious)
- Divide content into clearly defined areas
- Treat all elements as visual noise until proven useful
- Remove distractions aggressively
- Preserve affordances; flat design must not remove usability cues

### 5. Navigation & information architecture
- Navigation must reveal structure and possibilities
- Persistent navigation must be consistent
- Always provide a clear path to Home
- Every page must have a visible name matching the link that led there
- Clearly indicate “You are here”
- Use breadcrumbs for deep hierarchies
- Minimise navigation during focused tasks (forms, checkout)

### 6. Home page (when designing one)
- Immediately communicate:
  - What this is
  - Who it’s for
  - What to do next
- Make search, browsing, and featured content obvious
- Avoid vague mission statements or corporate language
- Do not overload; clarity beats coverage

### 7. Search
- Unless the product is tiny, include search by default
- Use a visible search box, not a link
- Follow standard patterns only

### 8. Forms & data entry
- Ask only for information required for the task
- Never make users think about formatting
- Avoid long forms; break into steps if needed
- Use example values only inside fields
- Errors must be easy to notice and easy to recover from

### 9. Mobile & responsive
- Prioritise frequent and urgent actions
- Never rely on hover
- Do not sacrifice clarity to save space
- Avoid loading unnecessary assets
- When forced to choose, usability wins

### 10. Accessibility (always applied)
- Ensure full keyboard navigation
- Use sufficient contrast and readable type sizes
- Use semantic headings correctly
- Explicitly label form fields
- Provide meaningful alt text
- Preserve visited-link styling
- Front-load key meaning for screen readers

---

## Output expectations

When this skill is active, the agent should:

- **Silently apply** these rules while generating designs or interfaces
- Make defaults explicit and remove unnecessary choices
- Avoid adding explanatory text where design can do the work
- Only surface rationale if the user explicitly asks “why”

The agent should **not**:
- Produce UX review reports by default
- Explain UX theory
- Justify every decision unless asked

---

## Success criteria

The output is successful if:

- A first-time user can complete the task without thinking
- The interface explains itself without instructions
- No unnecessary decisions are left to the user
- Nothing requires guessing, interpretation, or exploration

If these conditions cannot be met, the agent must simplify the design further rather than explain it.