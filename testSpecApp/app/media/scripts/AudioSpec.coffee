describe "supersonic.media.audio", ->
  it "should be defined", ->
    supersonic.media.audio.should.exist

  describe "play", ->
    it "should allow the user to take a picture and resolve to file URL", ->
      @timeout 20000

      supersonic.media.audio.play("http://audio.ibeat.org/content/p1rj1s/p1rj1s_-_rockGuitar.mp3").should.be.fulfilled

  
  