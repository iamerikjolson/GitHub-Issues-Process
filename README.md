This document defines the guidelines we follow for task management using GitHub Issues.  It is intentionally lean and covers primarily how individual releases are managed.

# Issues Management
Issues typically flow through the below states during their lifecycle.

Most states are controlled via GitHub labels. By default, state transitions are
managed simply by removing the current state label and applying the appropriate
next state label. The exception are the Backlog and Done states. State labels do not control these
states. Rather they are controlled by being Open or Closed, and whether they are
assigned to a milestone. That rule applies regardless of any labels assigned it.

## Issue States

Any issue with a ![](img-labels/trash.png) label is automatically excluded from the below states.

State | Label | Open? | % | Description
---|---|---|---|---
Backlog | n/a | Open | 0% | Issues have been identified but are not yet ready for development. Backlogged issues are typically not in a milestone.
In Analysis | ![](img-labels/in-analysis.png) | Open | 10% | Issues are actively being analyzed, typically by a Business Analyst or Lead Developer, to ensure the work is Ready for development.
Ready | ![](img-labels/ready.png) | Open  | 20% | Issues have been fleshed out to the point where they are believed to be ready to be acted upon by developers working on the associated milestone.
In Progress | ![](img-labels/in-progress.png) | Open | 30% | Issues are actively being worked on by a developer or another person (if not a coding task).  With the exception of items that are blocked or returned to development due to failed tests, each developer should strive to have as few items in this state as possible.
In Review | ![](img-labels/in-review.png) | Open | 70% | The developer believes he/she is complete and has submitted the issue for peer review.
Feature Testing | ![](img-labels/feature-testing.png) | Open | 80% | Issues are code complete and can be acted on by testers.  All code is assumed to be checked in and deployed to the appropriate environments for testing.
Integration Testing | ![](img-labels/integration-testing.png) | Open | 90% | Issues have been unit tested and are ready for closure pending end of sprint integration testing.
Done | n/a | Closed | 100% | Issues have passed testing and are closed.

## Helper Labels
The following labels are not states, per se, but help to communicate information about the issue.

Label | Description
---|----
![](img-labels/blocked.png) | The person assigned to the issue cannot progress because they are awaiting information or action from someone else
![](img-labels/bug-dev.png) | The issue is a programmatic error (bug) in the code found during development
![](img-labels/bug-prod.png) | The issue is a programmatic error (bug) in the code found in production
![](img-labels/help-wanted.png) | The person assigned is requesting assistance on the task
![](img-labels/requirement.png) | The issue is a formal/written requirement
![](img-labels/test-failed.png) | The issue was Feature Tested, but was set to failed by the person testing it
![](img-labels/track-time.png) | The person working on this issue must track how much time is spent on the issue


# To Use This Process

The only thing that you need to configure to use this process is to add the below labels to your repo.

This [bash script](/set-github-labels.sh) can be used to:
* Remove the default GitHub labels automatically add when a repo is created.
* Add the above process labels.

The script requests a GitHub Personal Access Token which in order to access private repos. You will need to first create a token by following [these instructions](https://help.github.com/articles/creating-an-access-token-for-command-line-use/).

To run the script:
* Download (or git clone the repo).
* Set execute permissions; `chmod +x /path/set-github-labels.sh`.
* Drag the file into Terminal.

# Schedule the project in GitHub

1. Create a Milestone
  * Name in the format "v[#.##]". Ex: "v0.01"
  * Select the Due Date
1. Assign issues to each milestone
1. Create an overall project schedule using [milepost](http://milepost.io).
1. When satisfied with the schedule, email to the team and the client.

## Integration Testing
Items in the integration testing state have passed all unit tests in the development environment and are considered complete pending final end of phase integration testing.  Once all development work for the sprint has been completed, items will be integration tested before being moved to Done.

## Failed Tests
When a test fails, in addition to moving the item back to **In Development**, the tester should apply the **Test Failed** label and re-assign the issue to the original developer.  This will aid in tracking priorities and help developers identify what needs their immediate attention.

![Issue Management Process](flowcharts/software-development-process.png)

## Release Closure
Each release has several tasks that need to be carried out to finalize the release.  These tasks are designed to facilitate testing and publication of the completed release, as well as to prepare for the next release.

The first step is to update the test and development databases with the latest data from production.  Following that, we publish the completed release to the test environment and perform integration testing.  Once all of the release items have passed integration testing, we deploy the release and update any pending operational items to indicate which ones can now be worked on.  The following graphic shows the individual steps for this process.

![Sprint Closure Process](flowcharts/sprint-closure.png)
