chai = require('chai')
chai.should()
chai.use require 'chai-as-promised'

debug = require('../../src/supersonic/core/logger')

describe "supersonic.core.logger", ->
  it "should have log", ->
    debug.log.should.exist
