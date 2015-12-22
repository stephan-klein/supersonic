Promise = require 'bluebird'

module.exports = (env, session, loadResourceBundle) ->
  usersResourceBundle =
    options:
      baseUrl: env?.auth?.endpoint || ""
    resources:
      users:
        schema:
          identifier: "id"
          fields:
            id:
              type: "string"
              identity: true
            username:
              type: "string"
            metadata:
              type: "object"
            groups:
              type: "array"
            collection_permissions:
              type: "array"
            deleted:
              type: "boolean"
            password:
              type: "string"

  UserModel = loadResourceBundle(usersResourceBundle).createModel("users")

  UserModel.getCurrentUser = ->
    if userId = session.getUserId()
      UserModel.find(userId)
    else
      Promise.reject new Error "Cannot access current user without a valid session"

  UserModel
