chai = require('chai')
chai.should()
chai.use require 'chai-as-promised'

notification = require('../../src/supersonic/cordova/notification')

describe "supersonic.cordova.notification", ->
  it "should have alert", ->
    notification.alert.should.exist
