angular
  .module('ui')
  .controller 'TabBarController', ($scope, $q, supersonic) ->

    $scope.methods = [
      "hideTabBar"
      "showTabBar"
      "updateTabBar"
      "replaceTabBar"
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
