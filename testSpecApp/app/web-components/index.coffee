expect = window.chai.expect
window.chai.should()

importsLoaded = new Promise (resolve) ->
  window.addEventListener "HTMLImportsLoaded", ->
    resolve()
