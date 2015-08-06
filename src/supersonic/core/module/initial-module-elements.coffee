Promise = require 'bluebird'

module.exports = (logger) ->
  initialModuleElements = Promise.delay(0).then ->
    observer = new MutationObserver (records)->
      for record in records
        do (record)->
          if typeof record.addedNodes is "object"
            for node in record.addedNodes when node.nodeName is "IFRAME"
              if node.hasAttribute("data-module")
                observeModuleElementSize(node)

                node.onload = ->
                  Promise.delay(100).then ->
                    resizeModuleElement(node)

    observer.observe(document, {childList: true, subtree: true})

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

  return initialModuleElements
