expect = window.chai.expect
window.chai.should()

describe "supersonic.cordova.notification.alert", ->
  it "should be defined", ->
    supersonic.cordova.notification.alert.should.exist

  it "should present an alert", ->
    supersonic.cordova.notification.alert().should.be.fulfilled

  it "should present an alert with null params", ->
    supersonic.cordova.notification.alert(null).should.be.fulfilled

  it "should present an alert with custom string title", ->
    supersonic.cordova.notification.alert("Custom").should.be.fulfilled

  it "should present an alert with options object", ->
    options =
      title: "Custom Title"
      message: "I'm an alert!"
      buttonLabel: "Close"

    supersonic.cordova.notification.alert(options).should.be.fulfilled


describe "supersonic.cordova.notification.confirm", ->
  it "should be defined", ->
    supersonic.cordova.notification.confirm.should.exist

  it "should present a confirm", ->
    supersonic.cordova.notification.confirm().should.be.fulfilled

  it "should present a confirm with null params", ->
    supersonic.cordova.notification.confirm(null).should.be.fulfilled

  it "should present a confirm with custom string title", ->
    supersonic.cordova.notification.confirm("What up?").should.be.fulfilled

  it "should present a confirm with options object", ->
    options =
      title: "Custom Title"
      message: "I'm a Custom Confirm!"
      buttonLabels: ["Yay","NO!","third"]

    supersonic.cordova.notification.confirm(options).should.be.fulfilled
