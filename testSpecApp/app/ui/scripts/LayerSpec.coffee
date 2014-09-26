
describe "supersonic.ui.layer", ->
  it "should be defined", ->
    supersonic.ui.layer.should.exist

    layer = supersonic.ui.layer

    view = supersonic.ui.view("/app/debug/DebugSpec.html")

    describe "push", ->
      it "should be defined", ->
        layer.push.should.exist

      # it "should open a view", ->
      #   layer.push(view).should.be.fulfilled
