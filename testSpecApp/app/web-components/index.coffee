expect = window.chai.expect
window.chai.should()

window.importsLoaded = new Promise (resolve) ->
  window.addEventListener "HTMLImportsLoaded", ->
    resolve()
