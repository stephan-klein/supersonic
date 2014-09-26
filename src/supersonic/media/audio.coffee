Promise = require 'bluebird'

{deviceready} = require '../events'
###*
   * @ngdoc overview
   * @name audio
   * @module media
   * @description
   * Provides the ability to record and play back audio files on a device.
  ###

module.exports = (steroids, log) ->
  bug = log.debuggable "supersonic.media.audio"

  play = (src) ->
    deviceready
      .then( ->
        new Promise (resolve, reject) ->
          audio = new Media(src, resolve, reject)
          audio.play()
      )

  return {play}