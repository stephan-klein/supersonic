window.appgyver = {
  environment: {
    auth: {
      endpoint: "https://rest-auth.devgyver.com/api/v2"
    },
    data: {
      bundle: {
        "options": {
          "baseUrl": "https://rest-api.appgyver.com/v3/",
          "headers": {
            "steroidsApiKey": "71fcb87a3c5bea2982997080ebe5d329b1ff37e2f7884d8c4b2471301fc6bb40",
            "steroidsAppId": 52559
          }
        },
        "resources": {
          "SandboxTask": {
            "schema": {
              "fields": {
                "description": {
                  "type": "string"
                },
                "completed": {
                  "type": "boolean"
                },
                "id": {
                  "type": "string",
                  "identity": true
                }
              },
              "identifier": "id"
            }
          },
          "BuiltIOTask": {
            "schema": {
              "fields": {
                "updated_at": {
                  "type": "string"
                },
                "created_at": {
                  "type": "string"
                },
                "description": {
                  "type": "string"
                },
                "completed": {
                  "type": "boolean"
                },
                "ACL": {
                  "type": "object"
                },
                "tags": {
                  "type": "array"
                },
                "updated_by": {
                  "type": "string"
                },
                "created_by": {
                  "type": "string"
                },
                "app_user_object_uid": {
                  "type": "string"
                },
                "published": {
                  "type": "boolean"
                },
                "uid": {
                  "type": "string",
                  "identity": true
                },
                "_version": {
                  "type": "integer"
                }
              },
              "identifier": "uid"
            }
          },
          "SandboxFileResource": {
            "schema": {
              "fields": {
                "description": {
                  "type": "string"
                },
                "file": {
                  "type": "file"
                },
                "id": {
                  "type": "string",
                  "identity": true
                }
              },
              "identifier": "id"
            }
          }
        }
      }
    }
  }
};

window.localStorage.setItem("__ag:data:session", JSON.stringify({
  access_token: "264b9bf21e62dfbf09533b44293c0d58",
  user_details: {
    id: 981
  }
}));
