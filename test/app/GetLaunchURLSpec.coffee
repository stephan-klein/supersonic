chai = require('chai')
chai.should()
chai.use require 'chai-as-promised'

steroids = require '../../src/supersonic/mock/steroids'
window = require '../../src/supersonic/mock/window'
logger = require('../../src/supersonic/core/logger')(steroids, window)
getLaunchURL = require('../../src/supersonic/core/app/getLaunchURL')(steroids, logger)

describe "supersonic.app.getLaunchURL", ->
  it "should exist", ->
    getLaunchURL.should.exist
