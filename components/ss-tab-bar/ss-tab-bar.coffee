TabBarPrototype = Object.create HTMLElement.prototype

TabBarPrototype.attachedCallback = ->
  that = this
  steroids.getApplicationState {}, {
    onSuccess: (state)->
      if (state.tabs.length == 1)
        steroids.logger.log 'TabBar WebComponent is applied'
        tabs = that.getElementsByTagName('tab')
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
              # TODO: When native side bug is fixed, this
              # callback is not needed
              steroids.tabBar.show()
          }

    onFailure: ->
      steroids.logger.log 'Tabs WebComponent crashed'
  }

document.registerElement "ss-tab-bar",
  prototype: TabBarPrototype
