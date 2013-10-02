Backbone = require('backbone')
View = require('views/View')
RoomView = require('views/RoomView')

module.exports = class RoomsView extends View

  constructor: (model) ->
    super({
      el: '#roomsview'
      model: model
    })
    
    @$list = @$el.find('ul')

    @listenTo(@model, 'add', @addOne)
    @listenTo(@model, 'reset', @allAll)
    @listenTo(@model, 'all', @render)

  addOne: (room) =>
    log("addOne", room)
    view = new RoomView(room)
    @$list.append(view.render().el)

  addAll: () =>
    # @model.each(@addOne, @)

  render: () =>
