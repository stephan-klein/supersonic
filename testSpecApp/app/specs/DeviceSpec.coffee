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

describe "supersonic.device.accelerometer", ->
  it "should be defined", ->
    supersonic.device.accelerometer.should.exist

  it "should get acceleration", ->
    supersonic.device.accelerometer.getAcceleration().should.eventually.have.property 'x'

  it "should get watch acceleration", ->

    pos = new Promise (resolve) ->
      supersonic.device.accelerometer.watchAcceleration().onValue resolve

    pos.should.eventually.have.property 'x'
