Bacon = require 'baconjs'
data = require 'ag-data'

###
TODO: Move under supersonic.data namespace for cohesion
###
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

module.exports = isDisposable = ->
  return ongoingBlockingRequests is 0
