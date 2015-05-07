chai = require('chai')
chai.should()
chai.use require 'chai-as-promised'

steroids = require '../src/supersonic/mock/steroids'
Window = require '../src/supersonic/mock/window'
logger = require('../src/supersonic/core/logger')(steroids, new Window())
debug = require('../src/supersonic/core/debug')(steroids, logger)

describe "supersonic.debug", ->
  it "should have ping", ->
    debug.ping.should.exist
