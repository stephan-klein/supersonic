Promise = require 'bluebird'

module.exports = (logger) ->
  initialModuleElements = Promise.delay(0).then ->
    return unless window?.MutationObserver?

    attachOnNodeLoad = (node) ->
      node.onload = ->
        Promise.delay(100).then ->
          createObserverFor(node)
          resizeModuleElement(node)
          Promise.delay(500).then ->
            resizeModuleElement(node)

    observer = new MutationObserver (records) ->
      for record in records
        do (record) ->
          if typeof record.addedNodes is "object"
            for node in record.addedNodes when node.nodeName is "IFRAME"
              if node.hasAttribute("data-module")
                attachOnNodeLoad(node)

    observer.observe(document, {childList: true, subtree: true})

    do ->
      Array.prototype.slice.call(document.body.querySelectorAll("iframe[data-module]")).map attachOnNodeLoad

  observeModuleElementSize = (moduleElement) ->
    moduleElement.contentDocument.onreadystatechange = ->
      if (moduleElement.contentDocument.readyState == "complete")
        createObserverFor(moduleElement)

  createObserverFor = (moduleElement) ->
    moduleContentObserver = new moduleElement.contentWindow.MutationObserver ->
      resizeModuleElement(moduleElement)

    moduleContentObserver.observe(moduleElement.contentDocument.body, {childList: true, subtree: true})

  resizeModuleElement = (moduleElement) ->
    styleDeclaration = window.getComputedStyle(moduleElement.contentDocument.body, null)
    height = parseInt(styleDeclaration.getPropertyValue("padding-top")) + parseInt(styleDeclaration.getPropertyValue("padding-bottom"))
    height += child.offsetHeight for child in moduleElement.contentDocument.querySelectorAll("body > *")
    moduleElement.style.height = "#{height}px"

  return initialModuleElements
