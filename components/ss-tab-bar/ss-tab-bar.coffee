TabBarPrototype = Object.create HTMLElement.prototype

TabBarPrototype.createdCallback = ->
  tabs = this.getElementsByTagName('tab')
  tabsConfig = {
    tabs: []
  }

  for i in [0...tabs.length]
    tab = tabs[i]
    tabsConfig.tabs.push {
      title: tab.title
      icon: tab.getAttribute("icon")
      badge: tab.getAttribute("badge")
      location: tab.getAttribute("navigate")
    }

  if tabsConfig.tabs.length > 0
    steroids.tabBar.replace tabsConfig, {
      onSuccess: ()->
        steroids.tabBar.show()
    }

document.registerElement "ss-tab-bar",
  prototype: TabBarPrototype
