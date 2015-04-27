module.exports = (logger, createStoredProperty) ->
  sessionStorage = createStoredProperty "__ag:data:session"

