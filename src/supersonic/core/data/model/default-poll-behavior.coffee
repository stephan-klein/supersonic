Bacon = require 'baconjs'
debug = require('debug')('supersonic:data:model:followable')

{ visibility } = require '../../../util/document-events'

module.exports = (name) ->
  return defaultPollBehavior = (interval) ->
    visibility.flatMapLatest (visible) ->
      if visible
        debug "Poller starting", {
          model: name
          interval
        }
        Bacon.interval(interval, true).startWith(true)
      else
        debug "Poller off", {
          model: name
        }
        Bacon.never()
