chai = require('chai')
chai.should()
chai.use require 'chai-as-promised'

steroids = require '../src/supersonic/mock/steroids'
window = require '../src/supersonic/mock/window'
logger = require('../src/supersonic/core/logger')(steroids, window)

describe "supersonic.logger", ->
  it "should have log", ->
    logger.log.should.exist
