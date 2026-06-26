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
bazel build DemoApp --remote_executor=<YOUR_REMOTE_URL>
```

If you have a BuildBuddy account with macOS executors available (not a
free account), you can use the following command:

```bash
bazel build --config=buildbuddy DemoApp --remote_header=x-buildbuddy-api-key=<YOUR_API_KEY>
```

This demo can also be built on macOS, but you must have Xcode installed
(and opened at least once) to do so.

## Configure Mac machine as remote executor
Create API key on Buildbuddy with `Executor Key(for self-hosted executors)` option enabled.

Now, download and run platform specific executor binary on your mac. Following is for M4
```
curl -fsSL https://github.com/buildbuddy-io/buildbuddy/releases/download/v2.280.0/executor-enterprise-darwin-arm64  -o executor  
chmod +x executor
./executor \                                                                                                                   
  --executor.api_key=<EXECUTOR_API_KEY> \
  --executor.app_target=grpcs://remote.buildbuddy.io \
  --executor.local_cache_size_bytes=10000000000
```

From Linux terminal, one can now compile the code as usual
```
bazel build --config=buildbuddy DemoApp --remote_header=x-buildbuddy-api-key=<YOUR_API_KEY>
```

Please note: <EXECUTOR_API_KEY> and <YOUR_API_KEY> are different.

<img width="959" height="458" alt="image" src="https://github.com/user-attachments/assets/408c5ffc-d8ba-41f7-82d5-f225628c59e8" />


