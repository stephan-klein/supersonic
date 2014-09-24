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
