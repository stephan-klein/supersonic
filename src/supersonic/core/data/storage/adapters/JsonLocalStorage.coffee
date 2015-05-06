class JsonLocalStorage

  constructor: (window) ->
    @window = window

  getItem: (key) ->
    value = @window.localStorage.getItem key
    if value?
      JSON.parse value
    else
      null

  setItem: (key, value) ->
    @window.localStorage.setItem key, JSON.stringify(value)

  removeItem: (key) ->
    @window.localStorage.removeItem key

module.exports = JsonLocalStorage
