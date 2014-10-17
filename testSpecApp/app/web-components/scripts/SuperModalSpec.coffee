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

describe "<super-modal-show>", ->
  @timeout 4000
  it "should show modal by clicking on element with route", (done) ->
    fireAfterModalDidShow ->
      fireAfterModalDidHide ->
       done()
    clickElement "super-show-modal-route"

  it "should show modal with an URL", (done) ->
    fireAfterModalDidShow ->
      fireAfterModalDidHide done
    clickElement "super-show-modal-url"
