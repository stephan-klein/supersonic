angular
  .module('ui')
  .controller 'IndexController', ($scope, $q, supersonic) ->

    $scope.newView = ->
      v = supersonic.ui.view("http://localhost/app/notification/index.html", "myView")
      supersonic.ui.layer.push(v)

      # TODO: Find normal way for qifying
      qify = (f, sc) ->
        () ->
          args = arguments
          # NOTE: It's important to preserve scope!
          $q.when ()->
            f.apply sc, args

      v.preload = qify v.preload, v

      # v.preload().then ()->
      #   supersonic.logger.log "preloaded"
