describe "supersonic.app.statusBar", ->
  it "should be defined", ->
    supersonic.app.statusBar.should.exist

  # TODO: Can we find out statusBar shown/hidden status so we can assert whether that changes?

  describe "hide", ->
    beforeEach ->
      supersonic.app.statusBar.show()

    it "should hide status bar when the status bar is visible", ->
      supersonic.app.statusBar.hide().should.be.fulfilled

  describe "show", ->
    beforeEach ->
      supersonic.app.statusBar.hide()

    describe "when the status bar is not visible", ->
      it "should show status bar", ->
        supersonic.app.statusBar.show().should.be.fulfilled

      it "should show status bar with a string param", ->
        supersonic.app.statusBar.show("light").should.be.fulfilled

      it "should show status bar with an object param", ->
        supersonic.app.statusBar.show(style: "light").should.be.fulfilled

  describe "callbacks", ->

    it "should call onSuccess when status bar is hidden", (done) ->

      supersonic.app.statusBar.hide
        onSuccess: ->
          done()

    it "should call onSuccess when status bar is shown", (done) ->
      supersonic.app.statusBar.show
        onSuccess: ->
          done()

