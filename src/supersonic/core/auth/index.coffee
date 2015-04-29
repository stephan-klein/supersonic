module.exports = (logger, window, data) ->
  users = require("./users")(logger, window, data.session)

  {
    session: data.session
    users
  }
