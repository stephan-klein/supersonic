---
layout: "docs_home"
version: "page.method"
versionHref: "/first-mile"
path: "setup/create_project"
section:
  name: "First mile"

title: "Create a Supersonic project"
header_sub_title: ""
---

By this point all you've done is install various tools on your machine without actually getting to do anything yourself. It's time to dive into an actual Supersonic project. If you are an existing Steroids user and are looking to integrate Supersonic with your existing app, see the [migration guide]().

## Create a new project

In your terminal, you can create a new project with the following:

```bash
steroids create myProjectcd myProject
```

In development mode, Steroids CLI runs a local server on your computer to serve your project to either the iOS Simulator or an iOS or Android device.

#Running your project on a real device

1.  Download [AppGyver Scanner for iOS](https://itunes.apple.com/us/app/appgyver-scanner/id575076515?mt=8) or [AppGyver Scanner for Android](https://play.google.com/store/apps/details?id=com.appgyver.freshandroid).
2. Connect your device to the same WLAN as your computer.
3. Open Terminal, go to your Steroids project folder and run:
    `steroids connect`
4. The Steroids server starts and a browser window will open with a QR code. This window is a tool in itself, but we will look into later. For now all you need is the QR code.
5. Scan the QR code with the AppGyver Scanner app.
6. Your project will load to your device.

_Tip:_
If you need the QR code again, you can simply type `qr` in the Steroids console (available in the Terminal window running `steroids connect`) and a new web page with the code will open.

If you don't have access to a device and are using OS X, you can also preview your project in the iOS Simulator.

#Running your project in the iOS Simulator

>__Please notice:__
>We only support the iOS Simulator at the moment. Android development requires an Android device.

This step requires OS X and [Xcode 6.0](https://developer.apple.com/xcode/) or later to be installed.

Running the Simulator requires that you have started a Steroids server that is serving your project files. You already did this by running `steroids connect` in the terminal, but if you have since closed the connection, rerun the command.

Now, open the browser window from where you scanned the QR code with your device. If you have closed the window, remember that you can re-open it by typing `qr` in the Steroids console. In the Connect window, next to the QR code you will have an option to launch the iOS Simulator. Press it and your app will boot up in the Simulator.

As you get more familiar with the platform, you will often want to launch the Simulator straight from the terminal. To do that, simply enter the following command in the Steroids console:

```bash
simulator
```

The iOS Simulator will open and your app will load automatically.

That's it! Now let's take a look at what is happening in the [QR code screen](http://supersonic.testgyver.com/first-mile/basics/connect_screen).
