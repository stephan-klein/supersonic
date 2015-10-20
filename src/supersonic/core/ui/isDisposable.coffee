Bacon = require 'baconjs'

module.exports = (global, superglobal, data) ->

  ongoingBlockingRequests = 0
  data
    .requests
    .flatMap ({ method, url, options, done }) ->
      unless method in ['post', 'put', 'del']
        Bacon.never()
      else
        Bacon.once(1).merge(
          Bacon.fromPromise(done)
            .map(-> -1)
            .mapError(-> -1)
        )
    .scan(0, (requests, change) -> requests + change)
    .onValue (requests) ->
      ongoingBlockingRequests = requests

  return isDisposable = ->
    ongoingBlockingRequests is 0
