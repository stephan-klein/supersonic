chai = require('chai')
chai.should()
chai.use require 'chai-as-promised'

steroids = require '../../src/supersonic/mock/steroids'
window = require '../../src/supersonic/mock/window'
logger = require('../../src/supersonic/core/logger')(steroids, window)
navigate = require('../../src/supersonic/core/ui/navigate')(steroids, logger)

describe "supersonic.ui.navigate", ->
  it "should exist", ->
    navigate.should.exist
