$ ->
  dom = {}
  ids = ['home', 'news', 'syllabus', 
    'remember', 'recall', 'open', 'save', 'undo', 'redo', 'cut', 'copy', 'paste',
    'text', 'image', 'upload', 'upload_data',
    'drop', 'drop_row', 'drop_text', 'drop_text_row', 
    'drop_image', 'drop_image_row', 'drop_binary', 'drop_binary_row']
  dom[id] = $ "##{id}" for id in ids
  staged = {}
  noDnD = (event) ->
    event.preventDefault()
    false
  $(document.body).on('dragover', noDnD).on('drop', noDnD)
  dom.dropped = $ '.dropped'
  dom.dropped.hide()
  #for id, element of dom
    #unless id is 'upload'
     #element.click -> alert "#{$(@).prop 'id'} clicked"
  dom.open.on "click", ->
    onRead = (file, content) ->
      if js.File.isTextType file.type
        dom.text.text content
      else if js.File.isWebImageType file.type
        dom.image.attr {src:content}
    js.File.read onRead
  dom.save.click ->
    js.File.write 'page_text.txt', dom.text.text()
    content = dom.image.attr 'src'
    for type in ['png', 'jpeg']
      if new RegExp("^data:image\/#{type};base64").test content
        js.File.write 'page_image.text', content
  dom.upload.click ->
    dom.dropped.hide()
    dom.drop_row.show()
  dom.upload_data.click ->
    if staged.type is 'text'
      dom.text.text staged.content
    else if staged.type is 'image'
      dom.image.attr {src:staged.content}
  onDrop = (file, content) =>
    dom.drop_row.hide()
    staged.content = content
    if js.File.isTextType file.type
      staged.type = 'text'
      dom.drop_text_row.show()
      dom.drop_text.val content
    else if js.File.isWebImageType file.type
      staged.type = 'image'
      dom.drop_image_row.show()
      dom.drop_image.attr {src:content}
    else
      staged.type = 'binary'
      dom.drop_binary_row.show()
      dom.drop_binary.val content
      
  new js.FileDnD(dom.drop, onDrop)
  #dom.upload.trigger 'click'
  null
  
  
###
  cd "Users/vin/Desktop/course_page/"
  coffee -cwo javascripts/ coffeescripts/
###

