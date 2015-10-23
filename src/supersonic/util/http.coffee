module.exports = http = ->

  get = (url, success, failure) ->
    xhr = new XMLHttpRequest()

    xhr.onreadystatechange = ->
      return unless xhr.readyState == 4

      if xhr.status == 200
        success(xhr.responseText)
      else
        failure(xhr.responseText)

    xhr.onerror = (e) ->
      failure(xhr.responseText)

    xhr.open("GET", url, true)
    xhr.send(null)

  return {
    get
  }
