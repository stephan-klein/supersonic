require('chai').should()

describe "supersonic root", ->
  it "should be defined", ->
    require('../src/supersonic').should.exist