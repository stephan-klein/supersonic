describe "supersonic.debug.ping", ->
  it "should be defined", ->
    supersonic.debug.ping.should.exist

  it "should pong", ->
    supersonic.debug.ping().should.eventually.equal "Pong!"

  describe "callbacks", ->

    it "should call onSuccess", (done) ->

      supersonic.debug.ping
        onSuccess: ->
          done()
