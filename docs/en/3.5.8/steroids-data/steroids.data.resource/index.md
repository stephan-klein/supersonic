# Cloud&nbsp;Resources

`steroids.data.resource` allows CRUD operations on data in the cloud.


## Functions

- `steroids.data.resource`

## Types

- `Resource`


# steroids.data.resource

Allows access to a resource defined in the cloud.

## Signature

- `resource(string resourceName) -> Resource`

The argument `resourceName` is a reference to a resource you've created and have access to.


# Resource

An object that provides methods for accessing items belonging to a specific cloud resource.

## Methods

- `resource.findAll`
- `resource.create`
- `resource.find`
- `resource.update`
- `resource.remove`


# resource.findAll

Find a collection of items belonging to this resource.

## Signature

- `findAll([query]) -> Promise(collection)`


# resource.create

Create a new item for this resource.

## Signature

- `create(data) -> Promise`


# resource.find

Find an item based on an `id`.

## Signature

- `find(id) -> Promise(data)`


# resource.update

Update the data on an existing item by its `id`.

## Signature

- `update(id, data) -> Promise`


# resource.remove

Remove an item by its `id`.

## Signature

- `remove(id) -> Promise`

