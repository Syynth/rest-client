{View, $$} = require 'atom'
LineItemView = require './line-item-view'

module.exports =
class PairedDataView extends View

  @content: ->
    @div {class: 'paired-data-view'}, =>
      @div {class: 'headers'}, =>
        @ul {outlet: 'list'}
      @button {click: 'addPair'}, '+'
      @button {click: 'removePair'}, '-'


  addPair: ->
    l = @list.find('li').length
    @list.append new LineItemView(null, this)

  removePair: ->
    @list.find('li').last()?.detach()

  removeLineItem: (view) ->
    view.detach()

  initialize: (serializeState) ->

  serialize: ->
