window.js ?= {} # Create js namespace if it doesn't exist
class window.js.Support
  
  Support.isArray = Array.isArray || value ->
    {}.toString.call value is '[object Array]'
    
  Support.type = (value) ->
    if value isnt undefined and value isnt null
      type_ = Object::toString.call value
      type_ = type_.substring 8, type_.length - 1
      if (type_ is 'Number') and isNaN value then 'NaN' else type_
    else String value
    
  Support.merge = ->
    object = {}
    for object_ in arguments
      for key, value of object_
        object[key] = value if object_.hasOwnProperty key
    object

test = ->
  method = (none) -> 
    console.log "none          #{Support.type none}"
  method()
  console.log "null          #{Support.type null}"
  console.log "Number('a')   #{Support.type Number('a')}"
  console.log "1.23          #{Support.type 1.23}"
  console.log "true          #{Support.type true}"
  console.log "'ha'          #{Support.type 'ha'}"
  console.log "['ha']        #{Support.type ['ha']}"
  console.log "{ha:'ha'}     #{Support.type {ha:'ha'}}"
  console.log "Math          #{Support.type Math}"
  console.log "isArray       #{Support.type Support.isArray}"
  console.log "new Date()    #{Support.type(new Date())}"
  console.log "new Support() #{Support.type(new Support())}"
  console.log "/abc/         #{Support.type /abc/}"
#test()