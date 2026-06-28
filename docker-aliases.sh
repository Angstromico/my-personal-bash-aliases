#!/bin/bash

alias docker-start-img='docker run --rm -it -p'

# Check which Docker container has mapped a specific port
checkdockport() {
    if [ -z "$1" ]; then
        echo "Error: You must specify a port. Example: checkdockport 3000"
        return 1
    fi
    docker ps | grep "$1"
}
