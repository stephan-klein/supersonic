---
layout: "docs_api"
title: Supersonic API reference
header_sub_title: ContactError object
section_id: cordova
subsection_id: contacts
method_id: contacterror
---
# ContactError

The `ContactError` object is returned to the user through the
`contactError` callback function when an error occurs.

## Properties

- __code__: One of the predefined error codes listed below.

## Constants

- `ContactError.UNKNOWN_ERROR` (code 0)
- `ContactError.INVALID_ARGUMENT_ERROR` (code 1)
- `ContactError.TIMEOUT_ERROR` (code 2)
- `ContactError.PENDING_OPERATION_ERROR` (code 3)
- `ContactError.IO_ERROR` (code 4)
- `ContactError.NOT_SUPPORTED_ERROR` (code 5)
- `ContactError.PERMISSION_DENIED_ERROR` (code 20)
