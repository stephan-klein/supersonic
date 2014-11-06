angular
  .module('ui')
  .controller 'TabBarController', ($scope, $q, supersonic) ->

    $scope.methods = [
      "hideTabBar"
      "showTabBar"
      "updateTabBar"
      "replaceTabBar"
      "updateCurrentTab"
      "setStyleClass"
      "setStyleId"
      "setStyleCSS"
    ]

    $scope.run = (method)->
      $scope[method]()

    $scope.hideTabBar = ->
      supersonic.ui.tabBar.hide()

    $scope.showTabBar = ->
      supersonic.ui.tabBar.show()

    $scope.updateTabBar = ->
      tabsArray = [
        {
          title: "Steroids"
          badge: "1"
        }
        {
          title: "Telescope"
        }
      ]
      supersonic.ui.tabBar.update(tabsArray)
        .catch (err)->
          supersonic.logger.error "Could not update tabs: #{JSON.stringify(err)}"

    $scope.replaceTabBar = ->
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
      supersonic.ui.tabBar.replace(tabsArray)
        .catch (err)->
          supersonic.logger.error "Could not replace tabs: #{JSON.stringify(err)}"

    $scope.select = (tabIndex)->
      supersonic.ui.tabBar.select(tabIndex)
        .catch (err)->
          supersonic.logger.error "Could not select tabs: #{JSON.stringify(err)}"

    $scope.updateCurrentTab = ->
      supersonic.ui.tabBar.updateCurrentTab
        title: "Asteroids"
        badge: "5"

    $scope.setStyleClass = ->
      supersonic.ui.tabBar.setStyleClass "greenbg"

    $scope.setStyleId = ->
      supersonic.ui.tabBar.setStyleId "graybg"

    $scope.setStyleCSS = ->
      supersonic.ui.tabBar.setStyleCSS "background-color: red;"
