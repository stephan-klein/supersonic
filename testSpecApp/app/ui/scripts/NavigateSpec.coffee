fireWhenLayerDidChange = (done) ->
  listener = steroids.layers.on "didchange", ->
    steroids.layers.off "didchange", listener
    done()

fireWhenLayerDidChangeTwice = (done) ->
  fireWhenLayerDidChange ->
    fireWhenLayerDidChange done

describe "supersonic.ui.navigate", ->
  it "should be defined", ->
    supersonic.ui.navigate.should.exist

  it "should navigate to a route", (done) ->
    @timeout 4000
    fireWhenLayerDidChangeTwice done
    supersonic.ui.navigate "ui#empty"

  it "should navigate to a started view", (done) ->
    @timeout 4000
    fireWhenLayerDidChangeTwice ->
      supersonic.ui.views.stop("uiEmpty").then ->
        done

    view = new supersonic.ui.View "ui#empty"
    view.start("uiEmpty").then ->
      supersonic.ui.navigate "uiEmpty"

  it "should navigate to a view that calls navigate('#back')", (done) ->
    @timeout 4000
    fireWhenLayerDidChangeTwice done

    supersonic.ui.navigate "ui#navigateBack"
