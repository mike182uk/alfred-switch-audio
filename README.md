# alfred-set-audio-device

[![Version](https://img.shields.io/github/release/mike182uk/alfred-set-audio-device.svg?style=flat-square)](https://github.com/mike182uk/alfred-set-audio-device)
[![Build Status](https://img.shields.io/github/workflow/status/mike182uk/alfred-set-audio-device/CI/master?style=flat-square)](https://github.com/mike182uk/alfred-set-audio-device/actions?query=workflow%3ACI)
[![Downloads](https://img.shields.io/github/downloads/mike182uk/alfred-set-audio-device/total.svg?style=flat-square)](https://github.com/mike182uk/alfred-set-audio-device)
[![License](https://img.shields.io/github/license/mike182uk/alfred-set-audio-device.svg?style=flat-square)](https://github.com/mike182uk/alfred-set-audio-device)

An [Alfred](https://www.alfredapp.com/) workflow for setting the input / output audio device.

## Prerequisites

- [SwitchAudioSource](https://github.com/deweller/switchaudio-osx) - `brew install switchaudio-osx`
- [jq](https://stedolan.github.io/jq/) - `brew install jq`

## Installation

Download the latest version of the workflow from [here](https://github.com/mike182uk/alfred-set-audio-device/releases).

When you import the workflow into Alfred, the import screen will display a list of Workflow Variables that are available to the workflow:
  - `SwitchAudioSource_path` - The path to the `SwitchAudioSource` binary
  - `jq_path` - The path to the `jq` binary

Modify these variables if you have these binaries installed elsewhere (run `which SwitchAudioSource` / `which jq` to get the correct path).

## Usage

1. Trigger Alfred
2. Type `set-audio-in` / `set-audio-out`
3. Use the up / down key to navigate to the audio device you want to set
4. Press enter on the audio device you want to set

A notification will be displayed once showing which audio device has been set.
