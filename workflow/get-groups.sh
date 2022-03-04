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
  icon: { path: "050110D1-6771-4E97-9448-8CFDC1131FB9.png" }
}) | sort_by(.title) | { items: . }' "$configPath"
