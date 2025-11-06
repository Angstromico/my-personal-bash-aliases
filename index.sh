#!/bin/bash

# Commit to main repo: 
gcp() {
  # Colorful greeting banner
  echo -e "\033[1;35m🚀 Let's launch your code to GitHub!\033[0m"
  echo -e "\033[1;36m📦 Commit type:\033[0m \033[1;33m$1\033[0m"
  echo -e "\033[1;36m📝 Message:\033[0m \033[1;32m${*:2}\033[0m"
  echo ""

  if [ "$#" -lt 2 ]; then
    echo -e "\033[1;31m❗ Usage: gcp <feat|bugfix> <commit message>\033[0m"
    return 1
  fi

  TYPE=$1
  shift
  MESSAGE=$*

  git commit -a -m "$TYPE: $MESSAGE"
  git push -u origin main

  echo -e "\n\033[1;34m✅ All done! Your changes are now live on GitHub.\033[0m"
}
