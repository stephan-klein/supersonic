describe "supersonic.notification.confirm", ->
  it "should be defined", ->
    supersonic.notification.confirm.should.exist

  it "should present a confirm", ->
    supersonic.notification.confirm().should.be.fulfilled

  it "should present a confirm with null params", ->
    supersonic.notification.confirm(null).should.be.fulfilled

  it "should present a confirm with title as param", ->
    supersonic.notification.confirm("What up?").should.be.fulfilled

  it "should present a confirm with title and options params", ->
    title = "I'm a Custom Confirm!"
    options =
      message: "Custom Message"
      buttonLabels: ["Yay","NO!","third"]

    supersonic.notification.confirm(title, options).should.be.fulfilled
