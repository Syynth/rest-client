{WorkspaceView} = require 'atom'
RestClient = require '../lib/rest-client'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "RestClient", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage('rest-client')

  describe "when the rest-client:open event is triggered", ->
    it "attaches the view", ->
      expect(atom.workspaceView.find('.rest-client')).toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.workspaceView.trigger 'rest-client:open'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.workspaceView.find('.rest-client')).toExist()
