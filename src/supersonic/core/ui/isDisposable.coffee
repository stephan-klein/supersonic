Bacon = require 'baconjs'

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

module.exports = (superglobal, data) ->

  superglobal.ag ?= {}
  superglobal.ag.data ?= {}
  superglobal.ag.data.blockingRequests ?= 0

  countOngoing(blockingRequests(data.requests)).onValue (change) ->
    superglobal.ag.data.blockingRequests += change

  return isDisposable = ->
    superglobal.ag.data.blockingRequests is 0
