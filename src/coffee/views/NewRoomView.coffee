Backbone = require('backbone')
View = require('views/View')

module.exports = class NewRoomView extends View

    constructor: (model) ->
        super({
            el: '#newroomview'
            model: model
        })

        @$button = @$el.find('button')
        @$button.on('click', => 
            Backbone.trigger('show:users')
        )
        
    show: =>
        super()