
module.exports = (window) ->
  getItem: (key) ->
    value = window.localStorage.getItem key

    return null unless value?

    try
      JSON.parse value
    catch e
      null

  setItem: (key, value) ->
    window.localStorage.setItem key, JSON.stringify(value)

  removeItem: (key) ->
    window.localStorage.removeItem key
