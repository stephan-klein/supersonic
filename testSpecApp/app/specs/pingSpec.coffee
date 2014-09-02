describe "ping", ->

  it "should be defined", ->
    expect( supersonic.ping ).toBeDefined()

  it "should pong", ->
    supersonic.ping().then (pong) ->
      expect(pong).toEqual "Pong!"
