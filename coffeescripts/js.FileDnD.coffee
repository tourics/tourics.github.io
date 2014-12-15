# Implements Drag and Drop with HTML5 API
# Given an event handling callback, calls this callback when files are dropped onto a target DOM element.
# The callback receives the result of the drop action as a parameter:
# This parameter is an object that has one of the two following properties:
#   'files' property that contains the array of the dropped files, or
#   'message' property that contains the error message if the file names can't be retrieved
# Usage:
#   onDrop = (value) ->
#     if value.files
#       fileNames = value.files
#        use fileNames
#     else
#        handle error described in value.message
#   domElement = $('myTargetsSelector')
#   new JS.FileDnD(domElement, onDrop)
window.js ?= {} # Create js namespace if it doesn't exist
class window.js.FileDnD

  # Doesn't do anything. (static method)
  FileDnD.noOp = ->
  
  # Stops event from bubbling upwards through the widget hierarchy, 
  # i.e. the ancestor widgets (page DOM elements) will not be notified
  FileDnD.stopEventBubbling = (event) ->
    event.stopPropagation()
    event.preventDefault()
    
  # Calls 'onDragging' continuously while a file is being dragged within the browser window.
  # Calls 'onDrop' when the dragged file is dropped on top of 'target'.
  # Note: Assumes that browser implements HTML5 DnD API
  # Note: Doesn't support dragover event, yet
  constructor: (target, onDrop, onDragging) ->
    # make sure that onDragging() is available so that we don't need to check
    onDragging = FileDnD.noOp unless onDragging?
    target.on('dragenter', (event) ->
      FileDnD.stopEventBubbling event
      onDragging()
    ).on('dragover', (event) ->
      FileDnD.stopEventBubbling event
    ).on 'drop', (event) ->
      FileDnD.stopEventBubbling event
      # return event.originalEvent.dataTransfer.files if it's defined
      # otherwise call onDrop with error message
      originalEvent = event.originalEvent 
      if originalEvent?
        dataTransfer = originalEvent.dataTransfer
        if dataTransfer?
          # initiate reading of all files
          for file in dataTransfer.files
            do (file) -> js.File.readFile file, onDrop
        else onDrop {message: 'No dataTransfer'}
      else onDrop {message: 'No originalEvent'}
      null