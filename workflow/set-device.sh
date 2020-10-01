#!/usr/bin/env bash

SwitchAudioSourcePath=$1
type=$2
query=$3

result=$($SwitchAudioSourcePath -s "$query" -t "$type")

[[ $result =~ "audio device set to" ]] && echo "$query"
