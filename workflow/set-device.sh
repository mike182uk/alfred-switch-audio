#!/usr/bin/env bash

type=$1
query=$2

# Set audio device
SwitchAudioSource -s "$query" -t "$type" >/dev/null

# Get current audio device
SwitchAudioSource -c -t "$type"
