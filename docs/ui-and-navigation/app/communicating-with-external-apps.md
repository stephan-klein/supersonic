---
layout: docs_ui
header_title: Communicating with external apps
header_sub_title: Learn how to communicate back and forth between other apps on your device.
section_id: app
subsection_id: communicating-with-external-apps
topics:
  - name: Opening a Web URL
  - name: Opening an External App
  - name: openURL
    method: true
  - name: Opening Your App from External Apps
  - name: getLaunchURL
    method: true
  - name: Open
---

# Communicating with External Apps

Supersonic offers two ways to communicate with external apps, which both utilize the ability for apps to have **Custom URL Schemas** – special URLs that open a specific app.

<section class="docs-section" id="opening-a-web-url">
## Opening a Web URL
In a Supersonic app, `<a href>` links won't open in the device's browser. To do that, you need to use the [`supersonic.app.openURL()`](#openurl) method. Passing in an URL that starts with `http://` (or `https://`) will open the URL in the device's default web browser.

### Example: Open Google
```javascript
supersonic.app.openURL("http://www.google.com");
```

</section>

<section class="docs-section" id="opening-an-external-app">
## Opening an External App from Your Supersonic App
You can also use the [supersonic.app.openURL](#openurl) method to open an external app such as SMS, Google Maps or Mail from within your app. Just pass the corret URL scheme for the method, and the app will open if it's installed.

### Example: Compose an SMS
```javascript
supersonic.app.openURL("sms:1-408-555-1212");
```
</section>

<section class="docs-section" id="openurl">
{% assign method = site.data.core.app.openURL %}
{% include api_method.md method=method %}
</section>

<section class="docs-section" id="opening-your-app-from-external-apps">
## Opening Your Supersonic App from External Apps

Custom URL schemes work the other way, too. The Build Service allows you to define custom URL schemes – e.g. `myawesomeapp://` – that let other apps communicate with your apps, e.g. a link in an email can open your app directly and then direct the user to a specific location in your app.

The app will open automatically once the link is clicked, but you can use the [`supersonic.app.getLaunchURL()`](#getlaunchurl) function to access the full URL string that was used to open your app.

### Testing Custom URL Schemes with the Default AppGyver Scanner

With the default AppGyver Scanner, the URL scheme cannot be changed: it's registered with the `steroids-scanner://` URL scheme. Thus, links that start with `steroids-scanner://` will open the Scanner app (provided the app where the link is clicked handles URL schemes correctly).

To pass data to your app, you can add any string after the URL scheme, including query parameters. The [supersonic.app.getLaunchURL](#getlaunchurl) API call is used to retrieve the custom URL string that was used to open the app.

For example, if you open the application with `steroids-scanner://login?username=quentin&password=monkey`, `supersonic.app.getLaunchURL` returns the whole URL string, URL scheme included. You can then parse it in JavaScript to get the username and password.

Typically you would want to make the API call inside the Cordova's `resume` event (triggered when the app returns from the background):

```javascript
document.addEventListener("resume", function() {
  urlObject = supersonic.app.getLaunchURL()
  supersonic.logger.log(urlObject)
});
```

It's also a good idea to check in your app initialisation code if `supersonic.app.getLaunchURL()` returns `null`, for the cases where your app is not running when a link with the custom URL scheme is used.

Note that AppGyver Scanner needs to be running your app in order to use `steroids-scanner://` URL scheme.  If the application is not running, the scanner screen used to scan QR codes will open with this URL scheme.

Note also that AppGyver Scanner also responds to the `appgyver://` URL scheme, which is used by the Scanner app itself to open specific applications. Opening your Steroids app with the `appgyver://` URL scheme and calling `steroids.app.getLaunchURL` will return `undefined`, so you shouldn't use it in development.

### Defining Your Own URL Schemes

You need a custom Ad Hoc or Scanner build to use custom URL schemes. The custom URL schemes are defined in the [Build Service](http://cloud.appgyver.com), in the Build Config section. Enter your URL schemes inside the "Custom Protocols" array, e.g.

```javascript
[
  "myawesomeapp",
  "myawesomeapp-dev"
]
```

would register your app for both `myawesomeapp://` and `myawesomeapp-dev://` URL schemes.
</section>

<section class="docs-section" id="getlaunchurl">
{% assign method = site.data.core.app.getLaunchURL %}
{% include api_method.md method=method %}
</section>
