expect = window.chai.expect

describe "ping", ->
  it "should be defined", ->
    expect( supersonic.ping ).to.exist

  it "should pong", ->
    expect( supersonic.ping() ).to.eventually.equal "Pong!"
