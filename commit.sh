#!/bin/bash

# Stage all changes
git add --all

# Read commit message
echo "Enter Commit Details:"
read varcommit

# Function to add co-authors
coauthors=()
add_coauthor() {
  echo "Do you want to add a Co-Author? (yes/no)"
  read response

  if [ "$response" = "yes" ]; then
    echo "Enter Co-Author's Name:"
    read author_name
    echo "Enter Co-Author's Email:"
    read author_email

    coauthors+=("Co-authored-by: $author_name <$author_email>")
    
    add_coauthor  # Recursive call for adding more co-authors
  fi
}

add_coauthor

# Construct the commit message with co-authors
commit_message="$varcommit"
for coauthor in "${coauthors[@]}"; do
  commit_message+=$'\n\n'"$coauthor"
done

# Make the commit
git commit -m "$commit_message"

# Confirm commit
if [ "${#coauthors[@]}" -gt 0 ]; then
  echo "Commit \"$varcommit\" with co-authors created successfully."
else
  echo "Commit \"$varcommit\" created successfully."
fi
