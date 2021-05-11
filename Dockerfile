FROM mcr.microsoft.com/dotnet/core/sdk:3.1

# add some labels so it will be easy to search for this image
LABEL "com.github.actions.name" = "Auto Release Milestone"
LABEL "com.github.actions.description"="Drafts a GitHub releases based on a newly closed milestone"

LABEL version="0.0.1"
LABEL repository="https://github.com/kicaj29/github-action-docker-auto-release-milestone"
LABEL maintainer="Jacek Kowalski"

# first update local database with entries to make sure we have the newest entries
# https://stedolan.github.io/jq/
RUN apt-get update && apt-get install -y jq

# -g means install the tool globally
RUN dotnet tool install -g GitReleaseManager.Tool

# append to the PATH variable path to GitReleaseManager.Tool
ENV PATH /root/dotnet/tools:$PATH

COPY entrypoint.sh /
ENTRYPOINT [ "/entrypoint.sh" ]