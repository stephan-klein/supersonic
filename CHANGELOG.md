# Supersonic Changelog

Issues are tracked in AppGyver's [unified issue tracker](https://github.com/appgyver/steroids/issues) – please post bug reports and feature requests there.

## 1.2.1 (2015-03-31)

Features:
- `supersonic.data.storage.adapters` exposes factories for the default `localforage` adapter and an in-memory storage, which can be used as `supersonic.data.model` cache adapters.

## 1.2.0 (2015-03-26)

Features:
- Asynchronous job protocol enabled when accessing slow HTTP endpoints over the AG proxy v3 API.

## 1.1.2 (2015-02-25)

Bugfixes:
- `super-navbar`, `super-navbar-title` and `super-navbar-button` properly hide their content from the DOM

## 1.1.1 (2015-01-21)

Features:
- Custom animation support to `supersonic.ui.layers.push` (iOS-only, see [open ticket](https://github.com/AppGyver/steroids/issues/776) about Android native support). Closes [#721](https://github.com/AppGyver/steroids/issues/721).

## 1.1.0 (2015-01-20)

Features:
- Updated Supersonic CSS to match Ionic's v1.0.0-beta.14 "magnesium-mongoose" release.
- Re-enabled some disabled Ionic components to ensure better backwards compatibility with Ionic apps.

*Note: These updates include minor cosmetic tweaks to the UI – nothing major. That said, you might still want to check your app to ensure everything looks as it should after the update. For those interested, full list of changes can be found in [this commit](https://github.com/AppGyver/supersonic/commit/9bc7e85b355206087ff9722954e982957ca21304).*

## 1.0.11 (2015-01-08)

Features:
- Added 3-way data binding support for single records by `one(123).whenChanged` on `supersonic.data.model`

Bugfixes:
- Resolved issue with `defaultStorage` for `supersonic.data.model` not being defined and the `cache` flag not working without specifying a storage

## 1.0.10 (2014-12-22)

Bugfixes:
- Fixed a bug causing the `timeToLive` option for `supersonic.data.model`'s `cache` to not be adhered

## 1.0.9 (2014-12-19)

Features:
- Added `cache` option support for `supersonic.data.model`

## 1.0.8 (2014-12-18)

Features:
- Added `supersonic.ui.layers.replace` API call for replacing the whole navigation stack with a started view.

Bugfixes:
- Fixed a bug where views returned by `supersonic.ui.views.find` didn't always have the correct `id` set.

## 1.0.7 (2014-12-12)

Bugfixes:
- Fix an inconsistency in handling `supersonic.data.model` instance state when serializing (`.toJson`) and unserializing (`.fromJson`)

## 1.0.6 (2014-12-12)

Features:
- `.fromJson` on `supersonic.data.model` assumes all the data is in a dirty state, so it will be sent to the cloud in case of `.save()`

## 1.0.5 (2014-12-12)

Features:
- Added `.fromJson` support to to complement `instance.toJson` on `supersonic.data.model`

## 1.0.4 (2014-12-11)

Bugfixes:
- `supersonic.ui.views.start()` and `supersonic.ui.views.stop()` now properly return the View object started/stopped.

## 1.0.3 (2014-12-10)

Features:
- Added option support for `supersonic.data.model`
- Added `supersonic.data.storage.property`

## 1.0.2 (2014-12-10)

- Added support for data-params for super-navbar-button when using "location" or "view-id" parameters (as in super-navigate).

## 1.0.1 (2014-12-05)

- Fixed using super-navigate component, layers.push, modal.show data parameters passing in android.

## 1.0.0 (2014-12-03) – MACH 1

Initial release. See the documentation at [http://docs.appgyver.com](http://docs.appgyver.com) for more information.

Bunch of outstanding issues in Steroids.js and other components fixed or made obsolete by Supersonic features:

- The `network.extraResponseHeaders` property in `config/app.coffee` can be used to set custom headers that will be appended to all incoming HTTP responses, allowing e.g. CORS issues to be circumvented for good. iOS-only for the moment, fixes [#124](https://github.com/AppGyver/steroids/issues/124), [#140](https://github.com/AppGyver/steroids/issues/140) and [#150](https://github.com/AppGyver/steroids/issues/150) for iOS.
- New app configs at `config/app.coffee` and `config/structure.coffee` deprecate `config/application.coffee` and the various `config.xml` files. Closes [#194](https://github.com/AppGyver/steroids/issues/194) and [#175](https://github.com/AppGyver/steroids/issues/175).
- New http://docs.appgyver.com sources are public on [GitHub](https://github.com/AppGyver/supersonic/tree/master/docs). Closes [#237](https://github.com/AppGyver/steroids/issues/237).
- Supersonic Routes remove the need for explicit view URLs. Closes [#285](https://github.com/AppGyver/steroids/issues/285).
- Deprecated keyboard `config.ios.xml` settings, since the new keyboard plugin introduced in [iOS runtime v4.0.0](https://github.com/AppGyver/scanner/blob/master/changelog-ios.md#400-2014-10-10-native-css-with-pixate) no longer supports them. Closes [#101](https://github.com/AppGyver/steroids/issues/101) and [#208](https://github.com/AppGyver/steroids/issues/208)
