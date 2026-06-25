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

Also see [Reddit's write
up](https://www.reddit.com/r/bazel/comments/1onrpbq/leveraging_bazel_multiplatform_rbe_for_reddits)
of this setup for more details.

## Usage

To build this demo locally, build on a Linux host using remote execution:

```bash
bazel build --config=buildbuddy DemoApp --remote_header=x-buildbuddy-api-key=<YOUR_API_KEY>
```

You can get a free API key [here](https://app.buildbuddy.io/settings/personal/api-keys)

Please Note: Personal account does not have mac cores in [free account](https://github.com/buildbuddy-io/linux-to-mac-rbe-demo/issues/7)  

You can also use your own remote execution service as long as you have
macOS executors available by passing the relevant `--remote_executor`.

This demo can also be built on macOS, but you must have Xcode installed
(and opened at least once) to do so.
