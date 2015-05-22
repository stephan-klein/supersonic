
Promise = require 'bluebird'

module.exports = enterpriseModule = (logger) ->

  initialModuleElements = Promise.delay(0).then ->
    moduleElements = document.querySelectorAll("iframe[data-module]")

    for element in moduleElements
      do (element) ->
        observeModuleElementSize(element)

        element.onload = ->
          resizeModuleElement(element)

    moduleElements

  observeModuleElementSize = (moduleElement) ->
    moduleElement.contentDocument.onreadystatechange = ->
      if (moduleElement.contentDocument.readyState == "complete")
        createObserverFor(moduleElement)


  createObserverFor = (moduleElement) ->
    moduleContentObserver = new MutationObserver ->
      resizeModuleElement(moduleElement)

    moduleContentObserver.observe(moduleElement.contentDocument.body, {childList: true, subtree: true})

  resizeModuleElement = (moduleElement) ->
    unit = "px"
    height = moduleElement.contentDocument.body.scrollHeight

    moduleElement.style.height = height+unit


  return { initialModuleElements }
