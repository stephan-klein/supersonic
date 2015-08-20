querystring = require 'qs'

module.exports = (logger, global, superglobal) ->

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

  getSuperglobalUrlParamAttribute = makeUrlParamAttributeGetter superglobal
  getGlobalUrlParamAttribute = makeUrlParamAttributeGetter global

  getAttribute = (name, defaultValue = null) ->
    for get in [getModuleFrameAttribute, getGlobalUrlParamAttribute, getSuperglobalUrlParamAttribute]
      value = get name

      if value?
        return value

    defaultValue

  hasAttribute = (name) ->
    getModuleFrameAttribute(name)? || getGlobalUrlParamAttribute(name)? || getSuperglobalUrlParamAttribute(name)?

  return {
    get: getAttribute
    has: hasAttribute
  }
