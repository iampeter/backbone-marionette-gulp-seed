module.exports = class BaseModule extends Marionette.Module
  onStart: ->
    @mainView = new @MainView(vent: @app.vent, collection: @collection)
    @listenTo @mainView, 'stop:notification:module', @stop

    @region.show(@mainView)

  onStop: ->
    @region.close()
