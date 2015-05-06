module.exports = (logger, window, data, env) ->
  users = require("./users")(logger, window, data.session, env)

  {
    session: data.session
    users
  }
