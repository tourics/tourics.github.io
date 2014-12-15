###
Implements reading and writing of data to local files using HTML5.
Provides limited support of mime types.
Binary files are read and written in binary64 format.
Warning: Some MIME types that are assumed to be binary may be actually be textual.
Text files are read or written unchanged, i.e. there is no conversion
in between the standards where lines are separated by CR-character-only
(ASCII 13=0x0D=\r) or by CR and LF (ASCII 10=0x0D=\n).
Note: While CR-LF is Windows standard, CR-only is on most other platforms.
Note: Use content.replace(/\n/g,'\r\n') to convert to Windows standard.
Note: Reading is asynchronous, i.e. clients need to provide a callback that consumes data once it's read(y)
Useable only if browser supports HTML5 File APIs, provides for testing such support.
Assumes that jQuery is/will be loaded
(Could be a jQuery plugin)
(Could be a promise/deferred)
(Could be extended to support writing and reading files by dragging them from and to an area on a page)
Copyright 2014 Jan Stelovsky, MIT license (use as you wish, don't complain:)
###
window.js ?= {} # Create js namespace if it doesn't exist
class window.js.File
  
  # mime types for common file extensions
  File.extensions = 
    text:
      txt:    'text/plain'
      html:   'text/html'
      htm:    'text/html'
      css:    'text/css'
      coffee: 'text/coffee'
      js:     'application/javascript'
      json:   'application/json'
      xml:    'application/xml'
      dtd:    'application/xml-dtd'
      sh:     'application/x-sh'
      axs:    'application/olescript'
      tcl:    'application/x-tcl'
      src:    'application/x-wais-source'
      c:      'text/plain'
      h:      'text/plain'
      csh:    'application/x-csh'
    webImage:
      png:    'image/png'
      jpeg:   'image/jpeg'
      jpg:    'image/jpeg'
    MyImage:
      imagefile: 'image/imagefile'
    binary:
      svg:    'image/svg+xml'
      bmp:    'image/bmp'
      ico:    'image/x-icon'
      rgb:    'image/x-rgb'
      tif:    'image/tiff'
      tiff:   'image/tiff'
      snd:    'audio/basic'
      wav:    'audio/x-wav'
      au:     'audio/basic'
      aif:    'audio/x-aiff'
      aifc:   'audio/x-aiff'
      aiff:   'audio/x-aiff'
      rmi:    'audio/mid'
      ra:     'audio/x-pn-realaudio'
      ram:    'audio/x-pn-realaudio'
      mp3:    'audio/mpeg'
      mpeg:   'video/mpeg'
      mpg:    'video/mpeg'
      mp2:    'video/mpeg'
      mpv2:   'video/mpeg'
      mpa:    'video/mpeg'
      mpe:    'video/mpeg'
      mov:    'video/quicktime'
      qt:     'video/quicktime'
      asf:    'video/x-ms-asf'
      asr:    'video/x-ms-asf'
      asx:    'video/x-ms-asf'
      avi:    'video/x-msvideo'
      movie:  'video/x-sgi-movie'
      bin:    'application/octet-stream'
      class:  'application/octet-stream'
      exe:    'application/octet-stream'
      dll:    'application/x-msdownload'
      crt:    'application/x-x509-ca-cert'
      cer:    'application/x-x509-ca-cert'
      hqx:    'application/mac-binhex40'
      doc:    'application/msword'
      docx:   'application/vnd.openxmlformats-officedocument.wordprocessingml.document'
      rtf:    'application/rtf'
      xls:    'application/vnd.ms-excel'
      xlsx:   'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
      pps:    'application/vnd.ms-powerpoint'
      ppsx:   'application/vnd.openxmlformats-officedocument.presentationml.slideshow'
      ppt:    'application/vnd.ms-powerpoint'
      pptx:   'application/vnd.openxmlformats-officedocument.presentationml.presentation'
      mdb:    'application/x-msaccess'
      swf:    'application/x-shockwave-flash'
      tar:    'application/x-tar'
      tex:    'application/x-tex'
      latex:  'application/x-latex'
      pdf:    'application/pdf'
      ai:     'application/postscript'
      eps:    'application/postscript'
      ps:     'application/postscript'
      sit:    'application/x-stuffit'
      z:      'application/x-compress'
      tgz:    'application/x-compressed'
      z:      'application/x-compress'
      zip:    'application/zip'
      gtar:   'application/x-gtar'
      gz:     'application/x-gzip'
  File.types = {}
  # default mime type, will need to changed once binary files are supported
  File.defaultType = 'text/plain' # 'application/octet-stream'
  # stores needed DOM page elements so that we don't ask jQuery all the time
  File.dom = {}
  # file extension of binary64 files
  binary64Extension ='b64' 
  
  # Once DOM is ready initializes the DOM and initiates loading full suite of mime types
  $ ->
    # initialize mime types and concatenate all extensions
    File.types = {}
    allExtensions = {}
    for key, values of File.extensions
      types = {}
      for extension, type of values
        types[type] = type
      allExtensions = js.Support.merge allExtensions, values
      File.types[key] = types
    File.extensions.all = allExtensions
    # establish API support
    File.dom.body = $ 'body'
    File.supported = []
    File.unsupported = []
    for api in ['File', 'FileReader', 'FileList', 'Blob', 'URL']
      if window[api]? then File.supported.push api else File.unsupported.push api
    File

  # Returns message telling which of the various File API are supported by the browser
  File.support = ->
    # Makes human-readable text from JSON's stringified array
    list = (names) -> (JSON.stringify names).replace(/\[(.*)\]/, '$1').replace(/"/g, "'").replace(/,/g, ", ").replace /(.*),/, '$1 and'
    # return pretty message
    if File.unsupported.length is 0
      "Your browser supports all the File-related APIs, i.e.:\n  #{list File.supported}"
    else if File.supported.length is 0
      "Your browser doesn't support any File-related APIs, i.e.:\n  #{list File.unsupported}"
    else
      "Your browser supports the following APIs:\n  #{list File.supported}\nbut doesn't support:\n  #{list File.unsupported}"
  
  # Returns mime type based on the extension of 'fileName'
  File.fileType = (fileName) ->
    # extract extension (w/out the dot)
    extension = fileName.match /\.([0-9a-z]+)(?:[\?#]|$)/i
    # return default type if there is no extension
    return File.defaultType unless extension? and extension isnt '' and extension.length > 0
    # return corresponding mime type; if there is none return the default one
    type = File.extensions.all[extension[1]]
    if type? then type else File.defaultType
  
  # Returns whether mime type is textual.
  # Note that false may be returned for some mime types even though they may 
  # actually be textual (the list of mime types is very long and there is
  # little info about their specific format unless one looks at the RFC of every one)
  File.isTextType = (type) ->
    # check among the types we know
    return true if File.types.text[type]?
    # check whether it starts with 'text/'
    return true if /^text\//.test type
    # check the suffixes we know are textual
    for suffix in ['json', 'xml']
      return true if new RegExp("#{suffix}$").test type
    false
  
  # Returns whether mime type is of a web image (JPEG or PNG)
  File.isWebImageType = (type) ->
    File.types.webImage[type]?
  File.isMyImageFile = (type) ->
    File.types.MyImage[type]?
  # Reads a single 'file' in the Web API File format asynchronously.
  # Calls onRead(file, data) once the file's 'data' content is available.
  # Note: Image data read can be directly used to display it an <img> element.
  # E.g. for <img id="myImg" the CoffeeScript code using jQuery:
  #   onRead = (file, data) ->
  #     $('#myImg').attr {file:file, src:data}
  # Note: Image data read can be directly used to display it in the background 
  # of any element. E.g. for <div id="myDiv" the CoffeeScript code using jQuery:
  #   onRead = (file, data) ->
  #     $('#myDiv').css {background:"url(#{data}) no-repeat center"}
  File.readFile = (file, onRead) ->
    reader = new FileReader()
    # initiate reading
    if File.isTextType file.type then reader.readAsText file
    else reader.readAsDataURL file
    # call 'onRead(...)' once it's available
    reader.onloadend = (event) => onRead file, event.target.result
  
  # Reads a file that the user selects from standard file open dialog
  # Once file contents is available, 'onRead(contents)' will be called
  # 'onFilesMetaData(files)' will be called once the files metadata is available (reading data may still fail!)
  #   metadata is file.name, file.size (in bytes), file.type (mime type)
  # 'onError(message)' is called either if the browser doesn't support reading files
  #   or if metadata doesn't become available
  # See also Note: for File.readFile above for displaying images
  # To do: handle user cancelling the file open dialog
  File.read = (onRead, onError, onFilesMetaData) ->
    # check whether FileReader API is available
    if FileReader?
      # as reading files is only supported through an <input type="file"> DOM element,
      # insert a dummy hidden <input> to placate the W3C standards (unless we haven't done it yet)
      File.dom.input = $('<input>').attr({type:'file', href:'#'}).hide().appendTo File.dom.body unless File.dom.input
      # read file once the <input> is clicked
      File.dom.input.on 'change', ->
        # metadata is available
        # retrieve files from the FileList object of dom.input
        files = $(@).get(0).files
        # call onFilesMetaData if it's supplied
        onFilesMetaData files if onFilesMetaData?
        # initiate reading of all files
        File.readFile file, onRead for file in files
      # programatically trigger clicking the dummy <input>
      File.dom.input.trigger 'click'
    else
      onError "Your browser doesn't support reading files, sorry..." if onError?
    
  # Writes 'data' to a file that the user selects from standard file save dialog
  # To do: onWritten isn't supported, yet
  File.write = (fileName, data, onError, onWritten) ->
    # check whether URL and Blob APIs are available
    if URL? and Blob?
      # as writing files is only supported through an <a download="some-file-name"> DOM element,
      # insert such a dummy hidden <a> to placate the W3C standards (unless we haven't done it yet)
      File.dom.a = $('<a>').hide().appendTo File.dom.body unless File.dom.a
      # find the right mime type
      type = File.fileType fileName
      # fill a URL object with the data
      # note: large (binary) data will have to be filled piecemeal into the array for Blob 
      href = URL.createObjectURL(new Blob([data], {type: type}))
      # fill the dummy <a> with the weird needed attributes
      options =
        download: fileName
        href: href
        'data-downloadurl': "#{type}:#{fileName}:#{href}"
      File.dom.a.attr options
      # programatically trigger clicking the dummy <a>
      # note: can't be done with jQuery's trigger('click')!
      File.dom.a[0].click()
      # After some delay, release the storage the data needed (delay needed to work properly)
      cleanUp = -> URL.revokeObjectURL href
      setTimeout cleanUp, 1500
    else
      onError("Your browser doesn't support writing files, sorry...") if onError?