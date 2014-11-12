---
layout: steroids_cli
header_title: Android Emulator
header_sub_title: Learn how to setup the standard Android emulator.
section_id: emulators
subsection_id: android-emulator
parent_id: steroids
---

# Android Emulator

**Android Emulator is Work in Progress and not guaranteed to work.** It has only been tested on OS X and Linux.

## Install

To run the emulator you need to have Android Stand-alone SDK Tools ADT Bundle installed. Head over [Android SDK](https://developer.android.com/sdk/index.html) and find the download link to *ADT Bundle* for your platform (hidden under *VIEW ALL DOWNLOADS AND SIZES*). Follow the installation instructions.

After you have installed the SDK Tools, start the `SDK Manager`

## Configure

For Steroids CLI to find the emulator, the environment variable `ANDROID_HOME` has to be set to the Android SDK path. The correct SDK folder should contain the folders `platform-tools` and `tools`.

### Mac OS X
```bash
export ANDROID_HOME=/<installation location>/android-sdk-macosx
```

### Linux
```bash
export ANDROID_HOME=/<installation location>/android-sdk-linux
```

### Windows
```bash
set ANDROID_HOME=C:\<installation location>\android-sdk-windows
```
Launch Genymotion and add a new virtual device. Select `Custom Phone 4.4.X` and give it the name *steroids*.

<img src="http://placehold.it/600x300">
<img src="http://placehold.it/600x300">

When the device has been created, you can tune the performance by adding more cores and memory under device settings. At least 2 cores are recommended.

## Running

For the  the emulator when `steroids connect` is running. To launch it, type `gen` in the connect prompt or `steroids gen` in another Terminal window. The emulator should now be booting up if everything went as expected.

## Troubleshooting

### When I start a virtual device, why does the window remain black?

You are probably in either of the following situations:

- Your network adapter may be misconfigured. In this case:
  - Run VirtualBox.
  - Open File > Preferences > Network (or VirtualBox > Preferences for Mac OS X).
  - Edit the Host-only Network by clicking .
  - Check that the adapter IPv4 address is in the same network (192.168.56.0/24 by default) as the DHCP server address, lower address bound and upper address bound. If not, your virtual device cannot start.
  - You can also remove the Host-only Network by clicking . Genymotion will automatically recreate it at the next virtual device start.
- Your firewall may block the application. The Genymotion application must connect to the virtual device via the local network. If you have a firewall, make sure that you allowed connections to the Genymotion network, set to 192.168.56.0/24 by default.

From [Genymotion Pages](https://cloud.genymotion.com/page/faq/#collapse-nostart)
