chai = require('chai')
chai.should()
chai.use require 'chai-as-promised'

steroids = require '../../src/supersonic/mock/steroids'
window = require '../../src/supersonic/mock/window'
logger = require('../../src/supersonic/core/logger')(steroids, window)
buttons = require('../../src/supersonic/core/device/buttons')(steroids, logger)

describe "supersonic.device.buttons", ->
  it "should exist", ->
    buttons.should.exist

  describe "back", ->
    it "should exist", ->
      buttons.back.should.exist

    describe "whenPressed", ->
      it "should exist", ->
        buttons.back.whenPressed.should.exist