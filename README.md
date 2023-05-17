#### ⚠️ This project is no longer maintained

# alfred-switch-audio

[![Version](https://img.shields.io/github/release/mike182uk/alfred-switch-audio.svg?style=flat-square)](https://github.com/mike182uk/alfred-switch-audio)
[![Build Status](https://img.shields.io/github/actions/workflow/status/mike182uk/alfred-switch-audio/ci.yml?branch=main&style=flat-square)](https://github.com/mike182uk/alfred-switch-audio/actions/workflows/ci.yml)
[![Downloads](https://img.shields.io/github/downloads/mike182uk/alfred-switch-audio/total.svg?style=flat-square)](https://github.com/mike182uk/alfred-switch-audio)
[![License](https://img.shields.io/github/license/mike182uk/alfred-switch-audio.svg?style=flat-square)](https://github.com/mike182uk/alfred-switch-audio)

An [Alfred](https://www.alfredapp.com/) workflow for setting the input / output audio device.

## Prerequisites

- [SwitchAudioSource](https://github.com/deweller/switchaudio-osx) - `brew install switchaudio-osx`
- [jq](https://stedolan.github.io/jq/) - `brew install jq`

## Installation

Download the latest version of the workflow from [here](https://github.com/mike182uk/alfred-switch-audio/releases).

When you import the workflow into Alfred, the import screen will display a list of environment workflow variables that are available to the workflow:
  - `SwitchAudioSource_path` - The path to the `SwitchAudioSource` binary
  - `jq_path` - The path to the `jq` binary
  - `config_path` - The path to workflow config file

Modify these variables if you have the binaries or config file in a different location.

## Usage

### Setting the input audio device

1. Trigger Alfred
2. Type `set-audio-in`
3. Use the up / down key to navigate to the input audio device you want to set
4. Press enter to set the input audio device

A notification will be displayed showing which input audio device has been set.

### Setting the output audio device

1. Trigger Alfred
2. Type `set-audio-out`
3. Use the up / down key to navigate to the input audio device you want to set
4. Press enter to set the output audio device

A notification will be displayed showing which output audio device has been set.

### Setting a group of audio devices

To use this action, ensure you have a config file created for this workflow (located at ` ~/.alfred-switchaudio.json` - This location can be modified by editing the `config_path` environment workflow variable):

```json
{
  "groups": {
    "desktop": {
      "title": "Desktop",
      "input": "HD Pro Webcam C920",
      "output": "Scarlett 2i2 USB"
    },
    "airpods": {
      "title": "AirPods",
      "input": "Mike's AirPods Pro",
      "output": "Mike's AirPods Pro"
    }
  }
}
```

1. Trigger Alfred
2. Type `set-audio-group`
3. Use the up / down key to navigate to the audio device group you want to set
4. Press enter to set the input and output audio devices associated with the group

A notification will be displayed confirming the audio devices have been set.
