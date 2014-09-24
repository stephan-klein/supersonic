module.exports =

  rootView:
    route: "common/index"

  tabs: [
    {
      title: "Index"
      icon: "icons/pill@2x.png"
      route: "common/index"
    }
    {
      title: "Internet"
      icon: "icons/telescope@2x.png"
      url: "http://www.google.com"
    }
  ]

  initialView:
    id: "initialView"
    route: "common/initial-view"

  # drawers:
  #   left:
  #     id: "leftDrawer"
  #     route: "drawers/left-drawer"
  #     showOnAppLoad: true
  #     widthOfDrawerInPixels: 200
  #   right:
  #     id: "rightDrawer"
  #     route: "drawers/right-drawer"
  #     showOnAppLoad: false
  #     widthOfDrawerInPixels: 200
  #   options:
  #     centerViewInteractionMode: "Full"
  #     closeGestures: ["PanNavBar", "PanCenterView", "TapCenterView"]
  #     openGestures: ["PanNavBar", "PanCenterView"]
  #     showShadow: true
  #     stretchDrawer: true
  #     widthOfLayerInPixels: 0

  # preloads: [
  #   {
  #     id: "settings"
  #     route: "settings/index"
  #   }
  #   {
  #     id: "google"
  #     url: "http://www.google.com"
  #   }
  # ]
