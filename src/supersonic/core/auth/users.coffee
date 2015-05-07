data = require 'ag-data'
Promise = require 'bluebird'

module.exports = (logger, window, session, env) ->
  usersResourceBundle =
    options:
      baseUrl: env?.auth?.endpoint || ""
      headers:
        Authorization: session.getAccessToken() || ""
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

  resourceBundle = data.loadResourceBundle(usersResourceBundle)

  userModel = resourceBundle.createModel("users")

  userModel.getCurrentUser = ->
    if userId = session.getUserId()
      userModel.find(userId)
    else
      Promise.reject new Error "Cannot access current user without a valid session"

  userModel
