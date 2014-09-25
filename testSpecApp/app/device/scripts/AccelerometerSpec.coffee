describe "supersonic.device.accelerometer", ->
  it "should be defined", ->
    supersonic.device.accelerometer.should.exist

  describe "getAcceleration", ->
    it "should resolve to next known acceleration", ->
      supersonic.device.accelerometer.getAcceleration().should.eventually.have.property 'x'

  describe "watchAcceleration", ->
    it "should return be a stream of acceleration updates", ->

      pos = new Promise (resolve) ->
        supersonic.device.accelerometer.watchAcceleration().onValue resolve

      pos.should.eventually.have.property 'x'
