---
layout: docs_first_mile
title: Supersonic Documentation
header_title: Interacting with the AppGyver team and your peers
header_sub_title:
section_id: sixth-mile
subsections:
  - name: Overview
  - name: The developer community
  - name: Reporting issues
  - name: Creating reproductions
---

<section class="docs-section" id="overview">
## Overview

We believe that a big part of creating a great product is the userbase around the product.
</section>

<section class="docs-section" id="the-developer-community">
## The developer community
AppGyver has an awesome developer community that is constantly growing. Check out the discussion on the [forums][]

### Your question may already have an answer
Most often you aren't alone with your problems. Before starting a new thread on a subject, check to see if one already exists by using the search in the AppGyver forums. On non-AppGyver related subjects such as general HTML or JavaScript questions, you will often find help online in places such as [stackoverflow](http://www.stackoverflow.com). For bug reports, also search the [GitHub issue tracker][github-issues].

### Found/created something awesome? Share it!
If you come up with a feature or app that is awesome, don't hesitate to share it with the rest of us. An awesome feature (or feature idea) might be made even better when mulled over by a few more developers. If you send us links to your finished app and we are impressed, you might even get a spot in the [AppGyver showcase][app-showcase].
</section>

<section class="docs-section" id="reporting-issues">
## Reporting issues
At some point or another, you will most likely run into an problem that blocks you from completing development on your app. The problem might be a bug in the platform or something as trivial as a typo in your code, but when you're stuck it's prudent to reach out for help. The AppGyver team and the rest of the Steroids community are more than happy to help.

### Reporting bugs
If you believe you've found a bug in the platform, we're very interested in hearing about it. Report your problem in the [AppGyver forums][forums], and accompany the issue description with as much detail as you have available. This includes

  - runtime platform (Android or iOS) and version number used
  - `steroids.js` and `supersonic.js` versions (check the version numbers from `/bower_components/<library-name>/.bower.json`)
  - OS version of the test device
  - whether the issue occurs on scanner or standalone builds (or both)
  - a [reproduction](#creating-reproductions) of the issue
  - for CLI issues, also include the OS (and version)of the development machine

The more detail you provide, the easier it will be for us to verify an issue and add it to the backlog to be fixed. All known issues are added to our [GitHub issue tracker][github-issues]. After your issue is verified, you can follow the GitHub issue to be notified when it is fixed, or participate in the discussion that takes place.

### Need help with your code
Sometimes you just need help implementing some functionality, in which case the [forums][forums] are once again your best starting point. Describe your problem clearly and show what approach you have already tried by providing a [reproduction link](#creating-reproductions). In the case of a one line code snippet it's probably ok to just embed the code in the thread, but be aware that most people are reluctant to debug code they cannot manipulate themselves. Also use proper code formatting by adding a line of three backticks ( \`\`\` ) before and after the code block.

### Requesting new features
Sometimes you will run into a situation where the feature you want is not yet implemented in the AppGyver superstack. Check The GitHub issue tracker for [feature requests][github-feature-requests] and if you don't find your feature mentioned, create a new thread in the [forums][forums] detailing the feature request. Once again be descriptive and try to provide motivation for why that particular feature would be awesome.
</section>

<section class="docs-section" id="creating-reproductions">
## Creating reproductions

A good reproduction goes a long way towards getting your issue looked at and fixed. You can clone the [Steroids Repro Template][repro-template] to your computer and use it as a template when creating a repro case for the issue at hand. Remember to keep it simple!

### Using the repro template

Now, for an excellent bug reproduction, it's very important that a bare minimum of HTML/CSS/JavaScript is used. This prevents false diagnoses – when the app is complex, it might look like something is broken on the native side, when in reality it's just a JavaScript error caused by a misconfigured framework, a CSS style acting up etc. You should strive to have just the issue and nothing else in your project. Once you have your repro ready, just [report](#reporting-issues) your issue on the forums and link to the reproduction.
</section>

[app-showcase]: http://www.appgyver.com/showcase
[forums]: https://forums.appgyver.com
[github-issues]: https://github.com/AppGyver/steroids/issues
[github-feature-requests]: https://github.com/AppGyver/steroids/issues?q=is%3Aopen+is%3Aissue+label%3Afeature
[repro-template]: https://github.com/AppGyver/steroids-repro-template