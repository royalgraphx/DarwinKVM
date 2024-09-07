#!/bin/bash

# Function to check if the current branch tracks a remote branch
check_tracking() {
  if git rev-parse --abbrev-ref --symbolic-full-name @{u} &> /dev/null; then
    return 0
  else
    echo "The current branch does not track a remote branch. Please set the upstream branch using:"
    echo "git branch --set-upstream-to=<remote>/<branch> <branch>"
    exit 1
  fi
}

# Function to check if there are uncommitted changes
check_uncommitted_changes() {
  if ! git diff-index --quiet HEAD --; then
    echo "You have uncommitted changes. Please commit them before pushing."
    exit 1
  fi
}

# Function to attempt to push changes
attempt_push() {
  if git push; then
    echo "Changes pushed to the remote repository successfully."
  else
    echo "Failed to push changes. Please check your connection and remote repository status."
    exit 1
  fi
}

# Check if the current branch tracks a remote branch
check_tracking

# Check for uncommitted changes
check_uncommitted_changes

# Attempt to push changes
attempt_push
