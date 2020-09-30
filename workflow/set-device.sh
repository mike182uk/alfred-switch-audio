#!/usr/bin/env bash

SwitchAudioSourcePath=$1
type=$2
query=$3

# Set audio device
$SwitchAudioSourcePath -s "$query" -t "$type" >/dev/null

# Get current audio device
$SwitchAudioSourcePath -c -t "$type"
