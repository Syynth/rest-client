RestClientView = require './rest-client-view'

module.exports =
  restClientView: null

  activate: (state) ->
    @restClientView = new RestClientView(state.restClientViewState)
    atom.workspaceView.appendToRight(@restClientView)
    atom.workspaceView.command "rest-client:open", =>
      atom.workspaceView.appendToRight(@restClientView)

  deactivate: ->
    @restClientView.destroy()

  serialize: ->
    restClientViewState: @restClientView.serialize()
