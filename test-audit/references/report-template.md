## Test Suite Audit

### Current state
- [Layer]: X tests across Y files
- ...
- Total: X tests
- Baseline runtime: [per layer or total, from Phase 1]

### Proposed changes

#### 1. Move to a faster layer (N tests)
[File] — [current layer → target layer]
Reason: [what infrastructure it uses vs. what it needs]

#### 2. Remove redundant browser/e2e tests (N tests across N files)
[File] > [test name]
Already covered by: [specific test in faster layer]

#### 3. Trim infrastructure overuse (N files)
[File]
Issue: [setup running for every test that only N tests actually need]
Proposed fix: [scope it down / split file / remove the unnecessary setup]

#### 4. Reliability fixes (N issues across N files)
[File] > [test name or pattern]
Issue: [sleep / unfrozen time / unseeded randomness / network call / shared state / order dependence]
Proposed fix: [the targeted edit]

#### 5. Rotted skipped tests proposed for deletion (N tests)
[File] > [test name]
Skip reason: [as found, or "no reason given"]
Why delete: [reason no longer applies / code has moved on / nobody can explain it]

#### 6. Test name clarity (N tests)
[File] > [current name] → [proposed name]
Reason: [describes implementation / vague / contradicts assertion]

#### 7. Dataset opportunities (N consolidations)
[File] > [list of test names]
Could become: one parameterised test with N cases

#### 8. Duplicate tests (N pairs)
[File A] > [test] duplicates [File B] > [test]
Keep: [which one and why]

#### 9. Folder layout mismatches (N files)
[Current path] → [Proposed path]
Reason: [what app path it mirrors, or why the current location is confusing]

### Not changing
[Brief note on what was reviewed and left alone — so the user knows it was considered]

### Summary
Net change: −N tests removed, +N dataset cases added, N tests moved to faster layer, N tests renamed, N reliability fixes
Baseline runtime: [recorded from Phase 1]
