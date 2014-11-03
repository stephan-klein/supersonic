describe "supersonic.ui.views", ->
  views = null
  before ->
    views = supersonic.ui.views

  it "is an object", ->
    views.should.be.an 'object'

  describe "start()", ->
    it "is a function", ->
      views.start.should.be.a "function"

  describe "find()", ->
    it "is a function", ->
      views.find.should.be.a 'function'

  describe "stop()", ->
    it "is a function", ->
      views.stop.should.be.a "function"

  describe "start, find, stop with view object", ->
    views = [supersonic.ui.view "ui#empty", "ui#empty"]

    for view in views
      it "should start a view with id test", ->
        supersonic.ui.views.start(view, "test").should.be.fulfilled

      it "should fail to start another view with id test", ->
        supersonic.ui.views.start(view, "test").should.be.rejected

      it "should find a started view with id test", ->
        supersonic.ui.views.find("test").should.be.fulfilled

      it "should return a promise that resolves with a StartedView", ->
        supersonic.ui.views.find("test").should.eventually.have.property "getId"

      it "should stop a started view with id test", ->
        supersonic.ui.views.stop("test").should.be.fulfilled

  describe "stop a StartedView returned by find", ->
    it "should start a view with id test", ->
      supersonic.ui.views.start("ui#empty", "test").should.be.fulfilled

    it "should stop a view found with find('test')", (done)->
      supersonic.ui.views.find("test").then (startedView) ->
        supersonic.ui.views.stop(startedView).then ->
          done()

  describe "failing cases", ->
    it "should not find a preloaded view with id dolan", ->
      supersonic.ui.views.find("dolan").should.be.rejected

    it "should fail to stop a view with id dolan", ->
      supersonic.ui.views.stop("dolan").should.be.rejected

    it "should fail to start a view without id parameter", ->
      view = supersonic.ui.view "ui#empty"
      supersonic.ui.views.start(view).should.be.rejected

    it "should fail to start a view with an id that contains #", ->
      view = supersonic.ui.view "ui#empty"
      supersonic.ui.views.start(view, "#myAwesomeId").should.be.rejected
      supersonic.ui.views.start(view, "my#AwesomeId").should.be.rejected
      supersonic.ui.views.start(view, "myAwesomeId#").should.be.rejected
