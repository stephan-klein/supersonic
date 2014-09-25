chai = require('chai')
chai.should()
chai.use require 'chai-as-promised'

steroids = require '../../src/supersonic/mock/steroids'
window = require '../../src/supersonic/mock/window'
logger = require('../../src/supersonic/core/logger')(steroids, window)
camera = require('../../src/supersonic/media/camera')(steroids, logger)

describe "supersonic.media.camera", ->
  it "should exist", ->
    camera.should.exist

describe "supersonic.media.camera.takePicture", ->
  it "should exist", ->
    camera.takePicture.should.exist

describe "supersonic.media.camera.getFromPhotoLibrary", ->
  it "should exist", ->
    camera.getFromPhotoLibrary.should.exist
