data = require 'ag-data'

module.exports = (logger, window) ->
  usersResourceBundle =
    options:
      baseUrl: "???"
      headers:
        "Authorization": "????"
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

  return resourceBundle.createModel("users")
