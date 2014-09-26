describe "supersonic.device.compass", ->
  it "should be defined", ->
    supersonic.device.compass.should.exist

  describe "getHeading", ->
    it "should resolve to next known heading", ->
      supersonic.device.compass.getHeading().should.eventually.have.property 'magneticHeading'

  describe "watchHeading", ->
    it "should return be a stream of heading updates", ->

      pos = new Promise (resolve) ->
        supersonic.device.compass.watchHeading().onValue resolve

      pos.should.eventually.have.property 'magneticHeading'
