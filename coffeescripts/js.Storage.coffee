###
Simplifies (a bit) access to HTML5 local and session storage.
Assumes that browser supports HTML5 Web Storage, doesn't provide for testing such support
In particular, allows:
   switching between local and session storage
   copying from one storage to another
   traversing all items
Also, makes coding a bit easier
   method calls can be chained
(Could be a jQuery plugin)
Copyright 2014 Jan Stelovsky, MIT license (use as you wish, don't complain:)
###
window.js ?= {} # Create js namespace if it doesn't exist
class window.js.Storage
  
  # preserves the current storage type; initially local
  @storage = localStorage
  @isLocal = true
  
  # Returns true iff the browser supports Web Storage API
  @isSupported = -> localStorage?
    
  # Switches to session storage; i.e. all subsequent operations will pertain to local storage
  @session = () ->
    Storage.storage = sessionStorage
    Storage.isLocal = false
    Storage
  
  # Switches to local storage; i.e. all subsequent operations will pertain to local storage
  @local = () ->
    Storage.storage = localStorage
    Storage.isLocal = true
    Storage
    
  # Returns the name of current storage, i.e. either 'local' or 'session'
  @type = () ->
    if Storage.isLocal then 'local' else 'session'
  
  # Returns the number of items in the current storage 
  @size = () ->
    Storage.storage.length
  
  # Returns the key/name of the 'index'-th item in the current storage 
  @key = (index) ->
    Storage.storage.key index
  
  # If there is 'data' stores/overwrites the 'key' item with 'data', 
  # otherwise returns the value of 'key' item in the current storage if there is one 
  #   or null if there is no 'key' item there
  @item = (key, data) ->
    if data?
      Storage.storage.setItem key, data
      Storage
    else
      Storage.storage.getItem key
     
  # Deletes the 'key' item from the current storage 
  @remove = (key) -> 
    Storage.storage.removeItem key
    Storage
   
  # Empties the current storage, i.e. deletes all items
  @clear = (key) ->
    Storage.storage.clear()
    Storage
  
  # Traverses all items in the storage calling 'action(key, value)' for each of them
  @traverse = (action) ->
    $.each [0...@storage.length], (i) ->
      key = Storage.storage.key i
      action key, Storage.item key
    Storage
      
  # Copies all items from the current storage to the other one so that the contents in both are the same
  @copy = () ->
    other = if Storage.storage is localStorage then sessionStorage else localStorage
    other.clear()
    Storage.traverse (key, value) => other.setItem key, value