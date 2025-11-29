# 🛠️ My Personal Shell Aliases

This repository is a collection of my personal Shell functions and functions that help streamline my development workflow. It starts with a simple but powerful alias for Git commits and pushes.

## 🚀 Alias: `gcp`

The `gcp` function allows me to quickly commit and push changes to GitHub with a formatted message. It supports commit types like `feat` and `bugfix`, and lets me write custom messages on the fly.

### 📄 Usage

```bash
gcp feat "add login functionality"
gcp bugfix "fix null pointer exception"
```

## 🐍 Alias: mkpy

The `mkpy` function is a productivity hack designed specifically for Python development. It creates a new Python file `(.py)` in your current directory, automatically populating it with a best-practice template.

This saves you the time of creating the file manually and typing out the standard Python entry point.

```bash
mkpy calculator_script
# Creates calculator_script.py with the template:
# def main():
#     print("Hello Main!")
#
# if __name__ == "__main__":
#     main()

mkpy setup.py
# Creates setup.py with the template (since it already ends in .py)
```

## 🐍 Alias: python

The `python` function allows me to went from this `python3 magic.py` to `python magic`.

```shell
 python() {
    # Check if any arguments were provided
    if [ $# -eq 0 ]; then
        echo "Usage: python <filename> [args...]"
        return 1
    fi

    local FILE="$1"
    local ARGS="${@:2}"  # Get all arguments except the first one

    # If the file doesn't have .py extension, try adding it
    if [[ "$FILE" != *.py ]]; then
        FILE="$FILE.py"
    fi

    # Check if the file exists
    if [ ! -f "$FILE" ]; then
        echo "Error: File '$FILE' not found."
        return 1
    fi

    # Execute the Python file with python3
    python3 "$FILE" $ARGS
 }

 python script         # Runs script.py
 python script arg1    # Runs script.py with argument 'arg1'
 python setup.py       # Runs setup.py directly

```

## 🐘 Alias: xampp

```bash
    alias xampp='sudo /opt/lampp/lampp'

    xampp start
    xampp restart
    xampp stop
```

## 📌 Why This Repo Exists

This is the first personal alias I’ve created and decided to keep. As I continue to refine my workflow and discover other useful aliases, I’ll be uploading them here gradually.

## 🗂️ Future Plans

- Add aliases for Docker, Python, and system utilities

- Include setup instructions for sourcing these aliases

- Share tips and tricks for shell productivity

## 📂 Repository File Structure

To keep this repository clean and highly organized, all aliases and functions will be grouped by the technology they target. This modular approach makes it easy to source only the specific aliases you need.

- git-functions.sh: Contains all Git-related functions and functions (e.g., gcp).

- python-functions.sh: Will contain functions like `mkpy` and any future Python-related shell commands.

- docker-functions.sh: Reserved for future Docker and container utility functions.

- xampp-aliases.sh: Contains the xampp commands

```bash
git-functions.sh      # Contains all Git-related aliases (e.g., gcp)
python-functions.sh   # Contains mkpy, python(), and future Python utilities
docker-functions.sh   # Reserved for Docker and container utility functions
xampp-aliases.sh      # Reserved for xampp
```

### Additional Note 🤓:

```bash
    # Use this command after you put one of this functions or aliases in your terminal

    source ~/.bashrc # Adjust to the real direction if you have to.
```

Stay tuned!

## How to Add Any Custom Function/Command to Fish Shell (Universal Guide)

Fish makes it extremely easy to create your own permanent terminal commands (functions/aliases).

### 1. The Golden Rule
Every file inside this folder automatically becomes a command:

```bash
    ~/.config/fish/functions/
```


→ File name = command name  
→ File contents = function code

### 2. Create a new command (example: `hello`)

```fish
nano ~/.config/fish/functions/hello.fish

function hello
    echo "Hello $argv from Fish!"
end

Save: Ctrl+O → Enter → Ctrl+X
```

### 3. Make it active

Choose one of these (they all work):

```fish
exec fish                    # fastest – replaces current shell
# OR
source ~/.config/fish/config.fish   # reloads everything
# OR simply open a new terminal tab/window
```
