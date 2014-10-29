angular
  .module('data')
  .controller("IndexController", ($scope, Task)->

    $scope.tasks = []
    $scope.showSpinner = true

    # Helper function for opening new webviews
    $scope.open = (id)->
      webView = new steroids.views.WebView "/app/data/show.html?id=#{id}"
      steroids.layers.push webView

    $scope.showModal = ->
      webView = new steroids.views.WebView "/app/data/new.html"
      steroids.modal.show webView

    fetchResources = ->
      $scope.showSpinner = true
      Task.findAll().then (tasks) ->
        $scope.$apply ->
          $scope.tasks = tasks
          $scope.showSpinner = false

    # Trigger data refresh when this view becomes visible
    steroids.data.reactive.whenVisible.onValue ->
      fetchResources()

    # Native navigation
    steroids.view.navigationBar.show "Tasks"
    steroids.view.setBackgroundColor "#FFFFFF"

  )