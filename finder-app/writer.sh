#!/bin/sh

##########################################################################

# Accepts the following arguments: 
#   the first argument is a full path to a file (including filename) on the filesystem, referred to below as writefile; 
#   the second argument is a text string which will be written within this file, referred to below as writestr
# Exits with value 1 error and print statements if any of the arguments above were not specified
# Creates a new file with name and path writefile with content writestr, 
#   overwriting any existing file and creating the path if it doesn’t exist. 
# Exits with value 1 and error print statement if the file could not be created.

# Example:
#       writer.sh /tmp/aesd/assignment1/sample.txt ios

# Creates file:
#    /tmp/aesd/assignment1/sample.txt
# With content:
#            ios

##########################################################################

# Assign arguments to variables
writefile=$1
writestr=$2

# Check if both arguments are provided
if [ -z "$writefile" ] || [ -z "$writestr" ]; then
    echo "Error: Please specify both arguments"
    exit 1
fi

# Extract directory from writefile
writedir=$(dirname ${writefile})

# Check if directory exists; if not, create it
if [ ! -d "$writedir" ]; then
    mkdir -p "$writedir"
    if [ $? -ne 0 ]; then
        echo "Error: Could not create directory $writedir"
        exit 1
    fi
fi

# Create or overwrite the file with the content
echo "$writestr" > "$writefile"
if [ $? -ne 0 ]; then
    echo "Error: Could not write to file $writefile"
    exit 1
fi
