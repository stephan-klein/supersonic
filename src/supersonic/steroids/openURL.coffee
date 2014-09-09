Promise = require 'bluebird'

module.exports = (url) ->
  new Promise (resolve, reject) ->
    successCallback = ->
      document.addEventListener "resume", ->
        resolve()

    steroids.openURL(
      { url: url }
      {
        onSuccess: successCallback
        onFailure: reject
      }
    )
