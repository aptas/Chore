Backbone = require('backbone')
UserModel = require('../models/UserModel')

module.exports = class Controller

  constructor: (@model) ->

    Backbone.on('show:rooms', @showRooms)
    Backbone.on('show:newroom', @showNewRoom)
    Backbone.on('show:home', @showHome)
    Backbone.on('show:users', @showUsers)
    Backbone.on('show:add', @showAdd)
    Backbone.on('show:edit', @showEdit)
    Backbone.on('show:delete', @showDelete)
    Backbone.on('do:add', @addUser)
    Backbone.on('do:edit', @editUser)
    Backbone.on('do:delete', @deleteUser)

  init: () =>
    @showRooms()

  showRooms: () =>
    log("Controller.showRooms")
    @model.set('state', 'state.room')

  showNewRoom: () =>
    log("Controller.showNewRoom")
    @model.set('state', 'state.newroom')

  showHome: () =>
    log("Controller.showHome")
    @model.set('state', 'state.home')

  showUsers: () =>
    log("Controller.showUsers")
    @model.set('state', 'state.users')

  showAdd: () =>
    log("Controller.showAdd")
    @model.set('state', 'state.add')

  addUser: (name, email) =>
    log("Controller.addUser", name, email)
    users = @model.get('users')
    users.add(new UserModel({name:name, email:email}))
    @showUsers()

  showEdit: (id) =>
    log("Controller.showEdit", id)
    @model.set('state', 'state.edit')
    @model.set('editing', id)

  editUser: (id, name, email) =>
    log("Controller.editUser",  id, name, email)
    users = @model.get('users')
    user = users.get(id)
    user.set('name', name)
    user.set('email', email)
    @showUsers()

  showDelete: (id) =>
    log("Controller.showDelete", id)
    @model.set('state', 'state.delete')
    @model.set('editing', id)

  deleteUser: () =>
    log("Controller.deleteUser")
    id = @model.get('editing')
    if id
      users = @model.get('users')
      user = users.get(id)
      if user?
        users.remove(user)
      @model.set('editing', undefined)
    @model.set('state', 'state.users')








