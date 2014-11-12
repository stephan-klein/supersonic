---
layout: steroids_cli
header_title: iOS Simulator
header_sub_title: Learn how to setup and use the iOS Simulator.
section_id: emulators
subsection_id: ios-simulator
parent_id: steroids
---

# iOS Simulator

## Installing

The iOS Simulator is included in XCode. XCode is can be downloaded from Mac App Store. In addition to XCode, Command Line Tools has to be installed. You can trigger the installation with the following command.

```bash
xcode-select --install
```

Verify that the Simulator is working by launching it.

```bash
open /Applications/Xcode.app/Contents/Developer/Applications/iOS Simulator.app
```

If the Simulator started you are good to go!

## Running

To launch your app in the Simulator, type `sim` or `s` in the `steroids connect` prompt. The simulator should now start and if everything went as expected you should see your app.
