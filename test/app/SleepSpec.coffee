chai = require('chai')
chai.should()
chai.use require 'chai-as-promised'

steroids = require '../../src/supersonic/mock/steroids'
Window = require '../../src/supersonic/mock/window'
logger = require('../../src/supersonic/core/logger')(steroids, new Window())
sleep = require('../../src/supersonic/core/app/sleep')(steroids, logger)

describe "supersonic.app.sleep.disable", ->
  it "should exist", ->
    sleep.disable.should.exist

describe "supersonic.app.sleep.enable", ->
  it "should exist", ->
    sleep.enable.should.exist
