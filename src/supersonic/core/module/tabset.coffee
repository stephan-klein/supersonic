debug = require('debug')('supersonic:module:iframes')

###
EXAMPLE HTML MARKUP

<div class="module-tabset">

  <div class="module-tabset__tab-bar">
    <ul>
      <!-- This is a single tab -->
      <li>
        <a href="">Tasks</a>
      </li>
    </ul>
    <div class="module-tabset__tab-bar__fader-left"></div>
    <div class="module-tabset__tab-bar__fader-right"></div>
  </div>

  <div class="module-tabset__content">
    <!-- This is a single tab pane -->
    <div class="module-tabset__pane">
      <iframe
        data-module
        data-module-indicate-loading
        data-module-name="Tasks"
        data-date-format="MMMM Do YYYY, h:mm:ss a"
        src="/components/supersonic-base-module/index.html"></iframe>
    </div>
  </div>

</div>
###

module.exports = (window) ->

  SELECTOR_TABS = ".module-tabset__tab-bar a"
  SELECTOR_TAB_PANES = ".module-tabset__pane"

  resizeModulesInTabPane = (paneElem) ->
    for moduleElem in paneElem.querySelectorAll "iframe[data-module]"
      supersonic.module.iframes.resize moduleElem

  attachToTabset = (tabsetElem) ->
    # Element containers
    tabsContainer = tabsetElem.querySelectorAll(".module-tabset__tab-bar ul")[0]
    panesContainer = tabsetElem.querySelectorAll(".module-tabset__content")[0]
    # Tab content padding
    if tabsetElem.querySelectorAll(SELECTOR_TABS).length <= 1
      tabsContainer.style.display = "none"
      panesContainer.style.paddingTop = "0px"
    else
      panesContainer.style.paddingTop = tabsContainer.parentElement.offsetHeight + "px"

    # Pane activator
    activateTab = (tabIdx) ->
      # Set active tab
      for tabElem, idx in tabsetElem.querySelectorAll(SELECTOR_TABS)
        if idx is tabIdx
          tabElem.parentNode.classList.add "active"
        else
          tabElem.parentNode.classList.remove "active"
      # Set active pane
      for paneElem, idx in tabsetElem.querySelectorAll(SELECTOR_TAB_PANES)
        if idx is tabIdx
          paneElem.classList.add "active"
          resizeModulesInTabPane paneElem
        else
          paneElem.classList.remove "active"

    # Activte first tab
    activateTab(0)

    # Attach tabs
    for tabLinkElem, tabIdx in tabsetElem.querySelectorAll(SELECTOR_TABS)

      # click
      tabLinkElem.addEventListener "click", (e) ->
        e.preventDefault()
        e.stopPropagation()
      , false

      ###
      ###
      do (elem = tabLinkElem.parentNode, tabIdx) ->
        treshold = 5
        startX = null
        startY = null
        lastX = null
        lastY = null

        # touch start
        elem.addEventListener "touchstart", (e) ->
          startX = e.pageX
          startY = e.pageY
          lastX = e.pageX
          lastY = e.pageY
        , false

        # touch move
        elem.addEventListener "touchmove", (e) ->
          lastX = e.pageX
          lastY = e.pageY
        , false

        # touch end
        elem.addEventListener "touchend", ->
          if Math.abs(startX - lastX) < treshold and Math.abs(startY - lastY) < treshold
            activateTab tabIdx
        , false

  do ->
    window.document.addEventListener "DOMContentLoaded", ->
      for tabsetElem in window.document.body.querySelectorAll(".module-tabset")
        attachToTabset tabsetElem

  return {}