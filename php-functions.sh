# === XAMPP Aliases (CachyOS) ===

function mkphp
    if test (count $argv) -lt 1
        echo "Usage: mkphp <path/to/file>          → e.g. mkphp src/controllers/User"
        echo "   or: mkphp <dir> <filename>        → e.g. mkphp src/controllers User"
        return 1
    end

    set FULL_PATH ""

    if test (count $argv) -eq 2
        # Two arguments → dir + filename
        set DIR $argv[1]
        set NAME $argv[2]
    else
        # One argument → full path
        set DIR (dirname $argv[1])
        set NAME (basename $argv[1])
    end

    # Add .php extension if missing
    if not string match -qr '\.php$' -- $NAME
        set NAME "$NAME.php"
    end

    # Build final path
    set FULL_PATH "$DIR/$NAME"

    # Create directory if needed
    if not test -d $DIR
        echo "Creating directory: $DIR"
        mkdir -p $DIR
    end

    # Prevent overwrite
    if test -f $FULL_PATH
        echo "Error: File '$FULL_PATH' already exists!"
        return 1
    end

    echo "Creating PHP file: $FULL_PATH"

    # Write the file safely
    printf '<?php\n\ndeclare(strict_types=1);\n\n' > $FULL_PATH
    printf 'function main(): void\n{\n    echo "Hello from %s!\\n";\n}\n\n' (string replace -r '\.php$' '' $NAME) >> $FULL_PATH
    printf 'main();\n' >> $FULL_PATH

    echo "File created successfully!"

    # Open in VS Code if available
    if type -q code
        code $FULL_PATH 2>/dev/null
    end
end