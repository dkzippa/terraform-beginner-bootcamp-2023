#!/usr/bin/env bash

cd $HOME

# Check if the alias already exists in the .bash_profile
grep -q 'alias tf="terraform"' "$HOME/.bash_profile"

# $? is a special variable in bash that holds the exit status of the last command executed
if [ $? -ne 0 ]; then
    # If the alias does not exist, append it
    echo 'alias tf="terraform"' >> "$HOME/.bash_profile"
    echo "Alias added successfully."
else
    # Inform the user if the alias already exists
    echo "Alias already exists in .bash_profile."
fi

# Optional: source the .bash_profile to make the alias available immediately
source ~/.bash_profile

cd $PROJECT_ROOT
