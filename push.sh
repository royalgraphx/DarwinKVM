#!/bin/bash
git add --all
echo Enter Commit Details
read varcommit
git commit -m "$varcommit"
git push
echo Commit "$varcommit" pushed successfully.