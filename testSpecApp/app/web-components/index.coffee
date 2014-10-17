expect = window.chai.expect
window.chai.should()

importsLoaded = new Promise (resolve) ->
  window.addEventListener "HTMLImportsLoaded", ->
    resolve()

clickElement = (id)->
  element = document.getElementById id
  element.click()
