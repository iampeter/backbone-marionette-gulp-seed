module.exports = class AppView extends Marionette.Layout
  template: require './templates/app'
  el: "#app"

  ui:
    notificationsOn: '#notifications-on'

  events:
    "click @ui.notificationsOn": 'notificationsOn'

  initialize: (options) ->
    @app = options.app

  notificationsOn: ->
    @app.submodules.Notification.start({ region: @app.getRegion('notificationRegion') })