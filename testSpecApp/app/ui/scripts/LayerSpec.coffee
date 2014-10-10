describe "supersonic.ui.layer", ->
  it "should be defined", ->
    supersonic.ui.layer.should.exist

    layer = supersonic.ui.layer

    view = supersonic.ui.view "ui#empty"

    describe "push", ->
      it "should be defined", ->
        layer.push.should.exist

      it "should push a view", ->
        layer.push(view).should.be.fulfilled
