module.exports = class Todo extends Backbone.Model
  defaults:
    text: ''
    done: false
    active: false

  toggleActive: ->
    @collection.each (todo) =>
      unless todo is @
        todo.set 'active', false
      else
        @set 'active', !@get('active')
