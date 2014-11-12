
describe "supersonic.device.geolocation", ->
  it "should be defined", ->
    supersonic.device.geolocation.should.exist

  describe "getPosition", ->
    it "should resolve to next known position and return a proper heading object", ->
      supersonic.device.geolocation.getPosition().should.eventually.have.keys ['coords', 'timestamp']

    describe "callbacks", ->
      it "should call onSuccess", (done) ->
        supersonic.device.geolocation.getPosition
          onSuccess: ->
            done()
            
  describe "watchPosition", ->
    it "should return be a stream of position updates", ->
      pos = new Promise (resolve) ->
        supersonic.device.geolocation.watchPosition().onValue resolve

      pos.should.eventually.have.keys ['coords', 'timestamp']

    describe "callbacks", ->

      it "should call onSuccess", (done) ->
        supersonic.device.geolocation.getPosition
          onSuccess: ->
            done()