chai = require('chai')
chai.should()
chai.use require 'chai-as-promised'

supersonic = require('../src/supersonic')

describe "supersonic", ->
  it "should be defined", ->
    supersonic.should.exist
