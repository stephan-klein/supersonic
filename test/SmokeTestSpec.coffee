chai = require('chai')
chai.should()
chai.use require 'chai-as-promised'

supersonic = require('../src/supersonic')

describe "supersonic", ->
  it "should be defined", ->
    supersonic.should.exist

  it "should have ping", ->
    supersonic.ping.should.exist

  describe "ping", ->
    it "should respond with pong", ->
      supersonic.ping().should.eventually.equal "Pong!"
