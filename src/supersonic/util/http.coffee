Promise = require 'bluebird'

get = (url) ->
  new Promise (resolve, reject) ->
    xhr = new XMLHttpRequest()

    xhr.onreadystatechange = ->
      return unless xhr.readyState == 4

      if xhr.status == 200
        resolve(xhr.responseText)
      else
        reject(xhr.responseText)

    xhr.onerror = (e) ->
      reject(xhr.responseText)

    xhr.open("GET", url, true)
    xhr.send(null)

module.exports = {
  get
}
