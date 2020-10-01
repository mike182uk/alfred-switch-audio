#!/usr/bin/env bash

jqPath=$1
configPath="${2/#\~/$HOME}"

if [ ! -f "$configPath" ]; then
	exit
fi

$jqPath '.groups | to_entries | map({
  uid: .key,
  title: .value.title,
  subtitle: (.value.input + " · " + .value.output),
  arg: .key,
  autocomplete: .value.title,
  icon: { path: "zap.png" }
}) | sort_by(.title) | { items: . }' "$configPath"
