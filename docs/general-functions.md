# ⚙️ General Functions

General purpose utility functions.

## `checkport`

Check which service/process is listening on a specific port using `ss` and `grep`.

### Usage

```bash
checkport <port>
```

- `port`: The port number you want to check (e.g., 3000, 8080).

### Example

```bash
checkport 3000
```

## `addbash`

Append a block of code, script, or alias directly to your `~/.bashrc` and reload the shell configuration.

### Usage

```bash
addbash "<code>"
```

- `code`: The block of code, alias definition, or command you want to append.

### Example

```bash
addbash "alias ll='ls -la'"
```

