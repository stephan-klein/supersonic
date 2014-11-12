angular
  .module('ui')
  .controller 'TabsController', ($scope, $q, $timeout, supersonic) ->

    $scope.methods = [
      "hideTabs"
      "showTabs"
      "updateTabs"
      "replaceTabs"
      "updateCurrentTab"
      "setStyleClass"
      "setStyleId"
      "setStyleCSS"
    ]

    $scope.run = (method)->
      $scope[method]()

    $scope.hideTabs = ->
      supersonic.ui.tabs.hide()

    $scope.hideTabsWithCallback = ->
      supersonic.ui.tabs.hide
        onSuccess: ->
          supersonic.logger.log "Tabs hidden"
        onFailure: (error) ->
          alert "Error: #{JSON.stringify error}"

    $scope.showTabs = ->
      supersonic.ui.tabs.show()

    $scope.showTabsWithCallback = ->
      supersonic.ui.tabs.show
        onSuccess: ->
          supersonic.logger.log "Tabs shown"
        onFailure: (error) ->
          alert "Error: #{JSON.stringify error}"

    $scope.tabsUpdatedCount = 0

    tabsArray = [
      {
        title: "Steroids"
        badge: "1"
      }
      {
        title: "Telescope"
      }
    ]

    $scope.updateTabs = ->
      supersonic.ui.tabs.update(tabsArray)
        .then ->
          $scope.tabsUpdatedCount += 1
        .catch (err)->
          supersonic.logger.error "Could not update tabs: #{JSON.stringify(err)}"

    $scope.updateTabsWithCallback = ->
      supersonic.ui.tabs.update tabsArray,
        onSuccess: ->
          $scope.tabsUpdatedCount += 1
          supersonic.logger.log "Tabs updated"
        onFailure: (error) ->
          alert "Error: #{JSON.stringify error}"

    tabsArrayForReplace = [
      {
        title: "Index"
        location: "common#index"
      }
      {
        title: "Internet"
        location: "http://www.appgyver.com"
      }
    ]

    $scope.replaceTabs = ->
      supersonic.ui.tabs.replace(tabsArrayForReplace)
        .catch (err)->
          supersonic.logger.error "Could not replace tabs: #{JSON.stringify(err)}"

    $scope.replaceTabsWithCallback = ->
      supersonic.ui.tabs.replace tabsArrayForReplace,
        onSuccess: ->
          supersonic.logger.log "Tabs replaced"
        onFailure: (error) ->
          alert "Error: #{JSON.stringify error}"

    $scope.select = (tabIndex)->
      supersonic.ui.tabs.select(tabIndex)
        .catch (err)->
          supersonic.logger.error "Could not select tabs: #{JSON.stringify(err)}"

    $scope.selectWithCallback = (tabIndex)->
      supersonic.ui.tabs.select tabIndex,
        onSuccess: ->
          supersonic.logger.log "Tab number #{tabIndex} selected"
        onFailure: (error) ->
          alert "Error: #{JSON.stringify error}"

    $scope.updateCurrentTab = ->
      supersonic.ui.tabs.updateCurrentTab
        title: "Asteroids"
        badge: "5"

    $scope.updateCurrentTabWithCallback = ->
      options = 
        title: "Asteroids"
        badge: "5"
      supersonic.ui.tabs.updateCurrentTab options,
        onSuccess: ->
          supersonic.logger.log "Current tab updated"
        onFailure: (error) ->
          alert "Error: #{JSON.stringify error}"
        
    $scope.setStyleClass = ->
      supersonic.ui.tabs.setStyleClass "greenbg"

    $scope.setStyleClassWithCallback = ->
      supersonic.ui.tabs.setStyleClass "greenbg",
        onSuccess: ->
          supersonic.logger.log "Tab style class set"
        onFailure: (error) ->
          alert "Error: #{JSON.stringify error}"

    $scope.setStyleId = ->
      supersonic.ui.tabs.setStyleId "graybg"

    $scope.setStyleIdWithCallback = ->
      supersonic.ui.tabs.setStyleId "graybg",
        onSuccess: ->
          supersonic.logger.log "Tab style id set"
        onFailure: (error) ->
          alert "Error: #{JSON.stringify error}"

    $scope.setStyleCSS = ->
      supersonic.ui.tabs.setStyleCSS "background-color: red;"

    $scope.setStyleCSSWithCallback = ->
      supersonic.ui.tabs.setStyleCSS "background-color: red;",
        onSuccess: ->
          supersonic.logger.log "Tab style changed with CSS"
        onFailure: (error) ->
          alert "Error: #{JSON.stringify error}"

    $scope.willChangeCount = 0
    $scope.didChangeCount = 0
    $scope.willChangeListener = null
    $scope.didChangeListener = null
    $scope.listenTabChanges = ->
      $scope.willChangeListener = supersonic.ui.tabs.whenWillChange ->
        $timeout ->
          $scope.willChangeCount += 1
      $scope.didChangeListener = supersonic.ui.tabs.whenDidChange ->
        $timeout ->
          $scope.didChangeCount += 1

    $scope.stopListeningTabChanges = ->
      $scope.willChangeListener() if $scope.willChangeListener?
      $scope.didChangeListener() if $scope.didChangeListener?
      $scope.willChangeListener = null
      $scope.didChangeListener = null
