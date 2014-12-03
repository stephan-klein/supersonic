# Supersonic Changelog

Issues are tracked in AppGyver's [unified issue tracker](https://github.com/appgyver/steroids/issues) – please post bug reports and feature requests there.

## 1.0.0 (2014-12-03) – MACH 1

Initial release. See the documentation at [http://docs.appgyver.com](http://docs.appgyver.com) for more information.

Bunch of outstanding issues in Steroids.js and other components fixed or made obsolete by Supersonic features:

- The `network.extraResponseHeaders` property in `config/app.coffee` can be used to set custom headers that will be appended to all incoming HTTP responses, allowing e.g. CORS issues to be circumvented for good. iOS-only for the moment, fixes [#124](https://github.com/AppGyver/steroids/issues/124), [#140](https://github.com/AppGyver/steroids/issues/140) and [#150](https://github.com/AppGyver/steroids/issues/150) for iOS.
- New app configs at `config/app.coffee` and `config/structure.coffee` deprecate `config/application.coffee` and the various `config.xml` files. Closes [#194](https://github.com/AppGyver/steroids/issues/194).
- New http://docs.appgyver.com sources are public on [GitHub](https://github.com/AppGyver/supersonic/tree/master/docs). Closes [#237](https://github.com/AppGyver/steroids/issues/237).
- Supersonic Routes remove the need for explicit view URLs. Closes [#285](https://github.com/AppGyver/steroids/issues/285).
