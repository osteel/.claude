---
name: test
description: Run test suite and fix any failures.
disable-model-invocation: true
---

# Run Tests and Fix Failures

Run test suite and fix any failures.

## Instructions

Detect the test framework, run the test suite, and fix any failures.

## Phase 1: Detect Test Framework

1. **Check for test configuration files** to identify the framework:

   | File | Framework | Command |
   |------|-----------|---------|
   | `package.json` (scripts.test) | npm/yarn | `npm test` / `yarn test` |
   | `vitest.config.*` | Vitest | `npx vitest run` |
   | `jest.config.*` | Jest | `npx jest` |
   | `playwright.config.*` | Playwright | `npx playwright test` |
   | `cypress.config.*` | Cypress | `npx cypress run` |
   | `phpunit.xml` | PHPUnit | `./vendor/bin/phpunit` |
   | `pest.php` or `Pest.php` | Pest | `./vendor/bin/pest` |

2. **Check package.json scripts** if present:
   ```
   cat package.json | jq '.scripts | keys[] | select(test("test"))'
   ```
   Look for: `test`, `test:unit`, `test:e2e`, `test:integration`

3. **If multiple test types exist**, run them in order:
   - Unit tests first (fastest feedback)
   - Integration tests
   - E2E tests last

## Phase 2: Run Tests

1. **Run the detected test command**

2. **Capture the output** and identify:
   - Total tests run
   - Passed count
   - Failed count
   - Skipped count
   - Which specific tests failed

3. **If all tests pass**, report success and stop.

## Phase 3: Diagnose Failures

For each failing test:

1. **Identify the failure type**:
   - Assertion failure (expected vs actual mismatch)
   - Runtime error (exception, crash)
   - Timeout
   - Missing dependency/setup
   - Flaky test (passes sometimes)

2. **Locate the relevant code**:
   - The test file and specific test case
   - The source code being tested
   - Any fixtures or mocks involved

3. **Determine the root cause**:
   - Is the test wrong (outdated expectations)?
   - Is the code wrong (bug)?
   - Is the environment wrong (missing setup)?

## Phase 4: Fix Failures

1. **Summarize findings to the user**:
   - What failed and why
   - Whether the fix should be in test or source code
   - Your proposed approach

2. **Implement the fix**:
   - If test is outdated: update the test expectations
   - If code is buggy: fix the source code
   - If setup is missing: add necessary fixtures/mocks

3. **Re-run the specific failing test** to verify:
   ```
   # Examples of running single tests
   npx vitest run path/to/test.ts -t "test name"
   npx jest path/to/test.ts -t "test name"
   ./vendor/bin/pest --filter "test name"
   pytest path/to/test.py::test_name -v
   go test ./... -run TestName
   cargo test test_name
   ```

4. **If the fix works**, run the full suite again to check for regressions.

5. **If still failing**, re-diagnose and repeat.

## Phase 5: Complete

1. **Once all tests pass**, summarize:
   - Tests that were fixed
   - Changes made (test vs source code)
   - Any concerns or notes for the user

2. **If some tests cannot be fixed** (e.g., external dependency, requires discussion):
   - Explain what's blocking
   - Suggest next steps
   - Ask the user how to proceed

## Notes

- Prefer fixing source code bugs over adjusting tests to pass
- If a test seems wrong but you're unsure, ask the user before changing it
- For flaky tests, look for race conditions, timing issues, or shared state
- Don't skip or delete tests without user approval
- If tests require environment setup (database, API keys, Docker), inform the user