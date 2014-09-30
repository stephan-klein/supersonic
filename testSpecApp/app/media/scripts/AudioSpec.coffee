describe "supersonic.media.audio", ->
  it "should be defined", ->
    supersonic.media.audio.should.exist

  describe "play", ->
    it "should play an audio file from path", ->
      @timeout 4000
      supersonic.media.audio.play("http://localhost/slap.mp3").should.be.fulfilled
