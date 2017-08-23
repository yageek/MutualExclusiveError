# MutualExclusiveError
 This project aims to recreate the issue/misuse of MutuallyExclusive with ProcedureKit.

## Project.

Clicking on the top right button will triggers some async action.
If `SimpleLowLevelProcedure` has a `MutuallyExclusive` condition,
this async operation may not finished (here button not renenabled)

Removing the `MutuallyExclusive` on `SimpleLowLevelProcedure` solves the issue.

Misuse or Bug?

