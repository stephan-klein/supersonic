chai = require('chai')
chai.should()
chai.use require 'chai-as-promised'

steroids = require '../../src/supersonic/mock/steroids'
window = require '../../src/supersonic/mock/window'
logger = require('../../src/supersonic/core/logger')(steroids, window)
sleep = require('../../src/supersonic/app/sleep')(steroids, logger)

describe "supersonic.app.sleep.disable", ->
  it "should exist", ->
    sleep.disable.should.exist

describe "supersonic.app.sleep.enable", ->
  it "should exist", ->
    sleep.enable.should.exist
