qs = require 'qs'

module.exports = (logger, env) ->
  EXPLICIT_ROUTE_TARGETS = env?.modules?.routes ? {}
  ROUTE_PATTERN = /^([\w\-]+)(#([\w\-\/]+))?(\?.+)?$/
  ROOT_PATH = "/components"
  DEFAULT_VIEW_NAME = "index"

  formatQueryString = (query, params) ->
    if query? and params?
      "#{query}&#{qs.stringify params}"
    else if params?
      "?#{qs.stringify params}"
    else
      query ? ''

  formatPath = (moduleName, viewName, queryString) ->
    "#{ROOT_PATH}/#{moduleName}/#{viewName}.html#{queryString}"

  hasExplicitPathFor = (moduleName, viewName) ->
    EXPLICIT_ROUTE_TARGETS[moduleName]?.views?[viewName]?.path?

  formatExplicitPath = (moduleName, viewName, query, params) ->
    EXPLICIT_ROUTE_TARGETS[moduleName].views[viewName].path

  getPath: (route, params = null) ->
    if !(typeof route is 'string')
      throw new Error "Route must be a string"

    parts = ROUTE_PATTERN.exec route

    if !parts?
      throw new Error "Did not recognize route format in: '#{route}'"

    [whole, moduleName, _, viewName, query] = parts
    viewName ?= DEFAULT_VIEW_NAME

    if hasExplicitPathFor moduleName, viewName
      formatExplicitPath moduleName, viewName, query, params
    else
      queryString = formatQueryString query, params
      formatPath moduleName, viewName, queryString
