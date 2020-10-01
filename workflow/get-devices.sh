#!/usr/bin/env bash

SwitchAudioSourcePath=$1
jqPath=$2
query=$3

# shellcheck disable=SC2016
$SwitchAudioSourcePath -a -t "$query" | $jqPath --slurp --raw-input '
def stripsuffix: sub(" \\((input|output)\\)"; "");

split("\n")[:-1] | to_entries | map({
  uid: .key,
  title: .value | stripsuffix,
  arg: .value | stripsuffix,
  autocomplete: .value | stripsuffix,
  icon: {
    path: (.value | if endswith("(input)") == true then "mic.png" else "speaker.png" end)
  },
  subtitle: (if (.value|stripsuffix) == $current then "Currently Set" else "" end)
}) | { items: . | sort_by( .title) }' --arg current "$($SwitchAudioSourcePath -c -t "$query")"
