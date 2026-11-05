#!/usr/bin/env bash
set -euo pipefail

# Required plugin settings (Drone injects these as PLUGIN_* env vars)
: "${PLUGIN_REPO_URL:?PLUGIN_REPO_URL is required}"
DEST="${PLUGIN_DEST:-repo}"
BRANCH="${PLUGIN_BRANCH:-}"

if [ ! -f "$HOME/.netrc" ]; then
  echo "No .netrc found at \$HOME/.netrc - cannot authenticate" >&2
  exit 1
fi

echo "Cloning ${PLUGIN_REPO_URL} into ${DEST}..."

if [ -n "$BRANCH" ]; then
  git clone --branch "$BRANCH" --single-branch "$PLUGIN_REPO_URL" "$DEST"
else
  git clone "$PLUGIN_REPO_URL" "$DEST"
fi

echo "Clone complete."
