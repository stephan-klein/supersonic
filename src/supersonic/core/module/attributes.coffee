querystring = require 'qs'

module.exports = (logger, global, superglobal) ->

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
