chai = require('chai')
chai.should()
chai.use require 'chai-as-promised'

vibrate = require('../../src/supersonic/notification/vibrate')

describe "supersonic.notification.vibrate", ->
  it "should exist", ->
    vibrate.should.exist