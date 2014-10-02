describe "supersonic.device.compass", ->
  it "should be defined", ->
    supersonic.device.compass.should.exist

  describe "getHeading", ->
    it "should resolve to next known heading and return a proper heading object", ->
      supersonic.device.compass.getHeading().should.eventually.have.keys ['magneticHeading', 'trueHeading', 'headingAccuracy', 'timestamp']

  describe "watchHeading", ->
    it "should return be a stream of heading updates", ->

      pos = new Promise (resolve) ->
        supersonic.device.compass.watchHeading().onValue resolve

      pos.should.eventually.have.keys ['magneticHeading', 'trueHeading', 'headingAccuracy', 'timestamp']
