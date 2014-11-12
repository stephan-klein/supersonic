describe "supersonic.ui.View", ->
  it "accepts a url", ->
    view = new supersonic.ui.View 'http://example.com'
    view.should.be.an 'object'
    view.getLocation().should.equal 'http://example.com'

  it "accepts a route", ->
    view = new supersonic.ui.View 'foo#bar'
    view.should.be.an 'object'
    view.getLocation().should.equal 'http://localhost/app/foo/bar.html'

  describe "start()", ->

    it "returns a started view that can be stopped", (done)->
      view = new supersonic.ui.View "ui#empty?#{Math.random()}"
      view.start()
      .then ->
        view.stop()
      .then ->
        done()

    describe "with an empty argument", ->
      it "works", (done)->
        id = "ui#empty?#{Math.random()}"
        view = new supersonic.ui.View id
        view.start().then ->
          view.getId().should.equal id
        .then ->
          view.stop()
        .then ->
          done()

    describe "with an argument", ->
      it "assigns the argument to the view's id", (done)->
        id = "this-is-the-id-#{Math.random()}"

        view = new supersonic.ui.View "ui#empty?#{Math.random()}"
        view.start(id).then ->
          view.getId().should.equal id
        .then ->
          view.stop()
        .then ->
          done()
