module.exports = (steroids, superglobal, global) ->
  superglobal.ag ?= {}
  superglobal.ag.module ?= {}

  global.ag ?= {}
  global.ag.module ?= {}

  setCurrentDriver = (driver) ->
    superglobal.ag.module.driver = driver
    global.ag.module.driver = driver

  getCurrentDriver = ->
    superglobal.ag.module.driver ? global.ag.module.driver

  {
    mpa: require('./drivers/mpa')(steroids)
    current:
      set: setCurrentDriver
      get: getCurrentDriver
  }
