---
layout: steroids_wrapper
parent_id: tooling
section_id: versioning
subsection_id: edge-versions
---
<section class="docs-section" id="edge-versions">
# Edge versions

It takes a while for us to go through the full QA testing, documentation and Scanner App Store/Google Play submission/approval process for a new **stable** wrapper version (especially on iOS, where the Apple review process takes its time). Thus, there are often useful features and bugfixes that are already in our codebase, but not yet available as a **stable** release.

New features and more complex bugfixes are available in **Edge** versions of the wrapper, available via the [Build Service][build-service].

## Fine print

Please note that Edge versions haven’t gone through full QA testing and thus might have some new and surprising bugs that will get squashed before the actual release. Thus, it is not advised to submit Edge builds to the App Store/Google Play (and if you're forced to do so, make sure to test your app thoroughly).

## Edge versions

**Edge versions** (denoted by the `-edge` suffix, e.g. `3.5.0-edge`) include features and bugfixes that are upcoming in the next **stable** release. They are available only in the Build Service. The same build configuration is used for **Edge** builds as for regular builds.

New features in **Edge** builds might require the [Supersonic `next` branch][supersonic-next] to work (read more below). If documentation is available, it can be found in the [nightly API docs][api-nightly].

## Edge patch versions

Since multiple Edge version releases might be released before the changes in an Edge version are incorpoprated to a stable release, Edge versions can also have several sub-releases, e.g. `3.5.0-edge-1`.

## Changelog

You can find the changelog for **Edge** versions on GitHub:

 - [iOS wrapper edge changelog](https://github.com/AppGyver/scanner/blob/master/changelog-ios-edge.md)
 - [Android wrapper edge changelog](https://github.com/AppGyver/scanner/blob/master/changelog-android-fresh-edge.md)

## Using the next branch of Supersonic

The Edge features are usable with the [next branch of Supersonic][supersonic-next]. To use them, clone the Supersonic repo to a local folder and checkout the `next` branch. Then, run `$ npm install` to install the required dependencies, and then run `$ grunt` to create the `dist/` folder, from where you can find the latest versions of all Supersonic assets. Copy the files to your project manually and include them like any HTML components.

</section>

[api-nightly]: /supersonic/api-reference/nightly
[build-service]: http://cloud.appgyver.com
[supersonic]: https://github.com/AppGyver/supersonic
[supersonic-next]: https://github.com/AppGyver/supersonic/tree/next
[github-wrapper-versions]: https://github.com/AppGyver/scanner/blob/master/runtime-versions.md

