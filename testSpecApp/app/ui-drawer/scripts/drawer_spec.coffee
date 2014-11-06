describe "supersonic.ui.drawers", ->
  # THESE TESTS CAN ONLY BE RUN ONCE IN APP LIFECYCLE (BECAUSE NO DRAWER UNLOAD)

  it "should be defined", ->
    supersonic.ui.drawers.should.exist

  it "should be able to use started view", ->
    receivedMessage = new Promise (resolve) ->
      listener = (e) ->
        window.removeEventListener "message", listener
        resolve e.data
      window.addEventListener "message", listener

    view = supersonic.ui.view("/app/ui-drawer/postback.html?msg=custom")
    view.start("custom-id-left-drawer")
      .then(
        (startedView) ->
          supersonic.ui.drawers.init(startedView, side: "left", width: 100)
          receivedMessage.should.eventually.equal "custom"
      ).catch ->
        throw new Error "Cannot run tests twice for drawers in single app run"

  it "should be able to update options", ->
    supersonic.ui.drawers.updateOptions(
      shadow: false
      animation:
        type: "parallax"
        duration: 0.3
    ).should.be.fulfilled

  describe "opening unstarted views", ->

    it "should be able to init right drawer", ->
      receivedMessage = new Promise (resolve) ->
        listener = (e) ->
          supersonic.logger.log "Received message: #{JSON.stringify(e.data)}"
          window.removeEventListener "message", listener
          resolve e.data
        window.addEventListener "message", listener

      view = supersonic.ui.view("/app/ui-drawer/postback.html?msg=right")

      supersonic.ui.drawers.init(view, side: "right").should.be.fulfilled
      receivedMessage.should.eventually.equal "right"

    it "should not be able to init right again without custom id", ->
      view = supersonic.ui.view("/app/ui-drawer/postback.html?msg=right")
      supersonic.ui.drawers.init(view, side: "right").should.be.rejectedWith("Cannot use a preloaded layer which is currently in use elsewhere in the application")

    it "should be able to init left drawer", ->
      receivedMessage = new Promise (resolve) ->
        listener = (e) ->
          window.removeEventListener "message", listener
          resolve e.data
        window.addEventListener "message", listener

      view = supersonic.ui.view("/app/ui-drawer/postback.html?msg=left")

      supersonic.ui.drawers.init(view, side: "left").should.be.fulfilled
      receivedMessage.should.eventually.equal "left"

    it "should not be able to init left again without custom id", ->
      view = supersonic.ui.view("/app/ui-drawer/postback.html?msg=left")
      supersonic.ui.drawers.init(view, side: "left").should.be.rejectedWith("Cannot use a preloaded layer which is currently in use elsewhere in the application")

  describe "opening and closing", ->
    it "should be able to show left drawer", (done) ->
      (new Promise (resolve)->
        steroids.drawers.on "didshow", resolve
      ).should.be.fulfilled.and.notify done

      supersonic.ui.drawers.open("left").should.be.fulfilled



    it "should be able to close left drawer", (done)->
      (new Promise (resolve)->
        steroids.drawers.on "didclose", resolve
      ).should.be.fulfilled.and.notify done

      supersonic.ui.drawers.close().should.be.fulfilled


    it "should be able to show right drawer", (done) ->
      (new Promise (resolve)->
        steroids.drawers.on "didshow", resolve
      ).should.be.fulfilled.and.notify done

      supersonic.ui.drawers.open("right").should.be.fulfilled



    it "should be able to close right drawer", (done)->
      (new Promise (resolve)->
        steroids.drawers.on "didclose", resolve
      ).should.be.fulfilled.and.notify done

      supersonic.ui.drawers.close().should.be.fulfilled
