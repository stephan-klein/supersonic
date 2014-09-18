chai = require('chai')
chai.should()
chai.use require 'chai-as-promised'

debug = require('../../src/supersonic/core/debug')

describe "supersonic.core.debug", ->
  it "should have ping", ->
    debug.ping.should.exist
