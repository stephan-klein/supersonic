Promise = require 'bluebird'

module.exports = (logger) ->

  IFRAME_SELECTOR = "iframe[data-module]"

  ###
  Initial operations
  ###

  do ->
    document.addEventListener "DOMContentLoaded", ->
      observeDocumentForNewModules()
      findAll().map attachToOnLoad

  ###
  Private API functionalities
  ###

  observeDocumentForNewModules = ->
    return unless window?.MutationObserver?
    observer = new MutationObserver (records) ->
      for record in records
        do (record) ->
          if typeof record.addedNodes is "object"
            for node in record.addedNodes when node.nodeName is "IFRAME"
              if node.hasAttribute("data-module")
                attachToOnLoad(node)
    observer.observe(document, {childList: true, subtree: true})

  observeIframeContentSize = (element) ->
    observer = new element.contentWindow.MutationObserver ->
      resize(element)
    observer.observe(element.contentDocument.body, {childList: true, subtree: true})
    element

  attachToOnLoad = (element) ->
    element.onload = ->
      Promise.delay(100).then ->
        observeIframeContentSize(element)
        resize(element)
        Promise.delay(500).then ->
          resize(element)

  ###
  Public API functionalities
  ###

  findAll = (parent = null) ->
    unless parent then parent = document.body
    Array.prototype.slice.call(parent.querySelectorAll(IFRAME_SELECTOR))

  register = (element) ->
    observeIframeContentSize(element)
    resize(element)

  resize = (element) ->
    style = window.getComputedStyle(element.contentDocument.body, null)
    height = parseInt(style.getPropertyValue("padding-top")) + parseInt(style.getPropertyValue("padding-bottom"))
    height += child.offsetHeight for child in element.contentDocument.querySelectorAll("body > *")
    element.style.height = "#{height}px"
    element

  return {
    findAll
    register
    resize
  }