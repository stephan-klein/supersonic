qs = require 'qs'

ROUTE_PATTERN = /^([^#?]+)?(#([^?]+))?(\?(.+))?$/
ROOT_PATH = "/modules"
DEFAULT_VIEW_NAME = "index"

module.exports = (logger, env, global) ->

  hasExplicitPathFor = (moduleName, viewName) ->
    env?.modules?.routes?[moduleName]?.views?[viewName]?.path?

  formatExplicitPath = do ->
    assertRequiredParamsExist = (moduleName, viewName, targetParams, params) ->
      for key, value of (targetParams ? {}) when value.required
        if !params?[key]?
          throw new Error "Missing required parameter '#{key}' for route to '#{moduleName}##{viewName}'"

    replaceTokensInPath = (path, params) ->
      remainingParams = {}
      for key, value of (params ? {})
        if path.match ":#{key}"
          path = path.replace (new RegExp ":#{key}", 'g'), encodeURIComponent value
        else
          remainingParams[key] = value

      [ path, remainingParams ]

    return (moduleName, viewName, params) ->
      target = env?.modules?.routes?[moduleName].views[viewName]

      assertRequiredParamsExist moduleName, viewName, target.params, params

      [ path, params ] = replaceTokensInPath target.path, params

      appendQueryParams path, params

  formatInModulePath = (viewName, queryParams) ->
    currentPath = global.location.href.replace(global.location.origin, "")
    baseUrl = currentPath.substring(0, currentPath.lastIndexOf("/") + 1)
    url = "#{baseUrl}#{viewName}.html"
    appendQueryParams url, queryParams

  return router = {
    interpret: (route) ->
      if !(typeof route is 'string')
        throw new Error "Route must be a string"

      parts = ROUTE_PATTERN.exec route

      if !parts?
        throw new Error "Did not recognize route format in: '#{route}'"

      [whole, moduleName, _, viewName, _, query] = parts

      query = qs.parse(query ? '')

      { moduleName, viewName, query }

    getPath: (route, params = {}) ->
      { path } = router.getMapping(route, params)
      path

    getMapping: (route, attributes = {}) ->
      { moduleName, viewName, query } = router.interpret route

      uid = switch
        when moduleName? and viewName?
          "#{moduleName}##{viewName}"
        when moduleName?
          moduleName
        when viewName?
          "##{viewName}"
        else
          "#"

      viewName ?= DEFAULT_VIEW_NAME

      attributes = merge(query, attributes)

      path = switch
        when !moduleName
          formatInModulePath viewName, attributes
        when hasExplicitPathFor moduleName, viewName
          formatExplicitPath moduleName, viewName, attributes
        else
          appendQueryParams (formatPath moduleName, viewName), attributes

      {
        path
        uid
        attributes
      }
  }

appendQueryParams = (path, queryParams) ->
  switch
    when !Object.keys(queryParams).length
      path
    when '?' in path
      "#{path}&#{qs.stringify queryParams}"
    else
      "#{path}?#{qs.stringify queryParams}"

formatPath = (moduleName, viewName) ->
  "#{ROOT_PATH}/#{moduleName}/#{viewName}.html"

merge = (left, right) ->
  result = {}
  for key, value of left
    result[key] = value
  for key, value of right
    result[key] = value
  result

