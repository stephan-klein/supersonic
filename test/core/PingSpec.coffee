chai = require('chai')
chai.should()
chai.use require 'chai-as-promised'

core = require('../../src/supersonic/core')

describe "supersonic-core", ->
  it "should have ping", ->
    core.ping.should.exist

  describe "ping", ->
    it "should respond with pong", ->
      core.ping().should.eventually.equal "Pong!"
