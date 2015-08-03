qs = require 'qs'

module.exports = (logger, env) ->
  ROUTE_PATTERN = /^([^#?]+)(#([^?]+))?(\?(.+))?$/
  ROOT_PATH = "/modules"
  DEFAULT_VIEW_NAME = "index"

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

  hasExplicitPathFor = (moduleName, viewName) ->
    env?.modules?.routes?[moduleName]?.views?[viewName]?.path?

  formatExplicitPath = do ->
    assertRequiredParamsExist = (targetParams, params) ->
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

      assertRequiredParamsExist target.params, params

      [ path, params ] = replaceTokensInPath target.path, params

      appendQueryParams path, params

  mergeQueryParams = (query, params) ->
    queryParams = {}
    for key, value of params
      queryParams[key] = value
    for key, value of qs.parse query
      queryParams[key] = value
    queryParams

  getPath: (route, params = {}) ->
    if !(typeof route is 'string')
      throw new Error "Route must be a string"

    parts = ROUTE_PATTERN.exec route

    if !parts?
      throw new Error "Did not recognize route format in: '#{route}'"

    [whole, moduleName, _, viewName, _, query] = parts
    viewName ?= DEFAULT_VIEW_NAME
    query ?= ''

    queryParams = mergeQueryParams query, params

    if hasExplicitPathFor moduleName, viewName
      formatExplicitPath moduleName, viewName, queryParams
    else
      appendQueryParams (formatPath moduleName, viewName), queryParams
