checkport() {
    if [ -z "$1" ]; then
        echo "Error: You must specify a port. Example: checkport 3000"
        return 1
    fi
    sudo ss -tulpn | grep ":$1"
}

# Append code directly to .bashrc and reload the shell configuration
addbash() {
    if [ -z "$1" ]; then
        echo "Error: You must provide the block of code or alias to add."
        echo 'Example: addbash "alias ll='\''ls -la'\''"'
        return 1
    fi
    
    # Add line jump for clarity
    echo "" >> ~/.bashrc
    echo "$1" >> ~/.bashrc
    
    # Reload
    source ~/.bashrc
    echo "Successfully added to ~/.bashrc and reloaded configuration!"
}