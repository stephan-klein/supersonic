
describe "supersonic.ui.view", ->
  it "should be defined", ->
    supersonic.ui.view.should.exist

    view = {}

    describe "constructor", ->
      it "should create a view", ->
        view = supersonic.ui.view("/app/debug/DebugSpec.html")
        view.location.should.exist

    describe "preload", ->
      it "should be defined", ->
        view.preload.should.exist
      # it "should preload", ->
      #   view.preload().should.be.fulfilled

    describe "getWebView", ->
      it "should be defined", ->
        view.getWebView.should.exist
      it "should return WebView", ->
        view.getWebView().should.exist

    describe "setWidth", ->
      it "should be defined", ->
        view.setWidth.should.exist
      it "should set width", ->
        view.setWidth(150)
        view.getWebView().widthOfDrawerInPixels.should.be.equal(150)
