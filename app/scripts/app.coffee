class App extends Backbone.Marionette.Application
  initialize: =>
    console.log 'Initializing app...'

    @on("initialize:after", (options) =>
      Backbone.history.start();
      Object.freeze? @
    )

    @addInitializer( (options) =>
      AppLayout = require './views/AppLayout'
      @layout = new AppLayout()
      @layout.render()
    )

    @start()

module.exports = new App()
