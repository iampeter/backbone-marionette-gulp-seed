Todo = require('../models/Todo')

module.exports = class Todos extends Backbone.Collection
  model: Todo

