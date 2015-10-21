# http://stackoverflow.com/a/8809472
#TODO performance.now() instead of new Date.getTime();
# window.performance IS REMOVED IN iOS 8.1
module.exports = ->
  d = new Date().getTime()
  uuid = "xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx".replace(/[xy]/g, (c) ->
    r = (d + Math.random() * 16) % 16 | 0
    d = Math.floor(d / 16)
    ((if c is "x" then r else (r & 0x7 | 0x8))).toString 16
  )
  uuid
