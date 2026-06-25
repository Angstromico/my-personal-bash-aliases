# 🐙 Git Functions

This file contains utility functions to streamline your Git workflow.

## `gcp`

Commit and push changes to GitHub with a formatted message.

### Usage

```bash
gcp <type> <message>
```

- `type`: feat, bugfix, chore, docs, refactor, etc.
- `message`: Your commit message.

### Example

```bash
gcp feat "add user authentication"
```

---

## `git_init_push`

Initialize a new Git repository, add all files, commit, and push to a remote URL.

### Usage

```bash
git_init_push <remote-url>
```

---

## `generate_ssh_key`

Generate a new Ed25519 SSH key, add it to the `ssh-agent`, and copy the public key to the clipboard.

### Usage

```bash
generate_ssh_key <email>
```

---

## `invoke_git_hard_reset`

Hard reset the current branch to match a remote branch.

### Usage

```bash
invoke_git_hard_reset [remote] [branch]
```

- `remote`: Default is `origin`.
- `branch`: Default is `main`.

---

## `git_rebase_branch`

Fetch the latest changes from a base branch and rebase the specified branch onto it.

### Usage

```bash
git_rebase_branch [branch] [base_branch]
```

- `branch`: The branch you want to rebase. Default is the **current branch**.
- `base_branch`: The branch to rebase onto. Default is `main`.

---

## `go-branch`

Fetch remote updates and switch to an existing local branch.

### Usage

```bash
go-branch <branch-name>
```

- `branch-name`: The target branch to checkout.

### Notes

- Automatically runs `git fetch origin --prune` before switching.
- Fails with a clear error if the branch does not exist locally or on `origin`.
