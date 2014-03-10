ToggleableRegion = require './regions/ToggleableRegion'
AppView = require './views/AppView'
TodoModule = require('./modules/todo/TodoModule')
NotificationModule = require('./modules/notification/NotificationModule')

class App extends Backbone.Marionette.Application
  initialize: =>
    console.log 'Initializing app...'

    @addInitializer( (options) =>
      (new AppView(app: @)).render()
    )

    @addInitializer( (options) =>
      @addRegions({ 
        notificationRegion: { 
          selector: "#notifications"
          regionType: ToggleableRegion
          module: @submodules.Notification
        }
        todoRegion: { 
          selector: "#todos"
          regionType: ToggleableRegion
          module: @submodules.Todo
        }
      })
    )

    @module('Notification', NotificationModule)
    @module('Todo', TodoModule)

    @start()

module.exports = new App()
