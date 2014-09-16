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

describe "supersonic.cordova.notification.vibrate", ->
  it "should be defined", ->
    supersonic.cordova.notification.vibrate.should.exist

  it "should present a vibration", ->
    supersonic.cordova.notification.vibrate().should.be.fulfilled

  it "should present a 2500-ms vibration", ->
    supersonic.cordova.notification.vibrate(2500).should.be.fulfilled


describe "supersonic.cordova.notification.prompt", ->
  it "should be defined", ->
    supersonic.cordova.notification.prompt.should.exist

  it "should present a prompt", ->
    supersonic.cordova.notification.prompt().should.be.fulfilled

  it "should present a prompt with null params", ->
    supersonic.cordova.notification.prompt(null).should.be.fulfilled

  it "should present a prompt with custom string message", ->
    supersonic.cordova.notification.prompt("Please type").should.be.fulfilled

  it "should present a prompt with options object", ->
    options =
      title: "Custom Title"
      message: "I'm a Custom Prompt!"
      buttonLabels: ["Yay","NO!"]
      defaultText: "Default text"

    supersonic.cordova.notification.prompt(options).should.be.fulfilled
