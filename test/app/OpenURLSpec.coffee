chai = require('chai')
chai.should()
chai.use require 'chai-as-promised'

steroids = require '../../src/supersonic/mock/steroids'
window = require '../../src/supersonic/mock/window'
logger = require('../../src/supersonic/core/logger')(steroids, window)
openURL = require('../../src/supersonic/core/app/openURL')(steroids, logger)

describe "supersonic.app.openURL", ->
  it "should exist", ->
    openURL.should.exist
