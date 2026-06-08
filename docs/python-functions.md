# 🐍 Python Functions

Utility functions for Python development.

## `mkpy`

Creates a new Python file with a standard `main()` template and opens it in VS Code.

### Usage
```bash
mkpy <filename>
# or
mkpy <directory> <filename>
# or
mkpy <path/to/filename>
```

---

## `python`

Runs a Python file using `python3`. It automatically appends the `.py` extension if it's missing.

### Usage
```bash
python <filename> [args...]
```

---

## `setup_pyenv`

Creates a virtual environment (if it doesn't exist), activates it, installs the specified packages, and exports them to `requirements.txt`.

### Usage
```bash
setup_pyenv <package1> [package2] ...
```
