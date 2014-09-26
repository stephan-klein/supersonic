
describe "supersonic.ui.drawer", ->
  it "should be defined", ->
    supersonic.ui.drawer.should.exist

    dr = supersonic.ui.drawer

    view = supersonic.ui.view("/app/debug/DebugSpec.html")

    describe "asLeft", ->
      it "should de defined", ->
        dr.asLeft.should.exist
