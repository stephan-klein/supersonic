angular
  .module('ui')
  .controller 'TabsController', ($scope, $q, supersonic) ->

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

    $scope.showTabs = ->
      supersonic.ui.tabs.show()

    $scope.updateTabs = ->
      tabsArray = [
        {
          title: "Steroids"
          badge: "1"
        }
        {
          title: "Telescope"
        }
      ]
      supersonic.ui.tabs.update(tabsArray)
        .catch (err)->
          supersonic.logger.error "Could not update tabs: #{JSON.stringify(err)}"

    $scope.replaceTabs = ->
      tabsArray = [
        {
          title: "Index"
          location: "common#index"
        }
        {
          title: "Internet"
          location: "http://www.appgyver.com"
        }
      ]
      supersonic.ui.tabs.replace(tabsArray)
        .catch (err)->
          supersonic.logger.error "Could not replace tabs: #{JSON.stringify(err)}"

    $scope.select = (tabIndex)->
      supersonic.ui.tabs.select(tabIndex)
        .catch (err)->
          supersonic.logger.error "Could not select tabs: #{JSON.stringify(err)}"

    $scope.updateCurrentTab = ->
      supersonic.ui.tabs.updateCurrentTab
        title: "Asteroids"
        badge: "5"

    $scope.setStyleClass = ->
      supersonic.ui.tabs.setStyleClass "greenbg"

    $scope.setStyleId = ->
      supersonic.ui.tabs.setStyleId "graybg"

    $scope.setStyleCSS = ->
      supersonic.ui.tabs.setStyleCSS "background-color: red;"
