describe "supersonic.app.getLaunchURL", ->
  it "should be defined", ->
    supersonic.app.getLaunchURL.should.exist

  it "should be rejected", ->
    supersonic.app.getLaunchURL().should.be.rejected



