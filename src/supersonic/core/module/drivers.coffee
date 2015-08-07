module.exports = (steroids, superglobal, router) ->

  superglobal.ag ?= {}
  superglobal.ag.module ?= {}

  setCurrentDriver = (driver) ->
    superglobal.ag.module.driver = driver

  getCurrentDriver = ->
    superglobal.ag.module.driver

  {
    mpa: require('./drivers/mpa')(steroids, router)
    current:
      set: setCurrentDriver
      get: getCurrentDriver
  }
