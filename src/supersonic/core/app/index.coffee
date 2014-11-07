Promise = require 'bluebird'

events = require '../events'

module.exports = (steroids, log) ->
  sleep: require("./sleep")(steroids, log)
  getLaunchURL: require("./getLaunchURL")(steroids, log)
  splashscreen: require("./splashscreen")(steroids, log)
  openURL: require("./openURL")(steroids, log)
  statusBar: require("./statusBar")(steroids, log)
  status: events.background
  whenResumed: (f)->
    whenResumed = null
    events
      .background
        .map((status) ->
          if status
            ->
              whenResumed = f()
          else
            ->
              whenResumed?()
              whenResumed = null
        )
        .onValue (notify) ->
          setTimeout notify, 0

  whenPaused: (f)->
    whenPaused = null
    events
      .background
        .map((status) ->
          if status
            ->
              whenPaused?()
              whenPaused = null
          else
            ->
              whenPaused = f()

        )
        .onValue (notify) ->
          setTimeout notify, 0
