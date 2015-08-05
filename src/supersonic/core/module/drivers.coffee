module.exports = (steroids) ->

  currentDriver = null
  setCurrentDriver = (driver) ->
    currentDriver = driver
  getCurrentDriver = ->
    currentDriver

  {
    mpa: require('./drivers/mpa')(steroids)
    current:
      set: setCurrentDriver
      get: getCurrentDriver
  }
