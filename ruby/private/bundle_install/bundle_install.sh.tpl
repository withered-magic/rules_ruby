#!/usr/bin/env bash
set -euo pipefail

{env}

if [[ "{has_git_gem_srcs}" == "1" ]]; then
    export BUNDLE_CACHE_PATH="/tmp/bundle-cache"
    echo "Detected installing gems from Git, creating temporary Bundler cache in $BUNDLE_CACHE_PATH ..."
    {ruby_path} {sync_bundle_cache_path} "$(dirname "$BUNDLE_GEMFILE")/vendor/cache" "$BUNDLE_CACHE_PATH"
fi

{ruby_path} {bundler_exe} install --standalone --local

{patches}

# vim: ft=bash
