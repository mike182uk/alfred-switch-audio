#!/usr/bin/env bash

SwitchAudioSourcePath=$1
jqPath=$2
configPath="${3/#\~/$HOME}"
query=$4

if [ ! -f "$configPath" ]; then
	echo "Config file not found"
	exit
fi

function getDevice() {
	$jqPath -r ".groups | to_entries | map({
    \"id\": .key,
    \"input\": .value.input,
    \"output\": .value.output
  }) | .[] | select(.id == \"$1\").$2" "$configPath"
}

inputDevice=$(getDevice "$query" "input")
outputDevice=$(getDevice "$query" "output")

$SwitchAudioSourcePath -s "$inputDevice" -t input
$SwitchAudioSourcePath -s "$outputDevice" -t output
