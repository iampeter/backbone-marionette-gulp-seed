module.exports = class BaseModule extends Marionette.Module
  onStart: ->
    @mainView = new @MainView(vent: @app.vent)
    @listenTo @mainView, 'stop:notification:module', @stop

    @region.show(@mainView)

  onStop: ->
    @region.close()
