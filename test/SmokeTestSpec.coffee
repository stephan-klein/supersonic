chai = require('chai')
chai.should()
chai.use require 'chai-as-promised'

describe "supersonic", ->
  it "should be defined", ->
    require('../src/supersonic').should.exist
