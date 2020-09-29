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

Download the latest version of the workflow from  [here](https://github.com/mike182uk/alfred-set-audio-device/releases).

## Usage

1. Trigger Alfred
2. Type `set-audio-in` / `set-audio-out`
3. Use the up / down key to navigate to the audio device you want to set
4. Press enter on the audio device you want to set

A notification will be displayed once the audio device has been set.

## Troubleshooting

### The workflow is reporting that `SwitchAudioSource` or `jq` can not be found

The workflow will search for `SwitchAudioSource` / `jq` in:

- `/usr/local/bin/`
- `/usr/bin`
- `/bin`
- `/usr/sbin`
- `/sbin`

If you have installed `SwitchAudioSource` / `jq` to a different location you will need to modify the workflow to use this path:

1. Go to Alfred preferences
2. Select the `Set Audio Device` workflow
3. Double click on a `Script Filter` node
4. In the script field, you should see `PATH=/usr/local/bin/:$PATH` before the command that is being executed. Modify this to include your path for `SwitchAudioSource` / `jq`:

```sh
PATH=$PATH:/my/custom/path/bin ./get-devices input
```

Repeat the above for each `Script Filter` & `Run Script` node in the Alfred workflow.
