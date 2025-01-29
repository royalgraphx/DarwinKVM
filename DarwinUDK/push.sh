#!/bin/bash

git add --all
echo "Enter Commit Details:"
read varcommit

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
  commit_message+=""$'\n'$'\n'"$coauthor"
done

if [ "${#coauthors[@]}" -gt 0 ]; then
  git commit -m "$commit_message"
else
  git commit -m "$varcommit"
fi

git push

if [ "${#coauthors[@]}" -gt 0 ]; then
  echo "Commit \"$varcommit\" with co-authors pushed successfully."
else
  echo "Commit \"$varcommit\" pushed successfully."
fi
