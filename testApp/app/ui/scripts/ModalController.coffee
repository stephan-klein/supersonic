angular
  .module('ui')
  .controller 'ModalController', ($scope, $q, supersonic) ->

    $scope.hideModal = () ->
      supersonic.ui.modal.hide().then ->
        supersonic.logger.log "Modal is hidden"

    $scope.hideModalWithoutAnimation = () ->
      supersonic.ui.modal.hide({animate: false}).then ->
        supersonic.logger.log "Modal is hidden"

    $scope.hideAllModals = () ->
      supersonic.ui.modal.hideAll().then () ->
        supersonic.logger.log "All the modals are hidden"

    $scope.hideAllModalsWithoutAnimation = () ->
      supersonic.ui.modal.hideAll({animate: false}).then () ->
        supersonic.logger.log "All the modals are hidden"

    $scope.hideModalWithCallback = ->
      supersonic.ui.modal.hide
        onSuccess: ->
          supersonic.logger.log "Modal hidden with this callback"
        onFailure: ->
          supersonic.logger.log "Modal could not be hidden"

    $scope.hideAllModalsWithCallback = ->
      supersonic.ui.modal.hideAll
        onSuccess: ->
          supersonic.logger.log "All the modals are hidden with this callback"
        onFailure: ->
          supersonic.logger.log "Modal could not be hidden"

    $scope.testIsDisposibleApi = ->

      supersonic.ui.isDisposable = -> false

      # new event used to know when the webview navigation was blocked
      eventHandler = supersonic.ui.views.current.on 'blocked', (event) ->
        supersonic.ui.dialog.spinner.show "Saving..."
        setTimeout ->
          supersonic.ui.isDisposable = -> true
          supersonic.ui.views.current.off 'blocked', eventHandler

          supersonic.ui.dialog.spinner.hide()
          if event.trigger == "close_modal"
            supersonic.ui.modal.hide()
        , 2000
