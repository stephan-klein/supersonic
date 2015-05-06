module.exports = createLocalStorage = ->
  storage = {}

  getItem: (key) ->
    storage[key]

  setItem: (key, value) ->
    storage[key] = value

  removeItem: (key) ->
    delete storage[key]
