describe "supersonic.ui.views", ->
  it "should be defined", ->
    supersonic.ui.views.should.exist

  describe "find", ->
    it "should exist", ->
      supersonic.ui.views.find.should.exist

    it "should be a function", ->
      supersonic.ui.views.find.should.be.a "function"

    it "should find a preloaded view with id test", ->
      view = new steroids.views.WebView
        location: "empty.html"
        id: "test"
      view.preload {}, {
        onSuccess: ->
          supersonic.ui.views.find("test").should.be.fulfilled
      }

    it "should not find a preloaded view with id dolan", ->
      supersonic.ui.views.find("dolan").should.be.rejected
