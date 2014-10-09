describe "supersonic.ui.views", ->
  it "should be defined", ->
    supersonic.ui.views.should.exist

  describe "start", ->
    it "should exist", ->
      supersonic.ui.views.start.should.exist

    it "should be a function", ->
      supersonic.ui.views.start.should.be.a "function"

    it "should start a view with id test", ->
      view = supersonic.ui.view "ui#empty"

      supersonic.ui.views.start(view, "test").should.be.fulfilled

    it "should fail to start another view with id test", ->
      view = supersonic.ui.view "ui#empty"

      supersonic.ui.views.start(view, "test").should.be.rejected

  describe "find", ->
    it "should exist", ->
      supersonic.ui.views.find.should.exist

    it "should be a function", ->
      supersonic.ui.views.find.should.be.a "function"

    it "should start a view with id test2", ->
      view = supersonic.ui.view "ui#empty"

      supersonic.ui.views.start(view, "test2").should.be.fulfilled

    it "should find a started view with id test2", (done)->
      view = supersonic.ui.view "ui#empty"

      supersonic.ui.views.find("test2").should.be.fulfilled

    it "should return a promise that resolves with a StartedView", ->
      supersonic.ui.views.find("test2").should.eventually.have.property "getId"

    it "should not find a preloaded view with id dolan", ->
      supersonic.ui.views.find("dolan").should.be.rejected
