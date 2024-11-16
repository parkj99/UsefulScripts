#!/bin/bash

# Prompt the user for the workspace number and new name
read -p "Enter the workspace number you want to rename: " workspace_number
read -p "Enter the new name for workspace $workspace_number: " new_name

# Rename the workspace using i3-msg
i3-msg "rename workspace $workspace_number to \"$workspace_number: $new_name\""

