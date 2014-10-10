describe "supersonic.ui.view", ->
  it "should be defined", ->
    supersonic.ui.view.should.exist

  describe "view with route", ->
    route = "ui#empty"
    view = supersonic.ui.view route

    it "should parse route correctly", ->
      view._getWebView().location.should.equal "http://localhost/app/ui/empty.html"

    describe "getLocation()", ->
      it "should be a function", ->
        view.getLocation.should.exist
        view.getLocation.should.be.a "function"

      it "should return a String", ->
        view.getLocation().should.be.a "string"

      it "should return the given route", ->
        view.getLocation().should.equal

    describe "_getWebView()", ->
      it "should be a function", ->
        view._getWebView.should.exist
        view._getWebView.should.be.a "function"

      it "should return an object", ->
        view._getWebView().should.be.an "object"

  describe "view with URL", ->
    view = supersonic.ui.view("http://www.google.com")

    it "should set location correctly", ->
      view._getWebView().location.should.equal "http://www.google.com"

  describe "view.start()", ->
    it "should start a view with id test", ->
      supersonic.ui.view("ui#empty").start("test").should.be.fulfilled

    it "should stop a view with id test", ->
      supersonic.ui.views.stop("test").should.be.fulfilled
