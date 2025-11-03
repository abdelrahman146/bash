#!/usr/bin/env bash

# cd_proj: Change directory into a Tradeling project
# Usage: cd_proj <project_name> [prefix]
#   prefix: "true" or "false", defaults to "true"

cd_proj() {
  local project="$1"
  # default prefix to true if not provided
  local prefix="${2:-true}"
  local base=~/tradeling

  if [[ "$prefix" == "true" ]]; then
    # When prefix is true, look for web- or module- prefixed directories
    if [[ -d "$base/web-$project" ]]; then
      cd "$base/web-$project" || return
    elif [[ -d "$base/module-$project" ]]; then
      cd "$base/module-$project" || return
    else
      echo "Error: Neither '$base/web-$project' nor '$base/module-$project' exists." >&2
      return 1
    fi
  else
    # No prefix: use the project name as-is
    if [[ -d "$base/$project" ]]; then
      cd "$base/$project" || return
    else
      echo "Error: '$base/$project' does not exist." >&2
      return 1
    fi
  fi
}
