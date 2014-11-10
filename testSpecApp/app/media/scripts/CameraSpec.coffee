describe "supersonic.media.camera", ->
  it "should be defined", ->
    supersonic.media.camera.should.exist

  describe "takePicture", ->
    it "should allow the user to take a picture and resolve to file URL", ->
      @timeout 10000

      options =
        targetWidth: 200
        targetHeight: 200
      supersonic.media.camera.takePicture(options).should.eventually.deep.be.a('string')

  describe "getFromPhotoLibrary", ->
    it "should allow the user to select a picture from photo library and resolve to file URL", ->
      @timeout 10000

      options =
        targetWidth: 200
        targetHeight: 200
      supersonic.media.camera.getFromPhotoLibrary(options).should.eventually.deep.be.a('string')

  describe "callbacks", ->

    it "should call onSuccess when picture is taken", (done) ->
      @timeout 10000

      options =
        targetWidth: 200
        targetHeight: 200
      supersonic.media.camera.takePicture options,
        onSuccess: ->
          done()

    it "should call onSuccess when picture is chosen", (done) ->
      @timeout 10000

      options =
        targetWidth: 200
        targetHeight: 200
      supersonic.media.camera.getFromPhotoLibrary options,
        onSuccess: ->
          done()
  