module.exports = class MainView extends Backbone.Marionette.ItemView
  template: require './templates/main'

  behaviors:
    Closeable: {}

  initialize: (options) ->
    @action = 'Notification module started. Try working with the todos now...'
    App.vent.on 'new:notification', @newNotificaction, @

  newNotificaction: (action) ->
    @action = action
    @render()

  serializeData: ->
    { action: @action }

  onDestroy: ->
    App.vent.off 'new:notification', @newNotificaction, @
