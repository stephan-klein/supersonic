describe "supersonic.app.sleep", ->
  it "should be defined", ->
    supersonic.app.sleep.should.exist

  # TODO: Can we find out disabled/enabled status so we can assert whether that status changes?

  it "should disable sleep", ->
    supersonic.app.sleep.disable().should.be.fulfilled

  it "should enable sleep", ->
    supersonic.app.sleep.enable().should.be.fulfilled

  describe "callbacks", ->

    it "should call onSuccess when sleep is disabled", (done) ->

      supersonic.app.sleep.disable
        onSuccess: ->
          done()

    it "should call onSuccess when sleep is enabled", (done) ->

      supersonic.app.sleep.enable
        onSuccess: ->
          done()