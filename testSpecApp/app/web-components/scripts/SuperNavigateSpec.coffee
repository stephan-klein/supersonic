before ->
  importsLoaded

fireWhenLayerDidChange = (done) ->
  listener = steroids.layers.on "didchange", ->
    steroids.layers.off "didchange", listener
    done()

fireWhenLayerDidChangeTwice = (done) ->
  fireWhenLayerDidChange ->
    fireWhenLayerDidChange done

describe "<super-navigate>", ->
  @timeout 4000
  it "should navigate by clicking on element with route", (done) ->
    fireWhenLayerDidChangeTwice done
    clickElement "super-navigate-route"

  it "should navigate with an URL", (done) ->
    fireWhenLayerDidChangeTwice done
    clickElement "super-navigate-url"

  it "should navigate after changing element's location attribute", (done) ->
    fireWhenLayerDidChangeTwice done
    elem = document.getElementById "super-navigate-change-location"
    elem.setAttribute "location", "web-components#super-navigate-back"
    elem.click()

  it "should navigate with a custom touchstart action", (done) ->
    fireWhenLayerDidChangeTwice done
    elem = document.getElementById "super-navigate-touchstart"
    fireTouchEvent elem, "touchstart"

  it "should navigate with a view-id", (done) ->
    fireWhenLayerDidChangeTwice ->
      supersonic.ui.views.stop("super-navigate-back").then ->
        done()

    view = new supersonic.ui.View "web-components#super-navigate-back-preloaded"
    view.start("super-navigate-back").then ->
      clickElement "super-navigate-id"
