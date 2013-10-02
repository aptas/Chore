Backbone = require('backbone')
View = require('views/View')

module.exports = class RoomsView extends View

    constructor: (model) ->
        super({
            el: '#roomsview'
            model: model
        })

        @$button = @$el.find('button')
        @$button.on('click', => 
            Backbone.trigger('show:users')
        )
        
    show: =>
        super()