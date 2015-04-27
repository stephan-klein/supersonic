
module.exports = (logger, createStoredProperty) ->
  sessionStorage = createStoredProperty "__ag:data:session"

  {
    set: (v) -> sessionStorage.set(v)
    get: (v) -> sessionStorage.get()
    unset: -> sessionStorage.unset()
    values: sessionStorage.values
  }
