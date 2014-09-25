
describe "supersonic.device.geolocation", ->
  it "should be defined", ->
    supersonic.device.geolocation.should.exist

  describe "getPosition", ->
    it "should resolve to next known position", ->
      supersonic.device.geolocation.getPosition().should.eventually.have.property 'coords'

  describe "watchPosition", ->
    it "should return be a stream of position updates", ->
      pos = new Promise (resolve) ->
        supersonic.device.geolocation.watchPosition().onValue resolve

      pos.should.eventually.have.property 'coords'
