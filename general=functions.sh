checkport() {
    if [ -z "$1" ]; then
        echo "Error: You must specify a port. Example: checkport 3000"
        return 1
    fi
    sudo ss -tulpn | grep ":$1"
}