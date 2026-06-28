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
