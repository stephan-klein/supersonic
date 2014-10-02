describe "supersonic.device.platform", ->
  it "should be defined", ->
    supersonic.device.platform.should.exist

  it "should resolve to platform's name and version and device's model", ->
    supersonic.device.platform().should.eventually.have.keys ['name', 'version', 'model']