describe "supersonic.ui.view", ->
  it "is a function", ->
    supersonic.ui.view.should.be.a 'function'

  it "accepts a url", ->
    supersonic.ui.view('http://example.com').should.be.an 'object'

  it "accepts a route", ->
    supersonic.ui.view("foo#bar").should.be.an 'object'

  describe "getLocation()", ->
    describe "with a url", ->
      it "should return the url", ->
        supersonic.ui.view('http://example.com')
          .getLocation().should.equal 'http://example.com'

    describe "with a route", ->
      it "should return the route", ->
        supersonic.ui.view("foo#bar")
          .getLocation().should.equal 'foo#bar'

  describe "_getWebView()", ->
    it "is a function", ->
      supersonic.ui.view('foo#bar')._getWebView.should.be.a 'function'

    it "returns an object with a location", ->
      supersonic.ui.view('foo#bar')._getWebView().location.should.be.a 'string'

    describe "with a route", ->
      it "should have a url parsed from the route", ->
        supersonic.ui.view('foo#bar')
          ._getWebView().location.should.equal "http://localhost/app/foo/bar.html"

      it "should have a query string of the route has one", ->
        supersonic.ui.view('foo#bar?qux=trol')
          ._getWebView().location.should.match /foo\/bar\.html\?qux=trol$/

  describe "view.start()", ->
    it "should start a view with id test", ->
      supersonic.ui.view("ui#empty").start("test").should.be.fulfilled

    it "should stop a view with id test", ->
       supersonic.ui.views.stop("test").should.be.fulfilled
