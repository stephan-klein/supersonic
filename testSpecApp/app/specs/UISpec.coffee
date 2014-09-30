expect = window.chai.expect
window.chai.should()

describe "supersonic.ui.screen", ->
  it "should be defined", ->
    supersonic.ui.screen.should.exist

  it "supersonic.ui.screen.setAllowedRotations should be defined", ->
    supersonic.ui.screen.setAllowedRotations.should.exist

  it "should set allowed rotations to landscapeLeft", ->
    supersonic.ui.screen.setAllowedRotations(["landscapeLeft", "portrait"]).should.be.fulfilled

  it "supersonic.ui.screen.rotateTo should be defined", ->
    supersonic.ui.screen.rotateTo.should.exist

  it "should rotate to landscapeLeft", ->
    supersonic.ui.screen.rotateTo("landscapeLeft").should.be.fulfilled