Backbone = require('backbone')
DisplayManager = require('utils/DisplayManager')

View =  require('views/View')
MenuView =  require('views/MenuView')
RoomsView = require('views/RoomsView')
NewRoomView = require('views/NewRoomView')
HomeView = require('views/HomeView')
UsersView = require('views/UsersView')
AddView = require('views/AddView')
EditView = require('views/EditView')
DeleteView = require('views/DeleteView')

module.exports = class MainView extends Backbone.View

  constructor: (model, @controller) ->
    super({
      model: model
      el: '#mainview'
    })

    @menu = new MenuView()

    @views = []
    @displayManager = new DisplayManager()
    @model.on('change:state', @setView)

  onPageChange: (page, previous) =>
    @currentPage = page
    @displayManager.show(page)

  setView: (model, id) =>
    view = @views[id] || @viewFactory(id)
    @displayManager.show(id)

  viewFactory: (id, model = @model) ->
    switch id
      when 'state.room'
        @introView = view = new RoomsView(@model)
      when 'state.newroom'
        @newRoomView = view = new NewRoomView(@model)
      when 'state.home'
        @homeView = view = new HomeView(@model)
      when 'state.users'
        @usersView = view = new UsersView(@model.get('users'))
      when 'state.add'
        @addusersView = view = new AddView(@model)
      when 'state.edit'
        @editView = view = new EditView(@model)
      when 'state.delete'
        @deleteView = view = new DeleteView(@model)

    @displayManager.add(id, view)
    @views[id] = view
    return view
