Bacon = require 'baconjs'
debug = require('debug')('supersonic:data:model:followable')

{ visibility } = require '../../../util/document-events'

module.exports = (interval) ->
  visibility.flatMapLatest (visible) ->
    if visible
      debug "Poller starting", { interval }
      Bacon.interval(interval, true).startWith(true)
    else
      debug "Poller off"
      Bacon.never()
