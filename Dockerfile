FROM mcr.microsoft.com/dotnet/core/sdk:3.1

# add some labels so it will be easy to search for this image
LABEL "com.github.actions.name" = "Auto Release Milestone"
LABEL "com.github.actions.description"="Drafts a GitHub releases based on a newly closed milestone"

LABEL version="0.0.1"
LABEL repository="https://github.com/kicaj29/github-action-docker-auto-release-milestone"
LABEL maintainer="Jacek Kowalski"

COPY entrypoint.sh /
ENTRYPOINT [ "/entrypoint.sh" ]