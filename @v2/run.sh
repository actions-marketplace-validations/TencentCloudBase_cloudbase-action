#!/usr/bin/env bash

SECRET_ID="$1"
SECRET_KEY="$2"
ENV_ID="$3"

#
# Trace commands, print tips & description
# @param command The actual command to execute
# @param description Describe the purpose of the command, with ansi color
#
trace() {
    # Group inner steps
    echo -e "::group::$2"
    echo -e "\e[32m› $1"
    eval "$1"
    echo "::endgroup::"
}

trace "sudo npm install -g @cloudbase/cli --loglevel=error" "\e[34mDownload and install cloudbase cli"

trace "tcb login --apiKeyId "$SECRET_ID" --apiKey "$SECRET_KEY" | grep "登录"" "\e[34mLogin to cloudbase"

trace "tcb framework deploy -e "$ENV_ID"" "\e[36mDeploy to cloudbase"
