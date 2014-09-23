expect = window.chai.expect
window.chai.should()

describe "supersonic.device.geolocation", ->
  it "should be defined", ->
    supersonic.device.geolocation.should.exist

  it "should get position", ->
    supersonic.device.geolocation.getPosition().should.eventually.have.property 'coords'

  it "should get watch position", ->

    pos = new Promise (resolve) ->
      supersonic.device.geolocation.watchPosition().onValue resolve

    pos.should.eventually.have.property 'coords'
