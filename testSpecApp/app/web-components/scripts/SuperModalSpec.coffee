before ->
  importsLoaded

fireAfterModalDidShow = (done) ->
  showListener = steroids.modal.on "didshow", ->
    steroids.modal.off "didshow", showListener
    done()

fireAfterModalDidHide = (done) ->
  hideListener = steroids.modal.on "didclose", ->
    steroids.modal.off "didclose", hideListener
    done()

fireAfterModalDidHideAndShow = (done) ->
  fireAfterModalDidShow ->
    fireAfterModalDidHide ->
      done()

describe "<super-modal-show> and <super-modal-hide>", ->
  @timeout 4000
  it "should show modal by clicking on element with route", (done) ->
    fireAfterModalDidHideAndShow done
    clickElement "super-modal-show-route"

  it "should show modal with an URL", (done) ->
    fireAfterModalDidHideAndShow done
    clickElement "super-modal-show-url"

  it "should show modal after changing element's location attribute", (done) ->
    fireAfterModalDidHideAndShow done
    elem = document.getElementById "super-modal-show-change-location"
    elem.setAttribute "location", "web-components#super-modal-hide"
    elem.click()

  it "should show modal with a custom touchstart action", (done) ->
    fireAfterModalDidHideAndShow done
    elem = document.getElementById "super-modal-show-touchstart"
    fireTouchEvent elem, "touchstart"

  it "should show modal with a view-id", (done) ->
    fireAfterModalDidHideAndShow ->
      supersonic.ui.views.stop("super-modal-hide").then ->
        done()

    supersonic.ui.view("web-components#super-modal-hide-preloaded").start("super-modal-hide").then ->
      clickElement "super-modal-show-id"
