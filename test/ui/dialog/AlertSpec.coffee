chai = require('chai')
chai.should()
chai.use require 'chai-as-promised'

alert = require('../../../src/supersonic/core/ui/dialog/alert')

describe "supersonic.ui.dialog.alert", ->
  it "should exist", ->
    alert.should.exist
