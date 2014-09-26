
describe "supersonic.ui.view", ->
  it "should be defined", ->
    supersonic.ui.view.should.exist

    view = {}

    describe "constructor", ->
      it "should create a view", ->
        view = supersonic.ui.view("/app/debug/DebugSpec.html")
        view.location.should.exist
