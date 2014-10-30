angular
  .module('data')
  .controller("ShowController", ($scope, Task)->

      $scope.task = null
      $scope.showSpinner = true

      # Fetch an object based on id
      fetchResource = ->
        $scope.showSpinner = true
        Task.find(steroids.view.params.id).then (task)->
          $scope.$apply ->
            $scope.task = task
            $scope.showSpinner = false

      steroids.data.reactive.whenVisible.onValue ->
        fetchResource()

      $scope.remove = ->
        $scope.showSpinner = true
        $scope.task.delete().then ->
          steroids.layers.pop()

      $scope.showEditModal = (id)->
        webView = new steroids.views.WebView "/app/data/edit.html?id=#{id}"
        steroids.modal.show webView

      # Native navigation
      steroids.view.navigationBar.show "Show Task"
      steroids.view.setBackgroundColor "#FFFFFF"

  )