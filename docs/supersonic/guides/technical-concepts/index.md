---
layout: docs_overview
title: Supersonic Documentation
header_title: Supersonic Core
header_sub_title: Learn how the Supersonic Framework is constructed and the core technologies it uses.
parent_id: supersonic
section_id: technical-concepts
---

<section class="docs-section" id="overview">
# Overview - What is Supersonic?

AppGyver Supersonic goes beyond just providing a layer for integrating your HTML5 application with native device capabilities. You're able to write HTML using default CSS components that look good out of the box, use [Web Components][web-components] that map your HTML to fully native interfaces, and access native APIs with more ease than ever.

Supersonic is framework agnostic. It's a library consisting of CSS, Javascript and Web Components, which you can use with your framework of choice. However, Supersonic comes with a bundle that integrates with [Angular.js][angular-overview] by Google for even more awesomeness.

## Updating Supersonic.js

Supersonic.js is distributed via Bower. To update it to the latest version, simply run in your project folder:

```
$ steroids update
```

This will update both the Bower and npm dependencies of your project, based on the packages and version numbers defined in the `bower.json` and `package.json` files.

Note that new Supersonic features might require a certain version of the [AppGyver Wrapper](/tooling/wrapper/), so be sure to keep your Scanner app and stand-alone builds updated to the latest version:

* [AppGyver Scanner for iOS](https://itunes.apple.com/us/app/appgyver-scanner/id575076515?mt=8)
* [AppGyver Scanner for Android](https://play.google.com/store/apps/details?id=com.appgyver.freshandroid&hl=en)

## Reporting issues

All AppGyver-related issues are tracked centrally on [GitHub](https://github.com/appgyer/steroids/issues). Before submitting a new issue, search through the issues to see if it has been opened or resolved already.

When submitting a issue, please include as detailed reproduction case as possible. For an excellent bug reproduction, it's very important that a bare minimum of HTML/CSS/JavaScript is used. This prevents false diagnoses – when the app is complex, it might look like something is broken on the native side, when in reality it's just a JavaScript error caused by a misconfigured framework, a CSS style acting up etc. You should strive to have just the issue and nothing else in your project.
</section>

[angular-overview]: /supersonic/guides/technical-concepts/angular-js
[web-components]: /supersonic/guides/technical-concepts/web-components
