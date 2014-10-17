before ->
  importsLoaded

clickElement = (id)->
  element = document.getElementById id
  element.click()

fireOnceOnLayersChange = (done) ->
  listener = steroids.layers.on "didchange", ->
    steroids.layers.off "didchange", listener
    done()

popNextPushedLayer = (done) ->
  fireOnceOnLayersChange ->
    fireOnceOnLayersChange done
    setTimeout ->
      steroids.navigationBar.tapButton index: 0
    , 500

describe "<super-navigate>", ->
  @timeout 4000
  it "should navigate by clicking", (done) ->
    popNextPushedLayer done
    clickElement "super-navigate-route"

  it "should open an URL", (done) ->
    popNextPushedLayer done
    clickElement "super-navigate-url"
