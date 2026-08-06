---
name: merge
description: Squash-merge a pull request with a commit message describing the outcome — the end state of the code — rather than the steps taken to get there.
disable-model-invocation: true
effort: high
---

# Merge

Squash-merge a PR, writing the squash commit as a description of **what the code is now**, not a log of how it got that way.

The commit you write here outlives the PR. Branches get deleted, review threads collapse, CI runs expire — the squash commit is what someone reads in `git log` or `git blame` in two years when they're trying to understand why a file looks the way it does. A message that recounts the PR's history answers a question nobody is asking by then.

Merging is irreversible and outward-facing, which is why this skill is only ever invoked deliberately by a person.

## 1. Resolve the PR

Work down this list and stop at the first thing that identifies a PR. Getting this wrong merges the wrong code, so prefer asking over guessing.

**What the person said.** Check the invocation and the surrounding conversation before anything else:

- A PR number or `#N`, or a full PR URL — use it directly.
- A branch name — `gh pr list --head <branch> --state open`.
- A *ticket* or issue number. This is not a PR number, so resolve it rather than assuming they match: look for a branch named `<N>-*`, or `gh pr list --search "N" --state open`, or a PR whose body says `Fixes #N` / `Closes #N`. Confirm what you found before merging — "#162 is PR #172, *Extract watch persistence…* — merging that" — because a number that looks like a PR and isn't is exactly how the wrong thing gets merged.
- A description rather than an identifier ("the actions one", "the billing PR") — match it against `gh pr list --state open` and confirm.

**The session.** If they said nothing specific, look at what this conversation has been about. If you opened, pushed to, or reviewed a PR earlier, that's almost certainly the one — name it and proceed.

**The current branch.** `gh pr view --json number,url,headRefName,title`. No PR for the branch, and nothing above resolved one → say so and stop.

**When two or more candidates survive, ask.** Show the numbers and titles and let them pick. Same when the branch has a PR but the conversation was about a different one — that mismatch is worth surfacing rather than silently preferring either.

## 2. Check it's safe to merge

Run `gh pr checks <N>` and `gh pr view <N> --json state,mergeable,mergeStateStatus`.

Merge only when the checks pass and the state is mergeable. If anything is red, pending, or conflicted, report exactly what and stop — don't merge, and don't offer to merge anyway. A person invoking this skill is authorising the merge of *working* code; they aren't waiving the gate. If checks are merely still running, say how long they've been going and offer to wait.

## 3. Understand what actually changed

Read enough to describe the end state confidently. Use the PR's own refs rather than `HEAD` — the PR may not be the branch you're standing on:

- `gh pr diff <N>` for the full diff, and `gh pr view <N> --json commits` for its commits
- The PR body, which often already states the decisions and their reasons
- `git log <default> --oneline -10` plus one or two full messages (`git log -1 --format=%B <sha>`) to match the repo's house style — subject mood, body width, whether bodies are prose or bullets, whether they reference issues

Match what the repo already does. A commit that reads differently from its neighbours is a small ongoing tax on everyone scanning the log.

## 4. Write the message

**Subject**: imperative, under ~70 characters, naming the outcome. `Move watch persistence out of the dashboard modals into actions` — not `Refactor modals (#162)` and not `Address review feedback`.

**Body**: prose paragraphs covering, as applicable:

- Where things live now, and what that means for callers
- The non-obvious choices and *why* — especially anything a future reader would otherwise "fix" and regress. If the PR deliberately didn't reuse an existing helper, say which and why.
- Invariants now enforced, and by what — an arch test, a DB constraint, a type
- Anything a reader of the touched files would find surprising without this context

The reliable test for any sentence: **would it still be true and worth saying if the whole change had been written perfectly in a single commit?** If it only makes sense because of how the work unfolded, it's journey — cut it.

Journey material, which almost never earns its place:

- Rebases, merge conflicts, and how they were resolved
- Things renamed, moved, or reworked partway through — describe only where they ended up
- Tests added and later removed; approaches tried and abandoned
- Review rounds, CI fixes, "as discussed", "per feedback", "addressed comments"
- Narrative sequencing — "first X, then Y" — when the reader only needs the result

**Example.** A PR that extracted persistence into actions, then during review had its namespace reworked twice and some newly-redundant tests deleted:

Journey — describes the PR:
```
Extract watch persistence into actions, then group them under a Watch
namespace after review. Rebased onto main after the billing PR merged and
resolved the architecture.md conflict. Also removed some modal tests that
became redundant, and fixed the arch test that was passing vacuously.
```

Outcome — describes the code:
```
The create, edit and delete watch modals no longer persist anything. That
work belongs to App\Actions\Watch\CreateWatch, UpdateWatch and DeleteWatch;
the components validate, call the action, dispatch an event and toast.

UpdateWatch recomputes next_check_at inline rather than calling
scheduleNextCheck(), because a frequency change must anchor on now() while
scheduleNextCheck() anchors on the existing schedule and catches up missed
intervals.

tests/Arch/ActionsTest.php fails the build if an action imports App\Livewire,
which keeps the boundary intact when form objects arrive.
```

The second version is longer and worth it: every line tells a future reader something they'd otherwise have to reconstruct from the diff. Note that the reworked namespace appears only as its final form, and the deleted tests aren't mentioned at all — the current test suite speaks for itself.

Don't restate the diff. `git show` already lists the files; the commit message is for what the diff can't tell you.

## 5. Merge

```bash
gh pr merge <N> --squash --subject "..." --body "$(cat <<'MSG'
...
MSG
)"
```

Leave the remote branch in place unless asked — deleting it is a separate call the person may want to make themselves.

## 6. Confirm

Verify rather than assume it worked: `gh pr view <N> --json state,mergedAt` and the linked issue's state if there was one.

## 7. Return to the default branch and clean up

Do this **only when the PR you merged is the branch currently checked out** — compare `headRefName` from step 1 against `git branch --show-current`. Merging some other PR shouldn't yank someone off the work they're sitting on.

First check the tree is clean (`git status --porcelain`). If there are uncommitted changes, stop and say so rather than stashing on their behalf — you don't know whether that work belongs to the merged branch or is the start of something new.

```bash
git checkout <default>   # gh repo view --json defaultBranchRef -q .defaultBranchRef.name
git pull
git branch -D <branch>
```

`-D` rather than `-d` is deliberate. A squash merge puts a single new commit on the default branch, so none of the branch's own commits are ancestors of it and `-d` refuses the delete as "not fully merged". You have just confirmed the PR merged, so the content is on the default branch under a different SHA — this is the narrow case where forcing is correct rather than a way around a warning. If the merge somehow didn't land, step 6 would have caught it and you would not be here.

Report the merge commit SHA, the deleted branch, and whether the issue auto-closed. If the remote branch still exists (GitHub deletes it automatically only when the repo is configured to), say so — that one is theirs to remove.
