chai = require('chai')
chai.should()
chai.use require 'chai-as-promised'

alert = require('../../src/supersonic/notification/alert')

describe "supersonic.notification.alert", ->
  it "should exist", ->
    alert.should.exist