Backbone = require('backbone')
View = require('views/View')

module.exports = class HomeView extends View

    constructor: (model) ->
        super({
            el: '#homeview'
            model: model
        })

        @$button = @$el.find('button')
        @$button.on('click', => 
            Backbone.trigger('show:users')
        )
        
    show: =>
        super()