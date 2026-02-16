---
name: cover
description: Identify and add tests for recent code changes.
disable-model-invocation: true
---

# Test Coverage for Recent Work

Identify and add tests for recent code changes.

## Purpose

Review the feature or changes we've been working on in this session and identify what tests are missing. This is NOT about achieving 100% coverage — it's about ensuring the recent work has appropriate test coverage for the behavior that matters.

## Instructions

### Step 1: Identify Recent Work Scope

1. **Review the conversation** to understand:
   - What feature/fix/refactor we've been building
   - Which files were created or modified
   - What behavior changed or was added

2. **Check git status** to see the changes:
   ```
   git status
   git diff --stat HEAD~5  # recent commits if applicable
   git diff HEAD  # uncommitted changes
   ```

### Step 2: Analyze Test Coverage Needs

For each modified file, consider:

1. **New functionality**:
   - New functions/methods that don't have tests
   - New code paths or branches
   - New error handling

2. **Changed behavior**:
   - Modified logic that existing tests don't cover
   - Edge cases introduced by the changes
   - Integration points with other components

3. **Risk areas**:
   - Complex conditional logic
   - Data transformations
   - External service interactions (mock candidates)
   - Error scenarios and edge cases

4. **What NOT to test**:
   - Simple getters/setters
   - Framework-provided functionality
   - Code that's already well-tested
   - Trivial one-liners

### Step 3: Check Existing Tests

1. **Find related test files**:
   - Look for existing test files for the modified code
   - Check what's already covered
   - Understand the testing patterns used in the project

2. **Identify gaps**:
   - New code without any tests
   - New behavior not exercised by existing tests
   - Edge cases that aren't covered

### Step 4: Write Tests

For each gap identified:

1. **Follow project conventions** — match existing test file structure, naming, and patterns
2. **Focus on behavior** — test what the code does, not how it does it
3. **Keep tests focused** — one concept per test
4. **Use descriptive names** — test names should explain the scenario
5. **Cover the happy path first**, then edge cases and errors

### Step 5: Verify

1. **Run the new tests** to ensure they pass
2. **Run the full test suite** to ensure nothing broke
3. **Intentionally break the code** to verify tests catch it (then revert)

### Step 6: Summary

Report back with:
- Tests added (file and test names)
- What behavior is now covered
- Any gaps that couldn't be easily tested (and why)
- Suggestions for future test improvements

## Important

- **Don't over-test** — focus on behavior that matters, not coverage metrics
- **Don't expand scope** — only test the recent work, not the whole codebase
- **Match project style** — use the same test framework, patterns, and conventions
- **Ask if uncertain** — if unsure what testing approach to use, ask
- **Tests should be maintainable** — avoid brittle tests that break on implementation changes