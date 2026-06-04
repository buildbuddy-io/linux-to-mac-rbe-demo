# Linux to Mac RBE demo

This repo contains a demo setup for using a Linux host machine (the
machine running bazel) to run remote actions on macOS executors. This
can be useful to avoid running macOS CI machines while still building
for Apple platforms.

This demo uses [BuildBuddy](https://buildbuddy.io) but the same approach
can be used with any RBE service.

## Demo setup

The root [`BUILD.bazel`](BUILD.bazel) file contains the `platform` and
`xcode_config` setup telling bazel how the remote executors are
configured. This is then wired up in the [`.bazelrc`](.bazelrc). See the
comments in those files for more details.
