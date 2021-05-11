#!/bin/bash
set -u  # this will give us a warning every time we use undeclared variable 

# token paramter is the first paramter so we can refer to it using index
repo_token=$1

if [ "$GITHUB_EVENT_NAME" != "milestone" ]; then
# this will appear only when DEBUG mode is enabled in the workflow
    echo "::debug::The even name was '$GITHUB_EVENT_NAME'"
    exit 0
fi

evenType=$(jq --raw-output .action $GITHUB_EVENT_PATH)

if [ $evenType != "closed" ]; then
    echo "::debug::The event type was '$event_type'"
    exit 0
fi

milestone_name=$(jq --raw-output .milestone.title $GITHUB_EVENT_PATH)

# https://bash.cyberciti.biz/guide/$IFS
# Internal Field Separator

# <<<: here-string redirection operator
# https://tldp.org/LDP/abs/html/x17837.html

IFS='/' read owner repository <<< "$GITHUB_REPOSITORY"

release_url=$(dotnet gitreleasemanager create \
--milestone $milestone_name \
--name $milestone_name \
--targetcommitish $GITHUB_SHA \
--token $repo_token \
--owner $owner \
--repository $repository)

# to get exit code of the last executed command use syntax: $?

if [  $? -ne 0 ]; then
    echo "::error::Failed to create the release draft"
    exit 1
fi

echo '::set-output name=release-url::AAAAA'

exit 0