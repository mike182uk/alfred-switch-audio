#!/usr/bin/env bash

jqPath=$1
configPath="${2/#\~/$HOME}"

if [ ! -f "$configPath" ]; then
	echo "Config file not found"
	exit
fi

$jqPath '.groups | to_entries | map({
  "uid": .key,
  "title": .value.title,
  "arg": .key,
  "subtitle": (.value.input + " · " + .value.output),
  "icon": { "path": "zap.png" }
}) | sort_by(.title) | { "items": . } ' "$configPath"
