This document defines the guidelines we follow for task management using GitHub Issues.  It is intentionally lean and covers primarily how individual releases are managed.

# Task Management
Issues typically flow through the below states during their lifecycle.

Most states are controlled via GitHub labels. By default, state transitions are
managed simply by removing the current state label and applying the appropriate
next state label. The exception are the Backlog and Done states. State labels do not control these
states. Rather they are controlled by being Open or Closed, and whether they are
assigned to a milestone. That rule applies regardless of any labels assigned it.

## State Definitions

State | In a Milestone? | Open State | Description
---|---|---|---
Backlog | No | Open | Issues have been identified but are not yet ready for development.
Analysis | Yes | Open | Issues are actively being analyzed, typically by a Business Analyst or Lead Developer, to ensure the work is Ready for development.
Ready | Yes | Open  | Issues have been fleshed out to the point where they are believed to be ready to be acted upon by developers working on the associated milestone.
In Development | Yes | Open | Issues are actively being worked on by a developer.  With the exception of items that are blocked or returned to development due to failed tests, each developer should strive to have as few items in this state as possible.
Feature Testing | Yes | Open | Issues are code complete and can be acted on by testers.  All code is assumed to be checked in and deployed to the appropriate environments for testing.
Integration Testing | Yes | Open | Issues have been unit tested and are ready for closure pending end of sprint integration testing.
Done | Yes or No | Closed | Issues have passed testing and are closed.


## Integration Testing
Items in the integration testing state have passed all unit tests in the development environment and are considered complete pending final end of phase integration testing.  Once all development work for the sprint has been completed, items will be integration tested before being moved to Done.

## Failed Tests
When a test fails, in addition to moving the item back to **In Development**, the tester should apply the **Test Failed** label and re-assign the issue to the original developer.  This will aid in tracking priorities and help developers identify what needs their immediate attention.

![Issue Management Process](flowcharts/software-development-process.png)

## Release Closure
Each release has several tasks that need to be carried out to finalize the release.  These tasks are designed to facilitate testing and publication of the completed release, as well as to prepare for the next release.

The first step is to update the test and development databases with the latest data from production.  Following that, we publish the completed release to the test environment and perform integration testing.  Once all of the release items have passed integration testing, we deploy the release and update any pending operational items to indicate which ones can now be worked on.  The following graphic shows the individual steps for this process.

![Sprint Closure Process](flowcharts/sprint-closure.png)

# To Use This Process

The only thing that you need to configure to use this process is to add the below labels to your repo.

### Option 1: Manually add the labels

The following can be used for configuring the label names and colors:

Label | Colors
---|---
![Analysis](img-labels/analysis.png) | `#fbca04`
![Ready Label](img-labels/Ready.png) | `#fbca04`
![In Development Label](img-labels/InDevelopment.png) | `#fbca04`
![Feature Testing Label](img-labels/FeatureTesting.png) | `#009800`
![Integration Testing Label](img-labels/IntegrationTesting.png) | `#009800`
![Blocked Label](img-labels/blocked.png) | `#b60205`
![Test Failed Label](img-labels/testFailed.png) | `#b60205`
![Bug Label](img-labels/bug.png) | `#d93f0b`
![Trash](img-labels/Trash.png) | `#000000`

### Option 2: Run a script to add the labels

This [bash script](/set-github-labels.sh) can be used to:
* Remove the default GitHub labels automatically add when a repo is created.
* Add the above process labels.

The script requests a GitHub Personal Access Token which in order to access private repos. You will need to first create a token by following [these instructions](https://help.github.com/articles/creating-an-access-token-for-command-line-use/).

To run the script:
* Download (or git clone the repo).
* Set execute permissions; `chmod +x /path/set-github-labels.sh`.
* Drag the file into Terminal.
