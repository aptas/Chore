Backbone = require('backbone')
View = require('views/View')

module.exports = class MenuView extends Backbone.View

  constructor: (model) ->
    super({
      el: '#menu'
      model: model
    })

    @$intro = @$el.find('[name=intro]')
    @$intro.on('click', => 
      Backbone.trigger('show:intro')
    )

    @$users = @$el.find('[name=users]')
    @$users.on('click', => 
      Backbone.trigger('show:users')
    )

    @$adduser = @$el.find('[name=add]')
    @$adduser.on('click', => 
      Backbone.trigger('show:add')
    )
    
  show: =>
    super() 