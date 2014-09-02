describe "ping", ->

  it "should be defined", ->
    expect( supersonic.ping ).toBeDefined()

  it "should pong", ->
    pong = supersonic.ping()

    expect( pong ).toEqual "Pong!"
