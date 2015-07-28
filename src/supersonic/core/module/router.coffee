qs = require 'qs'

module.exports = (logger) ->
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

  formatPath = (module, view, queryString) ->
    "#{ROOT_PATH}/#{module}/#{view}.html#{queryString}"

  getPath: (route, params = null) ->
    if !(typeof route is 'string')
      throw new Error "Route must be a string"

    parts = ROUTE_PATTERN.exec route

    if !parts?
      throw new Error "Did not recognize route format in: '#{route}'"

    [whole, module, _, view, query] = parts
    view ?= DEFAULT_VIEW_NAME
    queryString = formatQueryString query, params
    formatPath module, view, queryString
