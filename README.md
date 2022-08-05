# NextOps - TradeX Standard Release Process

A Next Generation of Continues Integration and Continues Delivery for Trade X. The intent of creating a standardized automated process for releases is to make sure we have transparency in our release process. Strictly following the Semantic Versioning specification and communicating the impact of changes to consumers.

## Development

* All sprints are two weeks long and run from Monday to the following Friday.
* All sprint development is done in feature branches that get merged back to develop.
* The develop branch are deployed to the development environment
* This is environment is dedicated to developers only, so it is not a reliable environment to perform any e2e testings

## QA

* Before the demo on the second Thursday of the sprint (by 5pm EST), development is merged to master branch (release branch)
* A latest release is automatically created post a successful PR (Semantic Release)
* Release is then deployed automatically to QA Env
* The team that owns that repo/service is responsible for creating the release (vX.X.X), and therefore confirming that the service is running properly in PRE
* Ticket validation/e2e testing is done in QA
* Release candidates are indentified and kept ready for the production release

## Production Release

* QA must sign off on the release before we release to production. Ideally this happens the day before the release. 
* QA will give a thumbs up in #releases with a link to TestRail including the test cases run to confirm the release is ready. 
* The dev teams cannot determine if a release is ready.
* Releases will happen at 8am eastern on the Tuesday after the sprint is over, on a Google Meet. 
* Attendance is required by the following:
     * One member from each team with code going to production
     * DevOps
     * Someone from QA
* It is the responsibility of each team to confirm their service is up and running in production.
* Once it’s been determined that everything has been deployed and all migrations have been run, QA will run a set of sanity tests and post the results to #releases with a link to the TestRail tests that were run.

## Exceptions

* If a ticket is completed and marked Done after the release branches are formed, the decision to add this to the release candidate must be made by a member of QA, the dev team who worked on it and someone from Product. This decision must be made in #releases with links to the ticket and who were involved in making the decision. 
* The decision to remove a ticket form the release candidate must be done with a member from the dev team (who will remove the code changes), a member of product and a member of the QA team and this decision must be disseminated to the #releases channel. 
* A delay to the production release must be decided no later than Monday and must be made by QA, someone from product and someone from a dev team. This must be  communicated in #releases with an explanation as to why and who was involved in making that decision. 
* If a Jira ticket requires running a script on production in order for the task to get completed- we can leave the status of it as “To Test” before starting the release. It’s fine to do so as long as there is no code changes pending before the release.

## Hot Fixes

* The determination as to whether we make a hotfix must come from a discussion between QA, a product person and a member of the dev team. 
* Hot fixes should be branched off of main into a hotfix branch.
* Hot fix branches will deploy to a hot fix environment (Future state. For now we will need to deploy them to QA)
* Once a hot fix is verified by QA it will be released to production and the hot fix branch will be merged back into develop. 

## Commit message format for Semantic Release

semantic-release uses the commit messages to determine the type of changes in the codebase. Following formalized conventions for commit messages, semantic-release automatically determines the next semantic version number, generates a changelog and publishes the release.

## Must be one of the following:

| Commit Message [MAJOR]                                                  | ReleaseType     | Format |
| ------------------------------------------------------------------------|:---------------:| ------:|
| **feat:** Adding new feature with major changes                         | Major Release   | 1.0.0  |
| ***BREAKING CHANGE:*** Adding this changes will improve performance     |                 |        |


| Commit Message [MINOR/FEATURE]                                          | ReleaseType     | Format |
| ------------------------------------------------------------------------|:---------------:| ------:|
| **feat:** Added new features                                            | Feature Release | 0.1.0  |
| **fix:** fixed some bugs                                                | Patch Release   | 0.0.1  |
| **perf:** Performance Improvements changes                              | Patch Release   | 0.0.1  |
| **test:** Adding missing or correcting existing tests                   | Patch Release   | 0.0.1  |
| **docs:** Documentation only changes                                    | Patch Release   | 0.0.1  |
| **refactor:** A code change that neither fixes a bug nor adds a feature | Patch Release   | 0.0.1  |
| **chore:** Changes to the build process or auxiliary tools and libraries| Patch Release   | 0.0.1  |
