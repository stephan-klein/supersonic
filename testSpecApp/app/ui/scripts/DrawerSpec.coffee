
describe "supersonic.ui.drawer", ->
  it "should be defined", ->
    supersonic.ui.drawer.should.exist

    dr = supersonic.ui.drawer

    view = supersonic.ui.view("/app/debug/DebugSpec.html")

    describe "show", ->
      it "should be defined", ->
        dr.show.should.exist
      it "should show a drawer", ->
        view.preload().then ()->
          dr.show(view, 'left')

    describe "hide", ->
      it "should be defined", ->
        dr.hide.should.exist
      it "should hide a drawer", ->
        dr.hide()

    describe "asLeft", ->
      it "should de defined", ->
        dr.asLeft.should.exist
