steroids.getApplicationState
============================

  > Get the current state of the application including all preloaded webviews, tabs, modals and drawer controllers

Shorthand
---------

    steroids.getApplicationState();

Verbose
-------

    steroids.getApplicationState(options, callBacks);

Parameters
----------

###Shorthand

None

###Verbose

The verbose call accepts two objects: `options` and `callBacks`, which have the following properties:

`options`

- None

`callBacks`

- __onSuccess__: called once applicationState is succesfully returned.
- __onFailure__: called if the applicationState cannot be returned.

Return values
-------------

`steroids.getApplicationState` returns an object containing three properties, `tabs`, `preloads` and `drawer`. The basic layout of the returned object is:

    {
      tabs,
      preloads,
      drawer
    }

The `tabs` object contains info on native tabs and their layer stack. This, as well as the following `preloads` and `drawer` objects have some properties omitted from the examples, they are used internally by Steroids and can be ignored.

    tabs: [
      {
        id: 0,
        layers: [
          {
            id: 0,
            views: [
              {
                id: "http://localhost/views/steroids/index.html",
                udid: "7E9912B3-DB17-40E6-8179-B8200F18B0D6",
                startURL: "http://localhost/views/steroids/index.html",
                URL: "http://localhost/views/steroids/index.html"
              }
            ]
          }
        ],
        modals: [
          {
            id: 0,
            layers: [
              {
                id: -1,
                views: [
                  {
                    id: "http://localhost//views/modal/preload.html",
                    udid: "F043122A-509E-420F-BAD2-3F57ACDDA939",
                    startURL: "http://localhost//views/modal/preload.html",
                    URL: "http://localhost//views/modal/preload.html"
                  }
                ]
              }
            ]
          }
        ]
      }
    ]

The `preloads` object contains all preloaded WebViews and their identity information

    preloads: [
      {
        id: "http://localhost/views/steroids/index.html",
        udid: "7E9912B3-DB17-40E6-8179-B8200F18B0D6",
        startURL: "http://localhost/views/steroids/index.html",
        URL: "http://localhost/views/steroids/index.html"
      }
    ]

The `drawer` object contains any drawers that are attached to the app

    drawer: {
      left: {
        id: 0,
        views: [
          {
            id: "leftDrawer",
            udid: "F9E378C4-BC88-4159-8151-95F7CBC6438A",
            startURL: "http://localhost/views/drawers/leftDrawer.html",
            URL: "http://localhost/views/drawers/leftDrawer.html"
          }
        ]
      },
      right: {

      }
    }

###Notes

- `startURL` vs `URL`: The `startURL` property refers to the original path where the WebView was loaded from, `URL` to the current one.
- `udid`: can also be accessed by calling `window.AG_WEBVIEW_UDID`, which is unique to each WebView.
