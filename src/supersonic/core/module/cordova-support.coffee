Promise = require 'bluebird'
_ = require 'lodash'

#to fix the test on travis.. I which I don't have to do this.. so ugly
if !window?
  global.window = {}

inIframe = ->
  try
    window.self != window.top && window.parent?
  catch
    true

channelDownEvent = (type) ->
  window.parent.document.addEventListener type, ->
    event = window.document.createEvent 'Events'
    event.initEvent type, false, false
    window.document.dispatchEvent event

mapPlugins = (cordova) ->
  return unless cordova?
  plugins = cordova.require "cordova/plugin_list"

  cleanPropertyPath = _.curry (fn, path) ->
    if path?.indexOf("window.") == 0
      fn path.substring 7
    else
      fn path

  addPlugin = (pluginInstance, path) ->
    if _.isFunction pluginInstance
      _.set window, path, pluginInstance
    else
      if _.has window, path
        toMerge = _.get window, path
        _.merge toMerge, pluginInstance
      else
        _.set window, path, pluginInstance

  mapClobber = (plugin) ->
    if plugin.clobbers?.length > 0
      _.each plugin.clobbers, cleanPropertyPath (path) ->
        pluginInstance = cordova.require plugin.id
        addPlugin pluginInstance, path
    plugin

  mapMerge = (plugin) ->
    if plugin.merges?.length > 0
      _.each plugin.merges, cleanPropertyPath (path) ->
        pluginInstance = cordova.require plugin.id
        if path? && path == "window"
          _.merge window, pluginInstance
        else if path != ""
          addPlugin pluginInstance, path
    plugin

  mapPlugin = _.compose mapClobber, mapMerge

  _.each plugins, mapPlugin

mapGlobalCordova = ->
  return unless window.parent?.cordova?
  window.cordova = window.parent.cordova
  window.cordova

mapGlobalSteroids = ->
  window.steroids = window.parent.steroids

mapEvents = -> ['deviceready'].forEach channelDownEvent

init = ->
  return unless inIframe()
  _.compose(mapEvents, mapPlugins, mapGlobalCordova, mapGlobalSteroids)()

module.exports = {init}
