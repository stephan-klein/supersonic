data = require 'ag-data'

module.exports = (logger, window, session, env) ->
  usersResourceBundle =
    options:
      baseUrl: env?.auth?.endpoint || ""
      headers:
        Authorization: session.getAccessToken() || ""
        steroidsApiKey: env?.data?.options?.headers?.steroidsApiKey || ""
        steroidsAppId: env?.data?.options?.headers?.steroidsAppId || ""
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
    userModel.find(session.getUserId())

  userModel
