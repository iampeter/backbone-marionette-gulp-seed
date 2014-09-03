module.exports = class BaseModule extends Marionette.Module
  onStart: ->
    @mainView = new @MainView(collection: @collection)
    @region.show(@mainView)
