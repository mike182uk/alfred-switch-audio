#!/usr/bin/env bash

SwitchAudioSourcePath=$1
jqPath=$2
query=$3

# Get the current audio device
currentDevice=$($SwitchAudioSourcePath -c -t "$query")

# Get all audio devices
devices=$($SwitchAudioSourcePath -a -t "$query" | sed "s/$currentDevice/*$currentDevice/" | sed 's/ /_/g')

# Generate JSON
# shellcheck disable=SC2016,SC2086
#                            ^ we want word splitting to happen when $devices is used for --args
$jqPath -n '$ARGS.positional | map({
  "uid": . | sub("_[()].*"; "") | gsub("[*]"; ""),
  "title": . | sub("_[()].*"; "") | gsub("_"; " ") | sub("[*]"; ""),
  "arg": . | sub("_[()].*"; "") | gsub("_"; " ") | sub("[*]"; ""),
  "autocomplete": . | sub("_[()].*"; "") | gsub("_"; " ") | sub("[*]"; ""),
  "icon": { "path": (. | if endswith("(input)") == true then "mic.png" else "speaker.png" end) },
  "subtitle": (. | if startswith("*") == true then "Currently Set" else "" end)
}) | { "items": . | sort_by( .title) }' --args $devices
