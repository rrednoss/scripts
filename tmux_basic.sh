#!/usr/bin/env bash
#
# Create a new tmux session to start working upon.
#
# @author rrednoss

set -Eeuo pipefail

SESSION=DEV

#######################################
# Opens a new tmux sessions with two windows.
# Globals:
#   SESSION
# Arguments:
#   None
#######################################
function main() {
  tmux new-session -s $SESSION -n man
  tmux new-window -t $SESSION:2
  tmux attach-session -t $SESSION
}

main "$@"

