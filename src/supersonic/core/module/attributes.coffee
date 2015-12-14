debug = require('debug')('supersonic:module:attributes')

querystring = require 'qs'

module.exports = (logger, global) ->
  superglobal = discoverSuperglobalAttributeScope global

  debug "Picked module attribute discovery locations:", {
    moduleFrameAttributes: global?.frameElement
    globalUrlParams: global
    superglobalUrlParams: superglobal
  }

  forcedAttributes = {}
  getForcedAttribute = (name) ->
    forcedAttributes[name]
  setForcedAttribute = (name, value) ->
    if value?
      forcedAttributes[name] = value
    else
      delete forcedAttributes[name]

  getModuleFrameAttribute = (name) ->
    global?.frameElement?.getAttribute? "data-#{name}"

  makeUrlParamAttributeGetter = (context) ->
    getHrefParamsString = ->
      href = context?.location.href || ""
      href.slice(href.indexOf('?') + 1)

    getLocationHrefParams = ->
      querystring.parse getHrefParamsString()

    params = null
    (name) ->
      params = getLocationHrefParams() unless params?
      params[name]

  getGlobalUrlParamAttribute = makeUrlParamAttributeGetter global
  getSuperglobalUrlParamAttribute = makeUrlParamAttributeGetter superglobal

  getters = [
    getForcedAttribute
    getModuleFrameAttribute
    getGlobalUrlParamAttribute
    getSuperglobalUrlParamAttribute
  ]

  getAttribute = (name, defaultValue = null) ->
    for get in getters
      value = get name

      if value?
        return value

    defaultValue

  hasAttribute = (name) ->
    for get in getters
      return true if get(name)?
    return false

  return {
    get: getAttribute
    has: hasAttribute
    set: setForcedAttribute
  }

discoverSuperglobalAttributeScope = (global) ->
  candidate = global

  # Find the topmost frame with supersonic
  loop
    # KLUDGE: Break if we encounter an iframe with 'ag-isolate-scope' in the query string
    # See: ./modal.coffee
    if isIsolatedIframe candidate
      break

    if !candidate.parent?
      break
    if candidate.parent is candidate
      break
    if !candidate.parent.supersonic?
      break

    candidate = candidate.parent

  candidate

isIsolatedIframe = (candidate) ->
  frameSrc = candidate.frameElement?.attributes?.getNamedItem('src')?.textContent || ''
  frameSrc.indexOf('ag-isolate-scope') isnt -1
