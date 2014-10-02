---
layout: "docs_home"
version: "page.method"
versionHref: "/first-mile"
path: "basics/connect_screen"
section:
  name: "First mile"

title: "Monitor your app via the connect window"
header_sub_title: ""
---

The connect window is your one-stop shop for app management and debugging. It opens up when you run `steroids connect` in your project folder. There are five main views: Preview, Logs, Documentation, Build Settings and Data, which are accessible via the menu bar at the top of the page. Each of these views has it's own special purpose, let's take a look at a couple of them. Remember, that to re-open the connect window at any time, type `qr` in the Steroids terminal.

##Preview screen

This screen you should already be familiar with. It shows the QR code which you can use to scan your app with an AppGyver Scanner, as well as providing an option to launch the iOS Simulator via the "Launch Simulator" button. This screen also shows a list of currently connected devices for your convenience.

##Logs screen

Here's where it starts to get interesting. When developing apps, you will inevitably have to debug your code at some point. There are of course many ways to do this, but the Logs screen is a very useful tool for debugging purposes. There are a variety of filtering options available in the top part of your screen. You can filter log events by type, device and even isolate a specific view for logging. Let's take a moment to see the logger in action. Provided you are following the tutorials in order, you should have a freshly generated Supersonic app with `steroids connect` running. Open up `app/common/views/getting-started.html` and add the following to the end of the file:

```html
<script>
throw new Error("Oh no, there's a bug in my app!")
</script>
```

Now, refresh your app by pressing Enter in the Steroids terminal, and after the app reloads on your device, navigate to the Logs screen. By default, filters will be set to all, so you will see something akin to the following in the screen:

> Richard's iPhone  http://localhost/app/common/getting-started.html  17:23:14.536
"Error: Oh no, there's a bug in my app! - undefined:undefined"

Congratulations, you've found your first bug! You can clear the log by pressing the "clear log" button. Now, if you remove the code we inserted and refresh the project, the log should not show any more errors. The logger can log much more than errors though, as we will learn in future tutorials.

##Documentation

The Documentation screen provides quick access to our API docs, as well as guides and tutorials. They're an invaluable resource for any developer, and will likely see heavy use as you continue working with Steroids and Supersonic. For now, it's enough to know that they are there.

##Build Settings

At some point you will want to create an actual standalone build of your app, or a custom Scanner for testing. There is a moderate amount of config involved, which will be discussed at a later point. If you are following the first mile guides in order, this screen will only feature an option to deploy your app to the AppGyver Cloud. This will also be explained in detail further on, but feel free to push the "deploy" button now if you want to.

##Data

One of the major pains we wanted to address with Supersonic is working with backends and actual data. The Data screen is your management console for Steroids Data, a special Data provider we have created to cut out the hassle when working with data. Once again, don't worry if this doesn't really mean anything to you right now, it will be explained later on as we create a sample app.