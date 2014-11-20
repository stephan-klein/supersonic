---
layout: steroids_cli
header_title: Android Emulator
header_sub_title: Learn how to setup and use Android emulator.
section_id: emulators
subsection_id: android-emulator
parent_id: tooling
---
# Android Emulator

**Android Emulator support is Work in Progress and not guaranteed to work.** Only OS X and Linux are currently supported.

## Installing

To run the emulator you need to have Android Stand-alone SDK Tools ADT Bundle installed. Head over [Android SDK](https://developer.android.com/sdk/index.html) and find the download link to *ADT Bundle* for your platform (hidden under *VIEW ALL DOWNLOADS AND SIZES*). Follow the installation instructions.

For Steroids CLI to find the emulator, the environment variable `ANDROID_HOME` has to be set to the Android SDK path. The correct SDK folder should contain the folders `platform-tools` and `tools`.

```bash
export ANDROID_HOME=/<installation location>/android-sdk-dir
```

To boost the performance of the emulator you need to have Intel® Hardware Accelerated Execution Manager installed. Head over to [Intel HAXM](https://software.intel.com/en-us/android/articles/intel-hardware-accelerated-execution-manager) and install the latest version.

After you have the SDK Tools and HAXM installed, start the `Android SDK Manager`.

```bash
android
```

From `Android 5.0 (API 21)`, install SDK platform and the available `Intel x86` system images. Make sure to also install Intel x86 Emulator Accelerator (HAXM installer) that can be found under Extras.

Now we need to create a new emulator device.

```bash
android create avd -n steroids -t android-21 --abi default/x86_64
```

This will create a new device with the name `steroids` with Android 5.0 and a x68 CPU. The name has to be `steroids` in order for the CLI to identify it.

## Running

To launch your app in the emulator, type `and` or `a` in the `steroids connect` prompt. The emulator should now start and load your app.

## Troubleshooting

### Why is the emulator so slow?
Android Emulator needs a lot of processing power and is known for not exactly being a speed demon. One way of improving the performance is to set the device to a lower resolution. This can be done through the AVD Manager. Start it by typing:

```bash
android avd
```

Here you can create new AVD's and edit existing ones. Remember to give the new device the name `steroids` for the CLI to detect it.
