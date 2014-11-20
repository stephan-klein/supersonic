describe "supersonic.ui.View", ->
  it "accepts a url", ->
    view = new supersonic.ui.View 'http://example.com'
    view.should.be.an 'object'
    view.getLocation().should.equal 'http://example.com'

  it "accepts a route", ->
    view = new supersonic.ui.View 'foo#bar'
    view.should.be.an 'object'
    view.getLocation().should.equal "foo#bar"
    view._webView.location.should.equal 'http://localhost/app/foo/bar.html'

  describe "start()", ->

    it "returns a started view that can be stopped", (done)->
      id = "uiEmpty?#{Math.random()}"
      view = new supersonic.ui.View "ui#empty"

      view.start(id)
      .then ->
        view.stop()
      .then ->
        done()

    describe "with an empty argument if View has id", ->
      it "works", (done)->
        id = "uiEmpty?#{Math.random()}"
        view = new supersonic.ui.View
          location: "ui#empty"
          id: id

        view.start().then ->
          view.getId().should.equal id
        .then ->
          view.stop()
        .then ->
          done()

    describe "failing cases", ->
      it "when View has only location", ->
        view = new supersonic.ui.View "ui#empty"
        view.start().should.be.rejected
