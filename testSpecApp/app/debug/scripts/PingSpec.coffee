describe "supersonic.debug.ping", ->
  it "should be defined", ->
    supersonic.debug.ping.should.exist

  it "should pong", ->
    supersonic.debug.ping().should.eventually.equal "Pong!"
