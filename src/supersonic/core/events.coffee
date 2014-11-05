Promise = require 'bluebird'
Bacon = require 'baconjs'

module.exports =
  deviceready: if document?
      new Promise (resolve) ->
        document.addEventListener 'deviceready', resolve
    else
      Promise.resolve()

  visibility: do ->
    visibilityState = if document?
        changes: Bacon.fromEventTarget(document, 'visibilitychange')
        defaultState: document.visibilityState
      else
        changes: Bacon.once target: visibilitystate: 'visible'
        defaultState: 'hidden'

    visibilityState.changes
      .map((event) ->
        if event.detail?.visibilityState?
          event.detail.visibilityState
        else
          event.target?.visibilityState
      )
      .toProperty(visibilityState.defaultState)
      .map((stateString) ->
        switch stateString
          when "visible" then true
          when "hidden" then false
          else false
      )
