# Intro

Automatically draft release for a closed milestone.

# chmod
Before merging to the repo we have to make sure that `entrypoint.sh` is marked as executable.
On Windows open bash terminal and execute:

```
git add --chmod=+x -- entrypoint.sh
```
Next commit and push the change.

# Run action auto release milestone

* create a milestone in github
![015-create-milestone.png](./images/015-create-milestone.png)

* create issues in the milestone
![016-create-issues-in-milestone.png](./images/016-create-issues-in-milestone.png)

* close both issues
![017-close-both-issues.png](./images/017-close-both-issues.png)

* in edit view close the milestone
![018-close-milestone.png](./images/018-close-milestone.png)

Next the github workflow should generate draft release for the closed milestone:

![019-milestone-release.png](./images/019-milestone-release.png)

# links
https://github.com/ecampidoglio/auto-release-milestone   



