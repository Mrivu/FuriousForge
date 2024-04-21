#!/bin/sh
echo -ne '\033c\033]0;Furious Forge\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/Furious Forge.x86_64" "$@"
