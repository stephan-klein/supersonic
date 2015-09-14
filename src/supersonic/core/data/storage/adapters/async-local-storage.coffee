Promise = require 'bluebird'

module.exports = (window) ->
  localStorage = require('./sync-local-storage')(window)

  getItem: (key) -> Promise.resolve localStorage.getItem key
  setItem: (key, value) -> Promise.resolve localStorage.setItem key, value
  removeItem: (key) -> Promise.resolve localStorage.removeItem key
  keys: -> Promise.resolve Object.keys localStorage
