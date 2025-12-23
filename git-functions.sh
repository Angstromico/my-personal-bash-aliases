#!/bin/bash

# Commit to main repo: 
gcp() {
  # Colorful banner
  echo -e "\033[1;35m🚀 Let's launch your code to GitHub!\033[0m"

  # Check for required arguments
  if [ "$#" -lt 2 ]; then
    echo -e "\033[1;31m❗ Usage: gcp <feat|bugfix|chore|docs|refactor> <commit message>\033[0m"
    return 1
  fi

  TYPE=$1
  shift
  MESSAGE=$*

  # Detect current branch
  BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
  if [ -z "$BRANCH" ]; then
    echo -e "\033[1;31m❌ Not inside a Git repository.\033[0m"
    return 1
  fi

  echo -e "\033[1;36m📦 Branch:\033[0m \033[1;33m$BRANCH\033[0m"
  echo -e "\033[1;36m📝 Commit type:\033[0m \033[1;33m$TYPE\033[0m"
  echo -e "\033[1;36m💬 Message:\033[0m \033[1;32m$MESSAGE\033[0m"
  echo ""

  # Add all changes
  git add .
  echo -e "\033[1;34m📂 Changes staged.\033[0m"

  # Commit
  git commit -m "$TYPE: $MESSAGE" || return 1

  # Pull latest changes to prevent conflicts
  echo -e "\033[1;34m⬇️  Pulling latest changes from origin/$BRANCH...\033[0m"
  git pull origin "$BRANCH" --rebase

  # Push changes
  echo -e "\033[1;34m⬆️  Pushing to origin/$BRANCH...\033[0m"
  git push origin "$BRANCH"

  echo -e "\n\033[1;32m✅ All done! Your code is now live on GitHub.\033[0m"
}

# === GCP (CachyOS) ===

function gcp
    echo -e "\033[1;35m🚀 Let's launch your code to GitHub!\033[0m"

    if test (count $argv) -lt 2
        echo -e "\033[1;31m❗ Usage: gcp <feat|bugfix|chore|docs|refactor> <commit message>\033[0m"
        return 1
    end

    set TYPE $argv[1]
    set MESSAGE (string join " " $argv[2..-1])

    # FIXED redirection
    set BRANCH (git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if test -z "$BRANCH"
        echo -e "\033[1;31m❌ Not inside a Git repository.\033[0m"
        return 1
    end

    echo -e "\033[1;36m📦 Branch:\033[0m \033[1;33m$BRANCH\033[0m"
    echo -e "\033[1;36m📝 Commit type:\033[0m \033[1;33m$TYPE\033[0m"
    echo -e "\033[1;36m💬 Message:\033[0m \033[1;32m$MESSAGE\033[0m"
    echo ""

    git add .
    git commit -m "$TYPE: $MESSAGE" || return 1

    echo -e "\033[1;34m⬇️  Pulling latest changes from origin/$BRANCH...\033[0m"
    git pull origin "$BRANCH" --rebase

    echo -e "\033[1;34m⬆️  Pushing to origin/$BRANCH...\033[0m"
    git push origin "$BRANCH"

    echo -e "\n\033[1;32m✅ All done! Your code is now live on GitHub.\033[0m"
end

# Initialize a new Git repo and push to GitHub
git_init_push() {
  if [ "$#" -lt 1 ]; then
    echo -e "\033[1;31m❗ Usage: git_init_push <remote-url>\033[0m"
    return 1
  fi

  REMOTE_URL=$1

  echo -e "\033[1;35m🚀 Initializing new Git repository...\033[0m"

  git init
  git add .
  git commit -m "first commit"
  git branch -M main
  git remote add origin "$REMOTE_URL"
  git push -u origin main

  echo -e "\n\033[1;32m✅ Repository initialized and pushed to $REMOTE_URL\033[0m"
}

## Create Git SSH Key
generate_ssh_key() {
  if [ "$#" -lt 1 ]; then
    echo -e "\033[1;31m❗ Usage: generate_ssh_key <email>\033[0m"
    return 1
  fi

  EMAIL=$1
  KEY_PATH=~/.ssh/id_ed25519_"$EMAIL"

  echo -e "\033[1;35m🚀 Generating new SSH key...\033[0m"
  ssh-keygen -t ed25519 -C "$EMAIL" -f "$KEY_PATH" -N ""

  echo -e "\033[1;34m🔑 Adding key to ssh-agent...\033[0m"
  if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    eval "$(ssh-agent -s)"
  fi
  ssh-add "$KEY_PATH"

  echo -e "\033[1;34m📋 Copying public key to clipboard...\033[0m"
  if command -v xclip &> /dev/null; then
    cat "$KEY_PATH.pub" | xclip -selection clipboard
  elif command -v wl-copy &> /dev/null; then
    cat "$KEY_PATH.pub" | wl-copy
  else
    echo -e "\033[1;33m⚠️ Neither xclip nor wl-copy found. Copy manually:\033[0m"
    cat "$KEY_PATH.pub"
  fi

  echo -e "\n\033[1;32m✅ SSH key generated and added to ssh-agent.\033[0m"
}
