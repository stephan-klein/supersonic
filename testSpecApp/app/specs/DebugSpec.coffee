expect = window.chai.expect

describe "supersonic.debug.ping", ->
  it "should be defined", ->
    expect( supersonic.debug.ping ).to.exist

  it "should pong", ->
    expect( supersonic.debug.ping() ).to.eventually.equal "Pong!"
