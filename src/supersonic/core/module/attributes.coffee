debug = require('debug')('supersonic:module:attributes')

querystring = require 'qs'

module.exports = (logger, global) ->
  superglobal = discoverSuperglobalAttributeScope global

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

  globalQueryParamAttributes = makeQueryParamAttributeGetter(getModuleSrc(global) || global.location.href)
  superglobalQueryParamAttribute = makeQueryParamAttributeGetter(getModuleSrc(superglobal) || superglobal.location.href)

  debug "Picked module attribute discovery locations:", {
    context: { global, superglobal }
    moduleFrameAttributes: global?.frameElement?.attributes
    globalQueryParams: globalQueryParamAttributes.src
    superglobalQueryParams: superglobalQueryParamAttribute.src
  }

  getters = [
    getForcedAttribute
    getModuleFrameAttribute
    globalQueryParamAttributes.get
    superglobalQueryParamAttribute.get
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
  frameSrc = getModuleSrc(candidate) || ''
  frameSrc.indexOf('ag-isolate-scope') isnt -1

getModuleSrc = (global) ->
  global.frameElement?.attributes?.getNamedItem('src')?.textContent

makeQueryParamAttributeGetter = (src) ->
  src ||= ""

  parseQueryStringParams = ->
    queryParamString = src.slice(src.indexOf('?') + 1) || ""
    querystring.parse queryParamString

  params = null

  return {
    src: src
    get: (name) ->
      params ?= parseQueryStringParams()
      params[name]
  }
