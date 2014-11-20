describe "supersonic.ui.views", ->
  it "is an object", ->
    supersonic.ui.views.should.be.an 'object'

  describe "find()", ->
    it "is a function", ->
      supersonic.ui.views.find.should.be.a 'function'

    it "should find a view with identifier", (done)->
      supersonic.ui.views.find("dolan").then (view)->
        done()

    it "should find a view with a view", (done)->
      view = new supersonic.ui.View "dolan"
      supersonic.ui.views.find(view).then (view)->
        done()

  describe "start()", ->
    it "is a function", ->
      supersonic.ui.views.start.should.be.a "function"

    it "should start a view which is not started", (done)->
      view = new supersonic.ui.View
        location: "ui#empty"
        id: "emptyView?#{Math.random()}"

      supersonic.ui.views.start(view).then ->
        view.stop().then ->
          done()

  describe "stop()", ->
    it "is a function", ->
      supersonic.ui.views.stop.should.be.a "function"

    describe "with a started view returned by find", ->

      it "should stop the view", (done)->
        view = new supersonic.ui.View
          location: "ui#empty"
          id: "emptyView?#{Math.random()}"

        view.start().then ->
          supersonic.ui.views.stop(view).then ->
            done()

    describe "with id string", ->

      it "should stop the view", (done)->
        id = "emptyView?#{Math.random()}"
        view = new supersonic.ui.View
          location: "ui#empty"
          id: id

        view.start().then ->
          supersonic.ui.views.stop(id).then ->
            done()
