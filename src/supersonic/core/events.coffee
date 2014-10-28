Promise = require 'bluebird'

module.exports =
  deviceready: if document?
      new Promise (resolve) ->
        document.addEventListener 'deviceready', resolve
    else
      Promise.resolve()
