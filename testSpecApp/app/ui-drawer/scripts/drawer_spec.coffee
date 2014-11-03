describe "supersonic.ui.drawer", ->
  it "should be defined", ->
    supersonic.ui.drawer.should.exist

  it "should be able to init right drawer", ->
    @timeout 3000
    receivedMessage = new Promise (resolve) ->
      window.addEventListener "message", (e) ->
        supersonic.logger.log "Received message: #{JSON.stringify(e.data)}"
        resolve e.data

    view = supersonic.ui.view("/app/ui-drawer/postback.html?msg=right")

    supersonic.ui.drawer.init(view, side: "right").should.be.fulfilled
    receivedMessage.should.eventually.equal "right"

  it "should not be able to init again", ->
    view = supersonic.ui.view("/app/ui-drawer/postback.html?msg=right")
    supersonic.ui.drawer.init(view, side: "right").should.be.rejectedWith("View was already started. Remove drawer and unload view first.")
