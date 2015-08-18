querystring = require 'qs'

module.exports = (logger, global, superglobal) ->

  getModuleFrameAttribute = (name) ->
    global?.frameElement?.getAttribute? "data-#{name}"

  getUrlParamAttribute = do ->
    getHrefParamsString = ->
      href = superglobal?.location.href || ""
      href.slice(href.indexOf('?') + 1)

    getParentLocationHrefParams = ->
      querystring.parse getHrefParamsString()

    params = null
    (name) ->
      params = getParentLocationHrefParams() unless params?
      params[name]


  getAttribute = (name, defaultValue = null) ->
    for get in [getModuleFrameAttribute, getUrlParamAttribute]
      value = get name

      if value?
        return value

    defaultValue

  hasAttribute = (name) ->
    getModuleFrameAttribute(name)? || getUrlParamAttribute(name)?

  return {
    get: getAttribute
    has: hasAttribute
  }
