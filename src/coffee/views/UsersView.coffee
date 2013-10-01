Backbone = require('backbone')
View = require('views/View')
UserView = require('views/UserView')

module.exports = class UsersView extends View

  constructor: (model) ->
    super({
      el: '#usersview'
      model: model
    })
    
    @$list = @$el.find('ul')

    @listenTo(@model, 'add', @addOne)
    @listenTo(@model, 'reset', @allAll)
    @listenTo(@model, 'all', @render)

  addOne: (user) =>
    log("addOne", user)
    view = new UserView(user)
    @$list.append(view.render().el)

  addAll: () =>
    # @model.each(@addOne, @)

  render: () =>
