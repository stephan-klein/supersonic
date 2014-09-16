chai = require('chai')
chai.should()
chai.use require 'chai-as-promised'

notification = require('../../src/supersonic/cordova/notification')

describe "supersonic.cordova.notification.alert", ->
  it "should exist", ->
    notification.alert.should.exist

describe "supersonic.cordova.notification.confirm", ->
  it "should exist", ->
    notification.confirm.should.exist

describe "supersonic.cordova.notification.vibrate", ->
  it "should exist", ->
    notification.vibrate.should.exist

describe "supersonic.cordova.notification.prompt", ->
  it "should exist", ->
    notification.prompt.should.exist
