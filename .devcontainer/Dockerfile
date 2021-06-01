# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.177.0/containers/ruby/.devcontainer/base.Dockerfile

# [Choice] Ruby version: 3, 3.0, 2, 2.7, 2.6
ARG VARIANT="3"
FROM mcr.microsoft.com/vscode/devcontainers/ruby:0-${VARIANT}

# [Option] Install Node.js
ARG INSTALL_NODE="false"
ARG NODE_VERSION="lts/*"
RUN if [ "${INSTALL_NODE}" = "true" ]; then su vscode -c "umask 0002 && . /usr/local/share/nvm/nvm.sh && nvm install ${NODE_VERSION} 2>&1"; fi

# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>

# Create working directory
ENV APP_ROOT /{name}
RUN mkdir $APP_ROOT

# Set working directory as AppRoot
WORKDIR ${APP_ROOT}

# Add Gemfile
ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock

# [Optional] Uncomment this line to install additional gems.
RUN bundle install
ADD . ${APP_ROOT}

# [Optional] Uncomment this line to install global node packages.
# RUN su vscode -c "source /usr/local/share/nvm/nvm.sh && npm install -g <your-package-here>" 2>&1