---
layout: steroids_wrapper
parent_id: tooling
section_id: versioning
---

<section class="docs-section" id="overview">
# Versioning

The AppGyver wrapper comes in two different version types: stable and edge. Stable versions are larger releases and are always accompanied by a new AppGyver Scanner app available in the App Store or Google Play. A stable version always goes through extensive quality assurance before it is released.

The changelogs for stable releases are available on GitHub:

 - [iOS wrapper Stable version changelog](https://github.com/AppGyver/scanner/blob/master/changelog-ios.md)
 - [Android wrapper Stable version changelog](https://github.com/AppGyver/scanner/blob/master/changelog-android-fresh.md)

</section>
<section class="docs-section" id="edge-versions">
## Edge versions

Due to the requirement for quality control and submission times for App Store apps being counted in days, not hours, the stable version can sometimes be somewhat behind the times. In order to be able to offer the latest and greatest AppGyver has to offer – as well as any urgent bug fixes – edge versions of the AppGyver wrapper can be accessed via the AppGyver [Build Service][build-service]. Edge versions are released without extensive QA, although we do try to make sure nothing is completely broken.

Read more about the edge versions by clicking the link in the side navigation.
</section>
<section class="docs-section" id="js-update">
## Keeping Supersonic up to date

Most times a new wrapper version is accompanied with an update to [supersonic][supersonic-repo], so be sure to update it when changing wrapper versions. This ensures new features and APIs are available, and generally prevents weird behavior. You can update Supersonic.js by running `steroids update` in your project folder.
</section>
<section class="docs-section" id="active-runtimes">
## Different components using the AppGyver wrapper

There are several different types of components that each use a specific version of the wrapper. To avoid inconsistent app behavior during development, you can see which version of the wrapper is used by each component on [GitHub][github-wrapper-versions]. You can compare this with the changelogs to ensure that a feature or bugfix you need is available in the components you're using in development
</section>

[build-service]: http://cloud.appgyver.com
[supersonic]: https://github.com/AppGyver/supersonic
[github-wrapper-versions]: https://github.com/AppGyver/scanner/blob/master/runtime-versions.md

