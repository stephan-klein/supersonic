isFunction = require 'lodash/lang/isFunction'
set = require 'lodash/object/set'
has = require 'lodash/object/has'
get = require 'lodash/object/get'
merge = require 'lodash/object/merge'
compose = require 'lodash/function/compose'

#to fix the test on travis... where window does not exist
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

  cleanPropertyPath = (fn) -> (path) ->
    if path?.indexOf("window.") == 0
      fn path.substring 7
    else
      fn path

  addPlugin = (pluginInstance, path) ->
    if isFunction pluginInstance
      set window, path, pluginInstance
    else
      if has window, path
        toMerge = get window, path
        merge toMerge, pluginInstance
      else
        set window, path, pluginInstance

  mapClobber = (plugin) ->
    if plugin.clobbers?.length > 0
      plugin.clobbers.forEach cleanPropertyPath (path) ->
        pluginInstance = cordova.require plugin.id
        addPlugin pluginInstance, path
    plugin

  mapMerge = (plugin) ->
    if plugin.merges?.length > 0
      plugin.merges.forEach cleanPropertyPath (path) ->
        pluginInstance = cordova.require plugin.id
        if path? && path == "window"
          merge window, pluginInstance
        else if path != ""
          addPlugin pluginInstance, path
    plugin

  mapPlugin = compose mapClobber, mapMerge

  plugins.forEach mapPlugin

mapGlobalCordova = ->
  return unless window.parent?.cordova?
  window.cordova = window.parent.cordova
  window.cordova

mapGlobalSteroids = ->
  window.steroids = window.parent.steroids

mapEvents = -> ['deviceready'].forEach channelDownEvent

init = ->
  return unless inIframe()
  compose(mapEvents, mapPlugins, mapGlobalCordova, mapGlobalSteroids)()

module.exports = {init}
