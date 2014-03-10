module.exports = class MainView extends Backbone.Marionette.ItemView
  template: require './templates/main'

  ui:
    close: 'button.close'

  triggers:
    'click @ui.close': 'stop:notification:module'

  initialize: (options) ->
    @action = 'Notification module started. Try working with the todos now...'
    @vent = options.vent
    @vent.on 'new:notification', @newNotificaction, @

  newNotificaction: (action) ->
    @action = action
    @render()

  serializeData: ->
    { action: @action }
