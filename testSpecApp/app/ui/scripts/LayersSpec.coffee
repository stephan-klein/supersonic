describe "supersonic.ui.layers", ->
  it "should be defined", ->
    supersonic.ui.layers.should.exist

    layers = supersonic.ui.layers

    view = supersonic.ui.view "ui#empty"

    describe "push", ->
      it "should be defined", ->
        layers.push.should.exist

      it "should push a view", ->
        layers.push(view).should.be.fulfilled
