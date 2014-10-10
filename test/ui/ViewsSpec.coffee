chai = require('chai')
chai.should()
chai.use require 'chai-as-promised'

steroids = require '../../src/supersonic/mock/steroids'
window = require '../../src/supersonic/mock/window'
logger = require('../../src/supersonic/core/logger')(steroids, window)
views = require('../../src/supersonic/ui/views')(steroids, logger)

describe "supersonic.ui.views", ->
  it "should exist", ->
    views.should.exist
