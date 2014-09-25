
describe "supersonic.app.splashscreen", ->
  it "should be defined", ->
    supersonic.app.splashscreen.should.exist

  # TODO: Can we find out splashscreen shown/hidden status so we can assert whether that changes?

  it "should show splashscreen", ->
    supersonic.app.splashscreen.show().should.be.fulfilled

  it "should hide splashscreen", ->
    @timeout 5000
    supersonic.app.splashscreen.hide().should.be.fulfilled
