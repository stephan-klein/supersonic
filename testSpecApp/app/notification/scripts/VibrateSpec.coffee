describe "supersonic.notification.vibrate", ->
  it "should be defined", ->
    supersonic.notification.vibrate.should.exist

  it "should present a vibration", ->
    supersonic.notification.vibrate().should.be.fulfilled

  it "should present a 2500-ms vibration", ->
    supersonic.notification.vibrate(2500).should.be.fulfilled
