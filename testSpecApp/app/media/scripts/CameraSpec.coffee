describe "supersonic.media.camera", ->
  it "should be defined", ->
    supersonic.media.camera.should.exist

  describe "getFromPhotoLibrary", ->
    it "should allow the user to select a picture from photo library and resolve to file URL", ->
      @timeout 10000

      options =
        targetWidth: 200
        targetHeight: 200
      supersonic.media.camera.getFromPhotoLibrary(options).should.eventually.be.a 'string'

  describe "when running on an actual device", ->
    describe "takePicture", ->
      it "should allow the user to take a picture and resolve to file URL", ->
        @timeout 10000

        options =
          targetWidth: 200
          targetHeight: 200
        supersonic.media.camera.takePicture(options).should.eventually.be.a 'string'
