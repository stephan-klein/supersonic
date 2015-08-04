module.exports =

  rootView:
    location: "common#index"
    id: "rootView"
    navigationBar:
      title: "Root View"

  tabs: [
    {
      title: "Index"
      icon: "icons/pill@2x.png"
      location: "common#index"
    }
    {
      title: "Internet"
      icon: "icons/telescope@2x.png"
      location: "http://www.google.com"
    }
    {
      title: "NavBar"
      icon: "icons/pill@2x.png"
      location: "common#index"
      navigationBar:
        title: "from Config"
        buttons:
          right:[
            id:"exitbutton"
            title:"Exit"
          ]
    }
  ]

  initialView:
    id: "initialView"
    location: "initial#start"
    navigationBar:
      title: "Login"
      buttons:
        right:[
          id:"loginButton"
          title:"Login"
        ]

  # drawers:
  #   left:
  #     id: "leftDrawer"
  #     location: "drawers#left-drawer"
  #     showOnAppLoad: true
  #     widthOfDrawerInPixels: 200
  #   right:
  #     id: "rightDrawer"
  #     location: "drawers#right-drawer"
  #     showOnAppLoad: false
  #     widthOfDrawerInPixels: 200
  #   options:
  #     centerViewInteractionMode: "Full"
  #     closeGestures: ["PanNavBar", "PanCenterView", "TapCenterView"]
  #     openGestures: ["PanNavBar", "PanCenterView"]
  #     showShadow: true
  #     stretchDrawer: true
  #     widthOfLayerInPixels: 0

  preloads: [
    {
      id: "app-index"
      location: "app#index"
      navigationBar:
        title: "App Index"
    },
    {
      id: "navigate-result"
      location: "webComponents#navigate_result"
    },
    {
      id: "super-data"
      location: "webComponents#data"
    }
  ]
