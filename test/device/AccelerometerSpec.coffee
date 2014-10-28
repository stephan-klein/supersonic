chai = require('chai')
chai.should()
chai.use require 'chai-as-promised'

steroids = require '../../src/supersonic/mock/steroids'
window = require '../../src/supersonic/mock/window'
logger = require('../../src/supersonic/core/logger')(steroids, window)
accelerometer = require('../../src/supersonic/core/device/accelerometer')(steroids, logger)

describe "supersonic.device.accelerometer", ->
  it "should exist", ->
    accelerometer.should.exist

describe "supersonic.device.accelerometer.watchAcceleration", ->
  it "should exist", ->
    accelerometer.watchAcceleration.should.exist

describe "supersonic.device.accelerometer.getAcceleration", ->
  it "should exist", ->
    accelerometer.getAcceleration.should.exist
