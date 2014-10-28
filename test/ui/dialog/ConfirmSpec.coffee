chai = require('chai')
chai.should()
chai.use require 'chai-as-promised'

confirm = require('../../../src/supersonic/core/ui/dialog/confirm')

describe "supersonic.ui.dialog.confirm", ->
  it "should exist", ->
    confirm.should.exist
