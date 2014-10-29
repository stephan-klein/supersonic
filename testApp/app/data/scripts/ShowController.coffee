angular
  .module('data')
  .controller("ShowController", ($scope, TaskResource)->

      $scope.task = {}
      $scope.showSpinner = true

      # Fetch an object based on id
      fetchResource = ->
        $scope.showSpinner = true
        TaskResource.find(steroids.view.params.id).then (task)->
          $scope.$apply ->
            $scope.task = task
            $scope.showSpinner = false

      steroids.data.reactive.whenVisible.onValue ->
        fetchResource()

      $scope.remove = (id)->
        $scope.showSpinner = true
        TaskResource.remove(id).then ->
          steroids.layers.pop()

      $scope.showEditModal = (id)->
        webView = new steroids.views.WebView "/app/data/edit.html?id=#{id}"
        steroids.modal.show webView

      # Native navigation
      steroids.view.navigationBar.show "Show Task"
      steroids.view.setBackgroundColor "#FFFFFF"

  )