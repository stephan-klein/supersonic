---
layout: steroids_cli
header_title: Connect Screen
header_sub_title: Troubleshoot connectivity issues with the Scanner
section_id: connect-screen
subsection_id: troubleshooting-scanner-connectivity
parent_id: steroids
---
<section class="docs-section" id="troubleshooting-scanner-connectivity">
#Troubleshooting Scanner connectivity

If you are having trouble getting AppGyver Scanner to connect to your computer running<br>`$ steroids connect`, try the steps below in order. If a step fails, please contact us on the [forums](http://forums.appgyver.com), describe what you've done and we'll look into the issue more closely.

## Are your computer and mobile device on the same WLAN?

Make sure that your computer and mobile device are on the same WLAN. Connecting your computer to your development mobile device's internal WLAN hotspot doesn't currently work.

If the computer has any other internet connections such as ethernet connected, try disconnecting them and only connecting to the WLAN. After this please restart Steroids CLI and generate a new QR code.

## Is your firewall configured correctly?

Make sure your firewall/NAT are configured correctly. Note that on Windows, Node.js shows up as "Evented I/O for V8 JavaScript" in Firewall.

## Have you disabled Personal Hotspot on iOS?

Having the Personal Hotspot option enables can cause the connection to fail, even if both your iOS device and your computer are connected to an external WLAN.

## Is the Steroids server running?

Make sure you have `$ steroids connect` running in your project directory. Try opening the URL below in your computer's browser:

```
http://localhost:4567/appgyver/api/applications/1.json
```

If you get a JSON file, the local server is running fine.

## Can your mobile device connect to the Steroids server?

Next, try opening the same URL on your mobile device's web browser. Remember to change the `<YOUR_IP_ADDRESS>` below to your computer's IP address.

```
http://<YOUR_IP_ADDRESS>:4567/appgyver/api/applications/1.json
```

If you get the JSON file, your phone is able to connect to the Steroids server.

## Does your Android device have Developer Options enabled?

Some users have reported that enabling Developer Options fixes connectivity issues on Android, in particular a case where the Steroids server is reachable from a mobile browser, but the app still won't load. On Android 4.x, go to Settings > About Device, find the Build Number field and tap on it 7 times to enable Developer Options.

## Does your Android device have multiple user accounts enabled?

There's a known issue where some Android devices fail to open Steroids projects when multiple user accounts are enabled.

## Does the iOS Simulator open?

Does running the `simulator` command in the `$ steroids connect` console open the iOS Simulator without any hiccups? (Note that this step only works on a Mac running OS X.)

## Still out of luck?

Drop us a line at the [forums](http://forums.appgyver.com) and we'll dig deeper! Be sure to include all relevant information such as Steroids CLI version, OS version, Node.js version etc.

</section>
