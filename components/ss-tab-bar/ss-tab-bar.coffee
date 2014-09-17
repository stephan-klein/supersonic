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

        # steroids.tabBar.on "didchange", ()->
        #   steroids.logger.log "tabbar changed"
        #
        # steroids.tabBar.on "willchange", ()->
        #   steroids.logger.log "tabbar will bechanged"
        #
        if tabsConfig.tabs.length > 0
          steroids.tabBar.replace tabsConfig, {
            onSuccess: ()->
              steroids.tabBar.show()
          }

    onFailure: ->
      steroids.logger.log 'Tabs WebComponent crashed'
  }

TabBarPrototype.createdCallback = ->
  # TODO: Probably to remove it
  # steroids.tabBar.show()

document.registerElement "ss-tab-bar",
  prototype: TabBarPrototype
