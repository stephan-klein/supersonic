fireWhenLayerDidChange = (done) ->
  listener = steroids.layers.on "didchange", ->
    steroids.layers.off "didchange", listener
    done()

fireWhenLayerDidChangeTwice = (done) ->
  fireWhenLayerDidChange ->
    fireWhenLayerDidChange done

steroids.layers.on "didchange", ->
  console.log "Layer did change!"

describe "supersonic.ui.layers", ->
  it "should be defined", ->
    supersonic.ui.layers.should.exist

    layers = supersonic.ui.layers

    view = new supersonic.ui.View "ui#empty"

    describe "push", ->
      it "should be defined", ->
        layers.push.should.exist

      it "should push with a route", (done) ->
        @timeout 4000
        fireWhenLayerDidChangeTwice done
        supersonic.ui.layers.push "ui#empty"

      it "should push a view object with location", (done) ->
        @timeout 4000
        fireWhenLayerDidChangeTwice done

        view = new supersonic.ui.View "ui#empty"
        supersonic.ui.layers.push view

      it "should push a started view object with id", (done) ->
        @timeout 4000
        id = "uiEmpty?#{Math.random()}"
        fireWhenLayerDidChangeTwice ->
          supersonic.ui.views.stop(id).then ->
            done()

        view = new supersonic.ui.View "ui#empty"
        view.start(id).then ->
          supersonic.ui.layers.push view

      it "should push a started view by identifier string", (done) ->
        @timeout 4000
        id = "uiEmpty?#{Math.random()}"
        fireWhenLayerDidChangeTwice ->
          supersonic.ui.views.stop(id).then ->
            done()

        view = new supersonic.ui.View "ui#empty"
        view.start(id).then ->
          supersonic.ui.layers.push id
