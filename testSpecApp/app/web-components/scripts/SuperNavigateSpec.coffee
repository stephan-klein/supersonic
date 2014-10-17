before ->
  importsLoaded

fireOnceOnLayersChange = (done) ->
  listener = steroids.layers.on "didchange", ->
    steroids.layers.off "didchange", listener
    done()

describe "<super-navigate>", ->
  @timeout 4000
  it "should navigate by clicking on element with route", (done) ->
    fireOnceOnLayersChange ->
      fireOnceOnLayersChange done
    clickElement "super-navigate-route"

  it "should open an URL", (done) ->
    fireOnceOnLayersChange ->
      fireOnceOnLayersChange done
    clickElement "super-navigate-url"
