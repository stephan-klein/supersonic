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
