describe "supersonic.ui.views", ->
  it "should be defined", ->
    supersonic.ui.views.should.exist

  describe "start", ->
    it "should exist", ->
      supersonic.ui.views.start.should.exist

    it "should be a function", ->
      supersonic.ui.views.start.should.be.a "function"

    describe "with view object", ->
      view = supersonic.ui.view "ui#empty"

      it "should start a view with id test", ->
        supersonic.ui.views.start(view, "test").should.be.fulfilled

      it "should fail to start another view with id test", ->
        supersonic.ui.views.start(view, "test").should.be.rejected

    describe "with shorthand route", ->
      it "should start a view id test2", ->
        supersonic.ui.views.start("ui#empty", "test2").should.be.fulfilled

      it "should fail to start another view with id test2", ->
        supersonic.ui.views.start("ui#empty", "test2").should.be.rejected

  describe "find", ->
    it "should exist", ->
      supersonic.ui.views.find.should.exist

    it "should be a function", ->
      supersonic.ui.views.find.should.be.a "function"

    it "should find a started view with id test2", ->
      supersonic.ui.views.find("test2").should.be.fulfilled

    it "should return a promise that resolves with a StartedView", ->
      supersonic.ui.views.find("test2").should.eventually.have.property "getId"

    it "should not find a preloaded view with id dolan", ->
      supersonic.ui.views.find("dolan").should.be.rejected

  describe "stop", ->
    it "should exist", ->
      supersonic.ui.views.stop.should.exist

    it "should be a function", ->
      supersonic.ui.views.stop.should.be.a "function"

    it "should stop a view with id test", ->
      supersonic.ui.views.stop("test").should.be.fulfilled

    it "should stop a view with id test2", ->
      supersonic.ui.views.stop("test2").should.be.fulfilled

    it "should fail to stop a view with id dolan", ->
      supersonic.ui.views.stop("dolan").should.be.rejected
