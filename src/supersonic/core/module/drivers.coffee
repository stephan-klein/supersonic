module.exports = (steroids, superglobal) ->

  superglobal.ag ?= {}
  superglobal.ag.module ?= {}

  setCurrentDriver = (driver) ->
    superglobal.ag.module.driver = driver

  getCurrentDriver = ->
    superglobal.ag.module.driver

  {
    mpa: require('./drivers/mpa')(steroids)
    current:
      set: setCurrentDriver
      get: getCurrentDriver
  }
