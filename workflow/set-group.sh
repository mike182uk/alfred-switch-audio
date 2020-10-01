#!/usr/bin/env bash

SwitchAudioSourcePath=$1
jqPath=$2
configPath="${3/#\~/$HOME}"
query=$4

function getDevice() {
	# shellcheck disable=SC2016
	$jqPath -r '.groups | to_entries | map({
    id: .key,
    input: .value.input,
    output: .value.output
  }) | .[] | select(.id == $id)[$key]' --arg id "$1" --arg key "$2" "$configPath"
}

$SwitchAudioSourcePath -s "$(getDevice "$query" input)" -t input
$SwitchAudioSourcePath -s "$(getDevice "$query" output)" -t output
