describe "CORS", ->
  it "should succeed in making a CORS request", (done)->
    xhr = new XMLHttpRequest()

    xhr.onload = ->
      done()

    xhr.onerror = (e)->

    xhr.onreadystatechange = ->
      DONE = @DONE || 4
      if @readyState is DONE
        console.log "yey"

    method = "GET"
    url = "http://www.appgyver.com"

    xhr.open method, url

    xhr.setRequestHeader "X-Requested-With", "XMLHttpRequest"

    xhr.send null
