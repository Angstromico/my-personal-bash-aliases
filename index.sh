#!/bin/bash

# Commit to main repo: 
gcp() {
  if [ "$#" -lt 2 ]; then
    echo "Usage: gcp <feat|bugfix> <commit message>"
    return 1
  fi

  TYPE=$1
  shift
  MESSAGE=$*

  git commit -m "$TYPE: $MESSAGE"
  git push -u origin main
}