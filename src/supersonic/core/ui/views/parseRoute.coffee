module.exports = (location, options={}) ->
  routePattern = /^([\w\-]+)#([\w\-\/]+)(\?.+)?$/
  parts = routePattern.exec location
  if parts?
    [whole, module, view, query] = parts
    path = "app/#{module}/#{view}.html#{query || ''}"
    path = "#{options.prefix}#{path}" if options.prefix?
    path
  else
    location
