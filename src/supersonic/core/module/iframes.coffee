Promise = require 'bluebird'
Bacon = require 'baconjs'

module.exports = (window) ->

  IFRAME_SELECTOR = "iframe[data-module]"
  IFRAME_USE_LOAD_INDICATOR_ATTR = "data-module-indicate-loading"
  IFRAME_NAME_ATTR = "data-module-name"
  LOAD_INDICATOR_TEMPLATE = """
    <div class="super-module__load-indicator">
      <i class="icon super-loading-c"></i>
      &nbsp;
      Loading
      <b bind-module-name></b>...
    </div>
  """

  ###
  Initial operations
  ###

  window.document.addEventListener "DOMContentLoaded", ->
    Promise.delay(0).then ->
      if window.document.body.querySelectorAll("[data-module-load-indicator-template]").length
        setLoadIndicatorTemplate(window.document.body.querySelectorAll("[data-module-load-indicator-template]")[0].innerHTML)
      observeDocumentForNewModules().subscribe attachToOnLoad
      findAll().map attachToOnLoad

  observeDocumentForNewModules = ->
    return Bacon.never() unless window?.MutationObserver?

    Bacon.fromBinder (sink) ->
      observer = new window?.MutationObserver (records) ->
        for record in records
          do (record) ->
            if typeof record.addedNodes is "object"
              for node in record.addedNodes when node.nodeName is "IFRAME"
                if node.hasAttribute("data-module")
                  sink node
      observer.observe(window.document, {childList: true, subtree: true})

  setLoadIndicatorTemplate = (templateString) ->
    LOAD_INDICATOR_TEMPLATE = templateString

  ###
  Private API functionalities
  ###

  attachToOnLoad = (element) ->
    return unless isValidFrame element

    if element.hasAttribute(IFRAME_USE_LOAD_INDICATOR_ATTR)
      showLoadIndicator(element)

    Bacon.fromPromise(waitForLoad element)
      .delay(100) # Why do we need to wait?
      .map(-> element)
      .takeWhile(isValidFrame)
      .doAction(hideLoadIndicator)
      .flatMap(iframeContentSizeChangeEvents)
      .takeWhile(isValidFrame)
      .subscribe(resize)

  # This will return false for an element removed from the DOM or otherwise inaccessible
  isValidFrame = (iframeElement) ->
    try
      iframeElement?.contentWindow?.document?
    catch e
      false

  waitForLoad = (element) ->
    ###
    We can't rely on any events from the iframe, because it's possible that we
    missed them or that they won't be sent. Therefore we check whether the
    iframe body is defined, which is something that should happen after
    DOMContentLoaded.

    The iframe element might also become invalid at any point, which we need to
    detect.
    ###
    new Promise (resolve, reject) ->
      interval = setInterval ->
        if !isValidFrame element
          clearInterval(interval)
          return reject new Error "Element is not an iframe, or it was removed"

        try
          document = element.contentWindow.document
          if document.body? and document.body.innerHTML
            clearInterval(interval)
            resolve()
        catch e
          clearInterval(interval)
          reject new Error "Unable to access iframe: #{e.message}"
      , 1

  iframeContentSizeChangeEvents = do ->
    contentDocumentBodyMutations = (element) ->
      Bacon.fromBinder((sink) ->
        # Note: the MutationObserver is from the _element's_ window
        observer = new element.contentWindow.MutationObserver ->
          sink element
        observer.observe(element.contentDocument.body, {childList: true, subtree: true})
      )

    addImageLoadEvents = (element) ->
      Bacon.once(element).merge iframeImageOnloadEvents element

    iframeImageOnloadEvents = (element) ->
      Bacon.fromArray(
        image for image in element.contentDocument.body.querySelectorAll("img") when !image.complete
      ).flatMap((image) ->
        Bacon.fromPromise new Promise (resolve) ->
          image.onload = resolve
      ).map(-> element)

    (element) ->
      return Bacon.never() unless isValidFrame element

      contentDocumentBodyMutations(element)
        .flatMap(addImageLoadEvents)
        .merge Bacon.later(500, element)

  ###
  Public API functionalities
  ###

  findAll = (parent = window.document.body) ->
    Array.prototype.slice.call(parent.querySelectorAll(IFRAME_SELECTOR))

  register = (element) ->
    return unless isValidFrame element

    attachToOnLoad(element)

  resize = do ->
    calculateFrameElementHeight = (element) ->
      style = window.getComputedStyle(element.contentDocument.body, null)
      height = parseInt(style.getPropertyValue("padding-top")) + parseInt(style.getPropertyValue("padding-bottom"))
      for child in element.contentDocument.querySelectorAll("body > *:not(script):not(link):not(style)")
        height += child.offsetHeight
      height

    setFrameElementHeight = (element, height) ->
      element.style.height = "#{height}px"

    (element) ->
      return element unless isValidFrame element

      height = calculateFrameElementHeight element
      setFrameElementHeight element, height

      element

  showLoadIndicator = do ->
    generateLoadIndicatorElement = (element) ->
      loadIndicatorElement = window.document.createElement("DIV")
      loadIndicatorElement.setAttribute("data-module-load-indicator", "")
      loadIndicatorElement.innerHTML = LOAD_INDICATOR_TEMPLATE
      for bindableElement in loadIndicatorElement.querySelectorAll("[bind-module-name]")
        bindableElement.innerHTML = element.getAttribute(IFRAME_NAME_ATTR)
      loadIndicatorElement

    (element) ->
      return unless isValidFrame element

      element.style.display = "none"
      element.parentNode.insertBefore(generateLoadIndicatorElement(element), element.nextSibling)

  hideLoadIndicator = (element) ->
    return element unless isValidFrame element

    if element.nextElementSibling?.hasAttribute("data-module-load-indicator")
      element.nextElementSibling.remove()
    element.style.display = "block"
    resize(element)

  return {
    findAll
    register
    resize
    showLoadIndicator
    hideLoadIndicator
  }
