Bacon = require 'baconjs'
generateUuid = require '../../util/generate-uuid'

blockingRequests = (requests) ->
  requests.filter ({ method, url, options, done }) ->
    method in ['post', 'put', 'del']

countOngoing = (requests) ->
  requests.flatMap ({ method, url, options, done }) ->
    Bacon.once(1).merge(
      Bacon.fromPromise(done)
        .map(-> -1)
        .mapError(-> -1)
    )

module.exports = (global, superglobal, data, dialog, views, layers, modal) ->

  superglobal.ag ?= {}
  superglobal.ag.data ?= {}
  superglobal.ag.data.blockingRequests ?= 0

  superglobal.ag.view ?= {}
  superglobal.ag.view.id ?= generateUuid()

  UNBLOCKED_CHANNEL_NAME = "supersonic.ui.isDisposable.unblocked:#{superglobal.ag.view.id}"

  unblocked = data.channel UNBLOCKED_CHANNEL_NAME

  countOngoing(blockingRequests(data.requests)).onValue (change) ->
    superglobal.ag.data.blockingRequests += change

    if isDisposable()
      unblocked.publish true

  if global is superglobal
    unblockings = data.channel(UNBLOCKED_CHANNEL_NAME).inbound

    waitForUnblock = (event) ->
      dialog.spinner.show "Saving..."
      unblockings
        .delay(100)
        .filter(isDisposable)
        .take(1)
        .map(-> event)

    pickRetryFunction = (event) ->
      switch event.trigger
        when "pop_layer"
          layers.pop
        when "close_modal"
          modal.hide
        else
          throw new Error "No idea how to retry '#{trigger}'"

    views.current
      .events('blocked')
      .flatMapFirst(waitForUnblock)
      .map(pickRetryFunction)
      .onValue (retry) ->
        dialog.spinner.hide()
        retry()


  return isDisposable = ->
    superglobal.ag.data.blockingRequests is 0
