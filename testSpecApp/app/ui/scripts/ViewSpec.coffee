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

  describe "start()", ->
    it "returns a started view that can be stopped", ->
      supersonic.ui.view('ui#empty').start().then (startedView) ->
        startedView.stop().should.be.fulfilled

    describe "with an argument", ->
      it "assigns the argument to the view's id", ->
        supersonic.ui.view('ui#empty').start('this-is-the-id').then (startedView) ->
          startedView.getId().should.equal 'this-is-the-id'
          startedView.stop()
