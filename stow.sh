#!/bin/bash

DOTFILES_DIR="$(pwd)"

# Ensure we're in the correct directory
if [ ! -d "$DOTFILES_DIR/.git" ]; then
    echo "Error: This script must be run from the root of your dotfiles repository."
    exit 1
fi

# Backup existing home files before adopting
BACKUP_DIR="$HOME/dotfiles-backup-$(date +%F-%T)"
mkdir -p "$BACKUP_DIR"

# echo "Backing up existing dotfiles to $BACKUP_DIR..."
# rsync -av --progress "$HOME"/.??* "$BACKUP_DIR/" --exclude ".git" --exclude ".config" --exclude "dotfiles-backup-*"

# Adopt existing system files before stowing
for dir in "$DOTFILES_DIR"/*; do
    if [ -d "$dir" ]; then
        stow -v --adopt "$(basename "$dir")"
    fi
done

# Restore repo state to discard any adopted changes
git restore .

# Re-stow to ensure correct symlinks are created
# for dir in "$DOTFILES_DIR"/*; do
#     if [ -d "$dir" ]; then
#         stow -v "$(basename "$dir")"
#     fi
# done

# echo "Dotfiles successfully stowed. Backup of old dotfiles is in $BACKUP_DIR."
echo "Dotfiles successfully stowed."
