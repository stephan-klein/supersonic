expect = window.chai.expect
window.chai.should()

describe "supersonic.steroids.app.getLaunchURL", ->
  it "should be defined", ->
    supersonic.steroids.app.getLaunchURL.should.exist

  it "should be rejected", ->
    supersonic.steroids.app.getLaunchURL().should.be.rejected

describe "supersonic.steroids.app.sleep", ->
  it "should be defined", ->
    supersonic.steroids.app.sleep.should.exist

  it "should disable sleep", ->
    supersonic.steroids.app.sleep.disable().should.be.fulfilled

  it "should enable sleep", ->
    supersonic.steroids.app.sleep.enable().should.be.fulfilled

describe "supersonic.steroids.app.splashscreen", ->
  it "should be defined", ->
    supersonic.steroids.app.splashscreen.should.exist

  it "should show splashscreen", ->
    supersonic.steroids.app.splashscreen.show().should.be.fulfilled

  it "should hide splashscreen", ->
    @timeout 5000
    supersonic.steroids.app.splashscreen.hide().should.be.fulfilled


