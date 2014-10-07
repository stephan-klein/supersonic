chai = require('chai')
chai.should()
chai.use require 'chai-as-promised'

steroids = require '../../src/supersonic/mock/steroids'
window = require '../../src/supersonic/mock/window'
logger = require('../../src/supersonic/core/logger')(steroids, window)
screen = require('../../src/supersonic/ui/view')(steroids, logger)

describe "supersonic.ui.view", ->
  it "should exist", ->
    view.should.exist
