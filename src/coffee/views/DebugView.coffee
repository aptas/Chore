Backbone = require('backbone')

module.exports = class DebugView extends Backbone.View

    constructor: (model) ->
        super({
            el: '#debugview'
            model: model
        })

        @visible = false
        @$intro = @$el.find('[name=intro]').click(-> Backbone.trigger('show:intro'))
        @$quiz = @$el.find('[name=users]').click(-> Backbone.trigger('show:users'))
        @$adduser = @$el.find('[name=adduser]').click(-> Backbone.trigger('show:adduser'))

        window.focus()
        $(window).keyup(@keyUpHandler)

    keyUpHandler: (event) =>
        if event.altKey
            log("DebugView.keyUpHandler", event)
            switch event.keyCode
                when 'S'.charCodeAt(0)    
                    @$el.toggle(0)