describe "supersonic.ui.view", ->
  it "should be defined", ->
    supersonic.ui.view.should.exist

  describe "view with route", ->
    view = supersonic.ui.view("debug#UISpec")

    it "should create a view", ->
      view.location.should.exist
      view._webView.should.exist

    it "should have a location of type String", ->
      view.location.should.be.a "string"

    it "should have a _webView of type Object", ->
      view._webView.should.be.an "object"

    it "should parse route correctly", ->
      setTimeout 1000, ->
        view._webView.location.should.equal "/app/debug/views/UISpec.html"

  describe "view with URL", ->
    view = supersonic.ui.view("http://www.google.com")

    it "should create a view", ->
      view.location.should.exist
      view._webView.should.exist

    it "should have a location of type String", ->
      view.location.should.be.a "string"

    it "should have a _webView of type Object", ->
      view._webView.should.be.an "object"

    it "should set location correctly", ->
      view._webView.location.should.equal "http://www.google.com"
