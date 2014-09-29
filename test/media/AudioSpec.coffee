chai = require('chai')
chai.should()
chai.use require 'chai-as-promised'

steroids = require '../../src/supersonic/mock/steroids'
window = require '../../src/supersonic/mock/window'
logger = require('../../src/supersonic/core/logger')(steroids, window)
audio = require('../../src/supersonic/media/audio')(steroids, logger)

describe "supersonic.media.audio", ->
  it "should exist", ->
    audio.should.exist

describe "supersonic.media.audio.play", ->
  it "should exist", ->
    audio.play.should.exist
