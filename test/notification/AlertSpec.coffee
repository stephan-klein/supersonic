chai = require('chai')
chai.should()
chai.use require 'chai-as-promised'

alert = require('../../src/supersonic/core/notification/alert')

describe "supersonic.notification.alert", ->
  it "should exist", ->
    alert.should.exist