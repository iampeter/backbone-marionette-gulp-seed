Marionette.Behaviors.behaviorsLookup = ->
  window.Behaviors

window.Behaviors = {}
window.Behaviors.Closeable = require './behaviors/Closeable'

ToggleableRegion = require './regions/ToggleableRegion'
AppView = require './views/AppView'
TodoModule = require('./modules/todo/TodoModule')
NotificationModule = require('./modules/notification/NotificationModule')

class App extends Backbone.Marionette.Application
  initialize: =>
    console.log 'Initializing app...'

    @router = new Backbone.Marionette.AppRouter()

    @addInitializer( (options) =>
      (new AppView()).render()
    )

    @addInitializer( (options) =>
      @addRegions({ 
        notificationRegion: { 
          selector: "#notifications"
          regionClass: ToggleableRegion
          module: @submodules.Notification
        }
        todoRegion: { 
          selector: "#todos"
          regionClass: ToggleableRegion
          module: @submodules.Todo
        }
      })
    )

    @addInitializer( (options) =>
      Backbone.history.start()
    )

    @module('Notification', NotificationModule)
    @module('Todo', TodoModule)

    @start()

module.exports = new App()
