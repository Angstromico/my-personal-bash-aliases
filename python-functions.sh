#!/bin/bash

# Function to create a Python file with a standard main() template
mkpy() {
    # Check for required arguments
    if [ "$#" -lt 1 ]; then
        echo "Error: Please provide a filename or a path/filename."
        echo "Usage 1: mkpy <filename>"
        echo "Usage 2: mkpy <directory> <filename>"
        echo "Usage 3: mkpy <path/to/filename>"
        return 1
    fi

    local TARGET_DIR=""
    local FILE_BASE=""

    # --- Argument Parsing Logic ---

    if [ "$#" -eq 2 ]; then
        # Case 1: mkpy materials material
        # The first argument is the directory, the second is the file base name.
        TARGET_DIR="$1"
        FILE_BASE="$2"
    elif [ "$#" -eq 1 ]; then
        # Case 2: mkpy example.py OR mkpy system/functions/file
        # We use 'dirname' and 'basename' to split the path/file argument.
        TARGET_DIR=$(dirname "$1")
        FILE_BASE=$(basename "$1")
    fi

    # 1. Ensure the filename ends with .py
    if [[ "$FILE_BASE" != *.py ]]; then
        FILE_NAME_WITH_EXT="${FILE_BASE}.py"
    else
        FILE_NAME_WITH_EXT="$FILE_BASE"
    fi

    # 2. Define the final complete path
    FINAL_PATH="$TARGET_DIR/$FILE_NAME_WITH_EXT"

    # 3. Create the directory path if it doesn't exist (the -p flag handles nested directories)
    if [ ! -d "$TARGET_DIR" ]; then
        echo "Creating directory: $TARGET_DIR"
        mkdir -p "$TARGET_DIR"
    fi

    # 4. Check if the final file already exists
    if [ -f "$FINAL_PATH" ]; then
        echo "Error: File '$FINAL_PATH' already exists."
        return 1
    fi

    # 5. Use 'cat' with a heredoc (<< EOF) to write the content
    cat << EOF > "$FINAL_PATH"
def main(): 
    print("Hello Main!")


if __name__ == "__main__":
    main()
EOF

    echo "✅ Created Python file: $FINAL_PATH"
    # Open the file in VS Code if the 'code' command is available
    if command -v code >/dev/null 2>&1; then
        code "$FINAL_PATH"
    fi
}

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

setup_pyenv() {
    local VENV_DIR=~/venvs/testenv

    # 1. Create the virtual environment if it doesn't exist
    if [ ! -d "$VENV_DIR" ]; then
        echo "Creating virtual environment at $VENV_DIR"
        python3 -m venv "$VENV_DIR"
    fi

    # 2. Activate the virtual environment
    # shellcheck disable=SC1091
    source "$VENV_DIR/bin/activate"

    # 3. Check if user passed packages
    if [ $# -eq 0 ]; then
        echo "Usage: setup_pyenv <package1> [package2] ..."
        return 1
    fi

    # 4. Install all packages passed as arguments
    echo "Installing packages: $*"
    pip install "$@"

    # 5. Export current dependencies to requirements.txt
    echo "Exporting dependencies to requirements.txt"
    pip freeze > requirements.txt

    echo "✅ Environment setup complete. Virtual env: $VENV_DIR"
}