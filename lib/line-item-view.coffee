{View, $, $$} = require 'atom'
_ = require 'underscore-plus'

module.exports =
class LineItemView extends View

  @content: ->
    @li =>
      @div {outlet: 'inputs', class: 'native-key-bindings'}, =>
        @input {type: 'text', placeholder: 'Name', outlet: 'name', tabindex: '1'}
        @input {type: 'text', placeholder: 'Value', class: 'right', outlet: 'value', tabindex: '2'}
      @div {outlet: 'preview', click: 'showEdit'}, =>
        @span {outlet: 'previewText'}, ' -- : -- '
        @span {class: 'delete-line-item right', click: 'destroy'}, 'X'

  initialize: (serializedState, parent) ->
    @parent = parent
    @preview.hide()
    window.debugLineItem = this
    @value.on 'keypress', (e) =>
      @hideEdit() if e.keyCode is 13
    @on 'focusout', =>
      _.defer =>
        if !@name.is(':focus') and !@value.is(':focus')
          @hideEdit()

  showEdit: ->
    @preview.hide()
    @inputs.show()

  hideEdit: ->
    @preview.show()
    @previewText.text "#{@name.val()}:#{@value.val()}"
    @inputs.hide()

  destroy: ->
    @parent.removeLineItem(this)

  serialize: ->
