#!/bin/bash

# Function to create a Python file with a standard main() template
mkpy() {
    # Check if a filename was provided
    if [ -z "$1" ]; then
        echo "Error: Please provide a filename for your Python script."
        echo "Usage: mkpy <filename.py>"
        return 1
    fi

    # Ensure the filename ends with .py
    if [[ "$1" != *.py ]]; then
        FILENAME="$1.py"
    else
        FILENAME="$1"
    fi

    # Check if the file already exists
    if [ -f "$FILENAME" ]; then
        echo "Error: File '$FILENAME' already exists."
        return 1
    fi

    # Use 'cat' with a heredoc (<< EOF) to write the content
    cat << EOF > "$FILENAME"
def main(): 
    print("Hello Main!")


if __name__ == "__main__":
    main()
EOF

    echo "✅ Created Python file: $FILENAME"
    code "$FILENAME" # Open the new file directly in VS Code (optional)
}