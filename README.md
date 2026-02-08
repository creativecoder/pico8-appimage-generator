# PICO-8 AppImage Generator

> [!important] This repo does not contain any PICO-8 binaries. You need to
> provide these yourself by downloading them from
> [lexaloffle.com](https://www.lexaloffle.com/games.php).

This project generates an [AppImage](https://appimage.org/) for running the
PICO-8 fantasy console on Linux. The packaged AppImage includes a `.desktop`
entry with icons and registers mimetypes for `.p8`, `.p8.png`, and `.p8.rom`
files so the application can be integrated with a desktop environment.

## Prerequisites

The following need to be installed and available in your shell's `PATH`:

**[linuxdeploy](https://github.com/linuxdeploy/linuxdeploy)**

- Download the
  [latest release](https://github.com/linuxdeploy/linuxdeploy/releases)
- Make sure the file is executable (`chmod +x linuxdeploy-*`)
- Rename and move the file to a location in your shell's `PATH`, e.g.
  (`~/.local/bin/linuxdeploy`)

**[ImageMagick](https://imagemagick.org)**

- Install through your system's package manager, with homebrew, or download and
  run the binary directly
- `magick` must be available in your shell's `PATH`

### PICO-8 source files

[Download](https://www.lexaloffle.com/games.php?page=updates) and unzip PICO-8
for Linux into the root of this project.

## Build

- Run `make` in the project root to build `PICO-8-x86_64.AppImage`.
- The `SRC` env should be set to the relative path of the unzipped PICO-8
  download

```sh
SRC=./pico-8_0.2.7_amd64 make
```

## Integrate with desktop environment

To integrate the AppImage with your desktop environment

- Install [Gear Lever](https://gearlever.mijorus.it/) use it to open the
  generated AppImage file
- After opening, select **Move to the app menu**
