---
layout: steroids_cli
header_title: Genymotion emulator
header_sub_title: Learn how to setup and use Genymotion emulator.
section_id: emulators
subsection_id: genymotion
parent_id: tooling
---
# Genymotion

Genymotion heavily simplifies the use of Android emulators by running them in a virtual environment and removes the requirement of having Android SDK installed.
Note that Genymotion support in Steroids CLI is "Work in Progress".

## Installing

1. Genymotion runs the emulator in Oracle VirtualBox, so first you need to have that installed. On [Oracle VirtualBox](https://www.virtualbox.org/) you will find instructions and download links. If you are running on Windows, we recommend you downloading the Genymotion version that comes bundled with Virtual Box and skip this step.

2. After VirtuaBox is installed, head over to [Genymotion](http://www.genymotion.com/). Genymotion is free to for non-commericial use but requires you to create an account. So sign up and download the latest version for your platform.

3. Install Genymotion and make sure to install the **Genymotion Shell** (when prompted about it) too. Without the Shell installed, Steroids CLI won't be able to launch the emulator.

## Configure

Launch Genymotion and add a new virtual device. Android version should be set to the latest (currently 5.0). Choose a device model you would like to emulate. We recommend choosing an older device with a low resolution (e.g. Nexus 4) for smoother experience. Give the device the name `steroids`.

<img src="/img/tooling/emulators/genymotion-create-1.png" alt="Genymotion Create Device" height="580" width="790">

<img src="/img/tooling/emulators/genymotion-create-2.png" alt="Genymotion Create Device Name" height="580" width="790">

When the device has been created, you can tune the performance by adding more processors and memory under device settings. At least 2 processors are recommended.

<br>
<img src="/img/tooling/emulators/genymotion-edit.png" alt="Genymotion Edit Device">

### Paths

Steroids CLI defaults to the following installation paths where it looks for Genymotion and Genymotion Shell.
These paths can be overridden by setting the environment variables `GENYMOTION_APP`/`GENYMOTION_SHELL`.

#### Mac OS X
```bash
GENYMOTION_APP=/Applications/Genymotion.app
GENYMOTION_SHELL=/Applications/Genymotion Shell.app
```

### Windows
```bash
GENYMOTION_APP=C:/Program Files/Genymobile/Genymotion
```

### Linux
```bash
GENYMOTION_APP=""
GENYMOTION_SHELL=""
```

## Running

To launch your app in Genymotion, type `gen` or `g` in the `steroids connect` prompt. The emulator should now start and if everything went as expected you should see your app.

In the case that you have multiple devices setup in Genymotion (e.g. testing different APIs) you can specify which one you would launch by giving the name of the emulator as a parameter. E.g. `gen nexus4`


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
