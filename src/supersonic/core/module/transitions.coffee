Promise = require 'bluebird'
superify = require '../superify'

module.exports = (steroids, ui, logger) ->
  s = superify 'supersonic.module.transitions', logger

  push: s.promiseF 'push', ->
    ui.animate("slideFromRight", {
      duration: 0.5
      curve: "easeInOut"
    }).perform().then ->
      steroids.view.displayLoading()
      Promise.delay(1000).then ->
        steroids.view.removeLoading()

  pop: s.promiseF 'pop', ->
    supersonic.ui.animate("slideFromLeft", {
      duration: 0.5
      curve: "easeInOut"
    }).perform()
