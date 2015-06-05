describe "supersonic.ui.views.current", ->
  currentView = null
  before ->
    currentView = supersonic.ui.views?.current

  it "is an object", ->
    currentView.should.be.an 'object'

  describe "visibility", ->
    it "is a stream", ->
      currentView.visibility.should.have.property('onValue').be.a 'function'

    it "should have a current, boolean value", ->
      new Promise((resolve) ->
        currentView.visibility.take(1).onValue resolve
      ).should.eventually.be.a 'boolean'

  describe "whenVisible", ->
    it "is a function", ->
      currentView.whenVisible.should.be.a 'function'

    it "accepts a listener that is called when the view becomes visible", ->
      new Promise((resolve) ->
        currentView.whenVisible resolve
      ).should.be.fulfilled

  describe "whenHidden", ->
    it "is a function", ->
      currentView.whenHidden.should.be.a 'function'

    it "accepts a listener that is called when the view is hidden", (done)->
      currentView.whenHidden ->
        done()

      document.dispatchEvent new CustomEvent 'visibilitychange', {
        detail: visibilityState: 'hidden'
      }
