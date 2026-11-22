#!/bin/bash

# Function to display help message
display_help() {
    echo "supuesto.sh [opciones] fichero|directorio"
    echo "-l | --legible       Check if the file or directory is readable"
    echo "-m | --modificable   Check if the file or directory is writable"
    echo "-x | --ejecutable    Check if the file or directory is executable"
    echo "-h | --help          Display this help message"
}

# Parse command-line options
options=""
file_or_dir=""

# Check if any arguments are provided
if [ -z "$1" ]; then
    display_help
    exit 0
fi


    case "$1" in
        -l|--legible)
            options+="r"
            shift
            ;;
        -m|--modificable)
            options+="w"
            shift
            ;;
        -x|--ejecutable)
            options+="x"
            shift
            ;;
        -h|--help)
            display_help
            exit 0
            ;;
        --) # end argument parsing
            shift
            break
            ;;
        -*|--*=) # unsupported flags
            echo "Error: Unsupported option $1" >&2
            display_help
            exit 1
    esac




echo "$options"