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

    it "should not trigger on current tick", ->
      triggered = false
      currentView.whenVisible ->
        triggered = true
      triggered.should.equal false

    describe "unsubscribing", ->
      afterEach ->
        document.dispatchEvent new CustomEvent 'visibilitychange', {
          detail: visibilityState: 'visible'
        }

      it "will accept an unsubscribe function from the listener for signaling invisibility", (done) ->
        new Promise((resolve) ->
          currentView.whenVisible ->
            resolve
        ).should.be.fulfilled.and.notify(done)

        document.dispatchEvent new CustomEvent 'visibilitychange', {
          detail: visibilityState: 'hidden'
        }
