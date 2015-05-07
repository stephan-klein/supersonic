chai = require('chai')
chai.should()
chai.use require 'chai-as-promised'

steroids = require '../src/supersonic/mock/steroids'
Window = require '../src/supersonic/mock/window'
logger = require('../src/supersonic/core/logger')(steroids, new Window())

describe "supersonic.logger", ->
  it "should have log", ->
    logger.log.should.exist
