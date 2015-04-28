module.exports = (logger, window) ->
  users = require("./users")(logger, window)

  { users }
