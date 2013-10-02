require('dom.ready')

Model = require('models/Model')
Controller = require('controllers/Controller')
MainView = require('views/MainView')
DebugView = require('views/DebugView')

module.exports = class Application

  constructor: (@config = {}) ->

    window.log = () => 
      if @debug then console.log(arguments)

    @model = new Model(@config.model, @config.options)
    @controller = new Controller(@model)
    @mainView = new MainView(@model, @controller)

    host = window.location.host
    if host.indexOf('apt-domain.as') isnt -1 or host.indexOf('localhost') isnt -1
      @debug = new DebugView(@model)

    @controller.init()