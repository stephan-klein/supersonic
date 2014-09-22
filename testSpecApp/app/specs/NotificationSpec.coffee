expect = window.chai.expect
window.chai.should()

describe "supersonic.notification.alert", ->
  it "should be defined", ->
    supersonic.notification.alert.should.exist

  it "should present an alert", ->
    supersonic.notification.alert().should.be.fulfilled

  it "should present an alert with null params", ->
    supersonic.notification.alert(null).should.be.fulfilled

  it "should present an alert with custom string title", ->
    supersonic.notification.alert("Custom").should.be.fulfilled

  it "should present an alert with options object", ->
    options =
      title: "Custom Title"
      message: "I'm an alert!"
      buttonLabel: "Close"

    supersonic.notification.alert(options).should.be.fulfilled


describe "supersonic.notification.confirm", ->
  it "should be defined", ->
    supersonic.notification.confirm.should.exist

  it "should present a confirm", ->
    supersonic.notification.confirm().should.be.fulfilled

  it "should present a confirm with null params", ->
    supersonic.notification.confirm(null).should.be.fulfilled

  it "should present a confirm with custom string title", ->
    supersonic.notification.confirm("What up?").should.be.fulfilled

  it "should present a confirm with options object", ->
    options =
      title: "Custom Title"
      message: "I'm a Custom Confirm!"
      buttonLabels: ["Yay","NO!","third"]

    supersonic.notification.confirm(options).should.be.fulfilled

describe "supersonic.notification.vibrate", ->
  it "should be defined", ->
    supersonic.notification.vibrate.should.exist

  it "should present a vibration", ->
    supersonic.notification.vibrate().should.be.fulfilled

  it "should present a 2500-ms vibration", ->
    supersonic.notification.vibrate(2500).should.be.fulfilled


describe "supersonic.notification.prompt", ->
  it "should be defined", ->
    supersonic.notification.prompt.should.exist

  it "should present a prompt", ->
    supersonic.notification.prompt().should.be.fulfilled

  it "should present a prompt with null params", ->
    supersonic.notification.prompt(null).should.be.fulfilled

  it "should present a prompt with custom string message", ->
    supersonic.notification.prompt("Please type").should.be.fulfilled

  it "should present a prompt with options object", ->
    options =
      title: "Custom Title"
      message: "I'm a Custom Prompt!"
      buttonLabels: ["Yay","NO!"]
      defaultText: "Default text"

    supersonic.notification.prompt(options).should.be.fulfilled
