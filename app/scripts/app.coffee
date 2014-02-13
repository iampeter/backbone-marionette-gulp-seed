class App extends Backbone.Marionette.Application
  initialize: =>
    console.log 'Initializing app...'

    @on("initialize:after", (options) =>
      Backbone.history.start();
      Object.freeze? @
    )

    @addInitializer( (options) =>
      AppView = require './views/AppView'
      @layout = new AppView()
      @layout.render()
    )

    @start()

module.exports = new App()
