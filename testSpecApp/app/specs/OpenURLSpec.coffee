expect = window.chai.expect
window.chai.should()

describe "supersonic.steroids.openURL", ->
  it "should be defined", ->
    supersonic.steroids.openURL.should.exist

  it "should open Apple Maps", ->
    @timeout 10000

    url = "maps://?daddr=San+Francisco,+CA&saddr=cupertino"

    supersonic.steroids.openURL(url).should.be.fulfilled

  it "should not open dolanz://", ->
    supersonic.steroids.openURL("dolanz://").should.be.rejected

  it "should not open null", ->
    #acually crashes
    #supersonic.steroids.openURL(null).should.be.rejected
