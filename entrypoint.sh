#!/bin/sh -l

echo "Starts"
FOLDER="$1"
GITHUB_USERNAME="$2"
GITHUB_REPO="$3"
USER_EMAIL="$5"

CLONE_DIR=$(mktemp -d)

# Setup git
git config --global user.email "$USER_EMAIL"
git config --global user.name "$GITHUB_USERNAME"
git clone "https://$API_TOKEN_GITHUB@github.com/$GITHUB_USERNAME/$GITHUB_REPO.git" "$CLONE_DIR"

echo "Before sync:"
ls -la "$CLONE_DIR"

echo "Folder to be synced:"
ls -la "$GITHUB_WORKSPACE/$FOLDER"

cp -r "$GITHUB_WORKSPACE/$FOLDER/*" "$CLONE_DIR"

cd "$CLONE_DIR"

echo "After sync:"
ls -la

git add .
git commit --message "Update from https://github.com/$GITHUB_REPOSITORY/commit/$GITHUB_SHA)"
git push origin master
