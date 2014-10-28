chai = require('chai')
chai.should()
chai.use require 'chai-as-promised'

steroids = require '../../src/supersonic/mock/steroids'
window = require '../../src/supersonic/mock/window'
logger = require('../../src/supersonic/core/logger')(steroids, window)
splashscreen = require('../../src/supersonic/core/app/splashscreen')(steroids, logger)

describe "supersonic.app.splashscreen.show", ->
  it "should exist", ->
    splashscreen.show.should.exist

describe "supersonic.app.splashscreen.hide", ->
  it "should exist", ->
    splashscreen.hide.should.exist
