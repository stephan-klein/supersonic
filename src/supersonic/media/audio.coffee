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

  ###*
   * @ngdoc method
   * @name play
   * @module audio
   * @description
   * Plays an audio file.
   * @param {string} src URI containing the audio content.
   * @returns {Promise} Promise that is resolved when the audio file is played.
   * @usage
   * ```coffeescript
   * supersonic.media.audio.play("http://mysite.com/audio.mp3")
   * ```
  ###
  play = (src) ->
    deviceready
      .then( ->
        new Promise (resolve, reject) ->
          audio = new Media(src, resolve, reject)
          audio.play()
      )

  return {play}