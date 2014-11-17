---
layout: guides_navigation
section_id: navigating-between-apps
subsection_id: opening-external-urls
---

# Opening external URLs

Besides regular web links, Supersonic apps support some custom url schemes that allow you to initiate sending an email or SMS directly from your app.

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
{% assign method = site.data.supersonic.app.openURL %}
{% include api_method.md method=method %}
</section>
