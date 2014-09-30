describe "supersonic.ui.screen", ->
  it "should be defined", ->
    supersonic.ui.screen.should.exist

  describe "setAllowedRotations", ->

    it "should set allowed rotations to portrait and portraitUpsideDown", ->
      supersonic.ui.screen.setAllowedRotations(["portrait", "portraitUpsideDown"]).should.be.fulfilled

  describe "rotateTo", ->
    
    it "should rotate to portraitUpsideDown", ->
      supersonic.ui.screen.rotateTo("portraitUpsideDown").should.be.fulfilled

    it "should rotate to portrait", ->
      @timeout 7000
      supersonic.ui.screen.rotateTo("portrait").should.be.fulfilled
