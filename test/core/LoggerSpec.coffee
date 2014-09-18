chai = require('chai')
chai.should()
chai.use require 'chai-as-promised'

steroids = require '../../src/supersonic/steroids.mock'
debug = require('../../src/supersonic/core/logger')(steroids)

describe "supersonic.core.logger", ->
  it "should have log", ->
    debug.log.should.exist
