$ ->
  dom = {}
  ids = ['icon1','icon2','icon3','icon4','icon5','icon6','icon7','icon8','icon9','icon10','icon11','icon12','icon13','icon14','icon15','icon16','icon17','icon18','icon19','icon20',
         'icon21','icon22','icon23','icon24','icon25','icon26','icon27','icon28','icon29','icon30','icon31','icon32',      
        'loginbtn','loginWindow','username','password','login','sizeM','sizeL','heightL','heightM','widthM','widthL','usePicAsMarker','upload','selectedIcon', 'cancleIcon','reload','save', 'open','image1','image2','image3','image4','image5','image6', 
        'image1_data','title1', 'title2','title3','title4','title5','title6','newtitle1','savetitle1', 'newtitle2','savetitle2', 'newtitle3','savetitle3', 'newtitle4','savetitle4','newtitle5' ,'savetitle5',
        'image1a_data','title1a',  'title2a','title3a','title4a','title5a','title6a','newtitle1a','savetitle1a', 'newtitle2a','savetitle2a', 'newtitle3a','savetitle3a', 'newtitle4a','savetitle4a', 'newtitle5a','savetitle5a',
        'image1b_data','title1b',  'title2b','title3b','title4b','title5b','title6b','newtitle1b','savetitle1b', 'newtitle2b','savetitle2b', 'newtitle3b','savetitle3b', 'newtitle4b','savetitle4b', 'newtitle5b','savetitle5b',
        'image1c_data','title1c',  'title2c','title3c','title4c','title5c','title6c','newtitle1c','savetitle1c', 'newtitle2c','savetitle2c', 'newtitle3c','savetitle3c', 'newtitle4c','savetitle4c', 'newtitle5c','savetitle5c',
        'image1d_data','title1d',  'title2d','title3d','title4d','title5d','title6d','newtitle1d','savetitle1d', 'newtitle2d','savetitle2d', 'newtitle3d','savetitle3d', 'newtitle4d','savetitle4d', 'newtitle5d','savetitle5d',
        'image1e_data','title1e',  'title2e','title3e','title4e','title5e','title6e','newtitle1e','savetitle1e', 'newtitle2e','savetitle2e', 'newtitle3e','savetitle3e', 'newtitle4e','savetitle4e', 'newtitle5e','savetitle5e']
  dom[id] = $ "##{id}" for id in ids
  staged = {}
  noDnD = (event) ->
    event.preventDefault()
    false
  $(document.body).on('dragover', noDnD).on('drop', noDnD)
  dom.dropped = $ '.dropped'
  dom.dropped.hide()
  

  ###################################################### my codes
  loadContents = (Myid, Myfile) ->
    xmlhttp = undefined
    if window.XMLHttpRequest
      xmlhttp = new XMLHttpRequest()
    else
      xmlhttp = new ActiveXObject("Microsoft.XMLHTTP")
    xmlhttp.onreadystatechange = ->
      if xmlhttp.readyState is 4 and xmlhttp.status is 200
        document.getElementById(Myid).style.background = "url(" + xmlhttp.responseText + ")"
        document.getElementById(Myid).style.content = "url(" + xmlhttp.responseText + ")"
       
      return
  
    xmlhttp.open "GET", Myfile, true
    xmlhttp.send()
    return
  #loadContents "image1", "image1.txt"

  ###################################################### end of my codes
  dom.image1_data.on "click", ->
    onRead = (file, content) ->
      if js.File.isWebImageType file.type
        dom.image1.attr {style: "background:url(" + content + ") no-repeat center center; background-size:cover;"}
        dom.image1.attr {content: content}
    js.File.read onRead
  dom.savetitle1.on "click", ->
      dom.title1.text document.getElementById("newtitle1").value
  dom.savetitle2.on "click", ->
      dom.title2.text document.getElementById("newtitle2").value
  dom.savetitle3.on "click", ->
      dom.title3.text document.getElementById("newtitle3").value
  dom.savetitle4.on "click", ->
      dom.title4.text document.getElementById("newtitle4").value
  dom.savetitle5.on "click", ->
      dom.title5.text document.getElementById("newtitle5").value
        
  dom.image1a_data.on "click", ->
    onRead = (file, content) ->
      if js.File.isWebImageType file.type
        dom.image2.attr {style: "background:url(" + content + ") no-repeat center center; background-size:cover;"}
        dom.image2.attr {content: content}
    js.File.read onRead
  dom.savetitle1a.on "click", ->
      dom.title1a.text document.getElementById("newtitle1a").value
  dom.savetitle2a.on "click", ->
      dom.title2a.text document.getElementById("newtitle2a").value
  dom.savetitle3a.on "click", ->
      dom.title3a.text document.getElementById("newtitle3a").value
  dom.savetitle4a.on "click", ->
      dom.title4a.text document.getElementById("newtitle4a").value
  dom.savetitle5a.on "click", ->
      dom.title5a.text document.getElementById("newtitle5a").value
        
  dom.image1b_data.on "click", ->
    onRead = (file, content) ->
      if js.File.isWebImageType file.type
        dom.image3.attr {style: "background:url(" + content + ") no-repeat center center; background-size:cover;"}
        dom.image3.attr {content: content}
    js.File.read onRead
  dom.savetitle1b.on "click", ->
      dom.title1b.text document.getElementById("newtitle1b").value
  dom.savetitle2b.on "click", ->
      dom.title2b.text document.getElementById("newtitle2b").value
  dom.savetitle3b.on "click", ->
      dom.title3b.text document.getElementById("newtitle3b").value
  dom.savetitle4b.on "click", ->
      dom.title4b.text document.getElementById("newtitle4b").value
  dom.savetitle5b.on "click", ->
      dom.title5b.text document.getElementById("newtitle5b").value
              
  dom.image1c_data.on "click", ->
    onRead = (file, content) ->
      if js.File.isWebImageType file.type
        dom.image4.attr {style: "background:url(" + content + ") no-repeat center center; background-size:cover;"}
        dom.image4.attr {content: content}
    js.File.read onRead
  dom.savetitle1c.on "click", ->
      dom.title1c.text document.getElementById("newtitle1c").value
  dom.savetitle2c.on "click", ->
      dom.title2c.text document.getElementById("newtitle2c").value
  dom.savetitle3c.on "click", ->
      dom.title3c.text document.getElementById("newtitle3c").value
  dom.savetitle4c.on "click", ->
      dom.title4c.text document.getElementById("newtitle4c").value
  dom.savetitle5c.on "click", ->
      dom.title5c.text document.getElementById("newtitle5c").value

  dom.image1d_data.on "click", ->
    onRead = (file, content) ->
      if js.File.isWebImageType file.type
        dom.image5.attr {style: "background:url(" + content + ") no-repeat center center; background-size:cover;"}
        dom.image5.attr {content: content}
    js.File.read onRead
  dom.savetitle1d.on "click", ->
      dom.title1d.text document.getElementById("newtitle1d").value
  dom.savetitle2d.on "click", ->
      dom.title2d.text document.getElementById("newtitle2d").value
  dom.savetitle3d.on "click", ->
      dom.title3d.text document.getElementById("newtitle3d").value
  dom.savetitle4d.on "click", ->
      dom.title4d.text document.getElementById("newtitle4d").value
  dom.savetitle5d.on "click", ->
      dom.title5d.text document.getElementById("newtitle5d").value        

  dom.image1e_data.on "click", ->
    onRead = (file, content) ->
      if js.File.isWebImageType file.type
        dom.image6.attr {style: "background:url(" + content + ") no-repeat center center; background-size:cover;"}
        dom.image6.attr {content: content}
    js.File.read onRead
  dom.savetitle1e.on "click", ->
      dom.title1e.text document.getElementById("newtitle1e").value
  dom.savetitle2e.on "click", ->
      dom.title2e.text document.getElementById("newtitle2e").value
  dom.savetitle3e.on "click", ->
      dom.title3e.text document.getElementById("newtitle3e").value
  dom.savetitle4e.on "click", ->
      dom.title4e.text document.getElementById("newtitle4e").value
  dom.savetitle5e.on "click", ->
      dom.title5e.text document.getElementById("newtitle5e").value
                          
  dom.open.on "click", ->
    onRead = undefined
    onRead = (file, content) ->
      if js.File.isTextType(file.type)
        obj = JSON.parse(content)
        alert obj.tour1[0].image + " " + obj.tour1[0].title1
    js.File.read onRead
   
  dom.save.click ->
    image1_url = dom.image1.attr 'content'
    image2_url = dom.image2.attr 'content'
    image3_url = dom.image3.attr 'content'
    image4_url = dom.image4.attr 'content'
    image5_url = dom.image5.attr 'content'
    image6_url = dom.image6.attr 'content'
    
    title1 =  document.getElementById("title1").value 
    title1a = document.getElementById("title1a").value 
    title1b = document.getElementById("title1b").value 
    title1c = document.getElementById("title1c").value 
    title1d = document.getElementById("title1d").value 
    title1e = document.getElementById("title1e").value 
    
    title2 =  document.getElementById("title2").value 
    title2a = document.getElementById("title2a").value 
    title2b = document.getElementById("title2b").value 
    title2c = document.getElementById("title2c").value 
    title2d = document.getElementById("title2d").value 
    title2e = document.getElementById("title2e").value 
    
    title3 =  document.getElementById("title3").value 
    title3a = document.getElementById("title3a").value 
    title3b = document.getElementById("title3b").value 
    title3c = document.getElementById("title3c").value 
    title3d = document.getElementById("title3d").value 
    title3e = document.getElementById("title3e").value 
    
    title4 =  document.getElementById("title4").value 
    title4a = document.getElementById("title4a").value 
    title4b = document.getElementById("title4b").value 
    title4c = document.getElementById("title4c").value 
    title4d = document.getElementById("title4d").value 
    title4e = document.getElementById("title4e").value 
    
    title5 =  document.getElementById("title5").value 
    title5a = document.getElementById("title5a").value 
    title5b = document.getElementById("title5b").value 
    title5c = document.getElementById("title5c").value 
    title5d = document.getElementById("title5d").value 
    title5e = document.getElementById("title5e").value 
    

    #image1_url = btoa dom.image1.attr 'content'
    #decodedString = atob encodedString;
    #image1_url=dom.title1.text()
    content  = "{ \"tour1\" : [" +  "{ \"image1\":\"" + image1_url + "\" , \"title1\":\"" + title1 + "\", \"title1a\":\"" + title1a + "\", \"title1b\":\"" + title1b + "\", \"title1c\":\"" + title1c + "\", \"title1d\":\"" + title1d + "\" , \"title1e\":\"" + title1e + "\"}," + 
                                    "{ \"image2\":\"" + image2_url + "\" , \"title2\":\"" + title2 + "\", \"title2a\":\"" + title2a + "\", \"title2b\":\"" + title2b + "\", \"title2c\":\"" + title2c + "\", \"title2d\":\"" + title2d + "\" , \"title2e\":\"" + title2e + "\"}," +
                                    "{ \"image3\":\"" + image3_url + "\" , \"title3\":\"" + title2 + "\", \"title3a\":\"" + title3a + "\", \"title3b\":\"" + title3b + "\", \"title3c\":\"" + title3c + "\", \"title3d\":\"" + title3d + "\" , \"title3e\":\"" + title3e + "\"}," +
                                    "{ \"image4\":\"" + image4_url + "\" , \"title4\":\"" + title2 + "\", \"title4a\":\"" + title4a + "\", \"title4b\":\"" + title4b + "\", \"title4c\":\"" + title4c + "\", \"title4d\":\"" + title4d + "\" , \"title4e\":\"" + title4e + "\"}," +
                                    "{ \"image5\":\"" + image5_url + "\" , \"title5\":\"" + title2 + "\", \"title5a\":\"" + title5a + "\", \"title5b\":\"" + title5b + "\", \"title5c\":\"" + title5c + "\", \"title5d\":\"" + title5d + "\" , \"title5e\":\"" + title5e + "\"}," + 
                                    "{ \"image6\":\"" + image6_url + "\" }, ] }"
               
               
               
    js.File.write 'image1.txt', content
    #s.File.write 'page_text.txt', dom.title1.text()
    #content = dom.image1.attr 'content'
    #for type in ['png', 'jpeg']
    #  if new RegExp("^data:image\/#{type};base64").test content
    #    js.File.write 'page_image.text', content
  #dom.upload.click ->
  #  dom.dropped.hide()
  #  dom.drop_row.show()
  #dom.upload_data.click ->
  #  if staged.type is 'text'
  #    dom.text.text staged.content
  #  else if staged.type is 'image'
  #    dom.image.attr {src:staged.content}
  #onDrop = (file, content) =>
  #  dom.drop_row.hide()
  #  staged.content = content
  #  if js.File.isTextType file.type
  #    staged.type = 'text'
  #    dom.drop_text_row.show()
  #    dom.drop_text.val content
  #  else if js.File.isWebImageType file.type
  #    staged.type = 'image'
  #    dom.drop_image_row.show()
  #    dom.drop_image.attr {src:content}
  #  else
  #    staged.type = 'binary'
  #    dom.drop_binary_row.show()
  #    dom.drop_binary.val content
  #    
  #new js.FileDnD(dom.drop, onDrop)
  #dom.upload.trigger 'click'
  #null
  image = url: "http://maps.google.com/mapfiles/ms/icons/POI.png"
  tour1 = url: "http://maps.google.com/mapfiles/ms/icons/POI.png"
  tour2 = url: "http://maps.google.com/mapfiles/ms/icons/POI.png"
  tour3 = url: "http://maps.google.com/mapfiles/ms/icons/POI.png"
  tour4 = url: "http://maps.google.com/mapfiles/ms/icons/POI.png"
  tour5 = url: "http://maps.google.com/mapfiles/ms/icons/POI.png"
  tour6 = url: "http://maps.google.com/mapfiles/ms/icons/POI.png"
  copyImgeUrl = ->
    tour1 = image
    tour2 = image
    tour3 = image
    tour4 = image
    tour5 = image
    tour6 = image
  initialize = (addresses) ->
    myCenter = new google.maps.LatLng(21.431714, -157.952848)
    mapProp =
      center: myCenter
      zoom: 10
      mapTypeId: google.maps.MapTypeId.ROADMAP
  
    map = new google.maps.Map(document.getElementById("googleMap"), mapProp)
    homeControlDiv = document.createElement("div")
    homeControl = new HomeControl(homeControlDiv, map)
    homeControlDiv.index = 1
    map.controls[google.maps.ControlPosition.RIGHT].push homeControlDiv
    reloadControlDiv = document.createElement("div")
    reloadControl = new ReloadControl(reloadControlDiv, map)
    reloadControlDiv.index = 1
    map.controls[google.maps.ControlPosition.RIGHT].push reloadControlDiv
    google.maps.event.trigger map, "resize"
    setMarkers map, addresses
    return
  places = new Array(6)
  addresses = undefined
  reflashAddressField = ->
    addresses = [
      [
        "" + (dom.title1.text())
        "" + (dom.title2.text())
        0
        1
      ]
      [
        "" + (dom.title1a.text())
        "" + (dom.title2a.text())
        0
        2
      ]
      [
        "" + (dom.title1b.text())
        "" + (dom.title2b.text())
        0
        3
      ]
      [
        "" + (dom.title1c.text())
        "" + (dom.title2c.text())
        0
        4
      ]
      [
        "" + (dom.title1d.text())
        "" + (dom.title2d.text())
        0
        5
      ]
      [
        "" + (dom.title1e.text())
        "" + (dom.title2e.text())
        0
        6
      ]
    ]
    return
  
  loadCoordinator = ->
    reflashAddressField()
    temm = []
    geocoder = new google.maps.Geocoder()
    ii = 0
    i = 0
  
    while i < addresses.length
      temm = addresses[i]
      setTimeout geocoder.geocode(
        address: temm[1]
      , (results, status) ->
        if status is google.maps.GeocoderStatus.OK
          places[ii] = results[0].geometry.location
          ii++
        else
          alert "Geocode was not successful for the following reason: " + status
        return
      ), 2500 # End of setTimeOut Function - 2500 being a quarter of a second.
      i++
    return
  
  loadCoordinator()
  setMarkers = (map, locations) ->
    beach1 = undefined
    beach2 = undefined
    beach3 = undefined
    beach4 = undefined
    beach5 = undefined
    beach6 = undefined
    shape = undefined
    shape =
      coords: [
        1
        1
        1
        20
        18
        20
        18
        1
      ]
      type: "poly"
  
    beach1 = locations[0]
    marker1 = undefined
    marker1 = new google.maps.Marker(
      position: places[0]
      map: map
      icon: tour1
      shape: shape
      title: beach1[0]
      zIndex: beach1[3]
      animation: google.maps.Animation.BOUNCE
    )
    beach2 = locations[1]
    marker2 = undefined
    marker2 = new google.maps.Marker(
      position: places[1]
      map: map
      icon: tour2
      shape: shape
      title: beach2[0]
      zIndex: beach2[3]
      animation: google.maps.Animation.BOUNCE
    )
    beach3 = locations[2]
    marker3 = undefined
    marker3 = new google.maps.Marker(
      position: places[2]
      map: map
      icon: tour3
      shape: shape
      title: beach3[0]
      zIndex: beach3[3]
      animation: google.maps.Animation.BOUNCE
    )
    beach4 = locations[3]
    marker4 = undefined
    marker4 = new google.maps.Marker(
      position: places[3]
      map: map
      icon: tour4
      shape: shape
      title: beach4[0]
      zIndex: beach4[3]
      animation: google.maps.Animation.BOUNCE
    )
    beach5 = locations[4]
    marker5 = undefined
    marker5 = new google.maps.Marker(
      position: places[4]
      map: map
      icon: tour5
      shape: shape
      title: beach5[0]
      zIndex: beach5[3]
      animation: google.maps.Animation.BOUNCE
    )
    beach6 = locations[5]
    marker6 = undefined
    marker6 = new google.maps.Marker(
      position: places[5]
      map: map
      icon: tour6
      shape: shape
      title: beach6[0]
      zIndex: beach6[3]
      animation: google.maps.Animation.BOUNCE
    )
    return
  
  loadScript = ->
    reflashAddressField()
    initialize addresses
    return
  HomeControl = (controlDiv, map) ->
    
    # Set CSS styles for the DIV containing the control
    # Setting padding to 5 px will offset the control
    # from the edge of the map
    controlDiv.style.padding = "5px"
    
    # Set CSS for the control border
    controlUI = document.createElement("div")
    controlUI.style.backgroundColor = "white"
    controlUI.style.borderStyle = "solid"
    controlUI.style.borderWidth = "2px"
    controlUI.style.cursor = "pointer"
    controlUI.style.textAlign = "center"
    controlUI.title = "Click to set the map to Home"
    controlDiv.appendChild controlUI
    
    # Set CSS for the control interior
    controlText = document.createElement("div")
    controlText.style.fontFamily = "Arial,sans-serif"
    controlText.style.fontSize = "12px"
    controlText.style.paddingLeft = "4px"
    controlText.style.paddingRight = "4px"
    controlText.innerHTML = "<b>Home</b>"
    controlUI.appendChild controlText
    
    # Setup the click event listeners: simply set the map to
    # Chicago
    google.maps.event.addDomListener controlUI, "click", ->
      map.setCenter new google.maps.LatLng(21.431714, -157.952848)
      return
  
    return
  ReloadControl = (controlDiv, map) ->
    
    # Set CSS styles for the DIV containing the control
    # Setting padding to 5 px will offset the control
    # from the edge of the map
    controlDiv.style.padding = "5px"
    
    # Set CSS for the control border
    controlUI = document.createElement("div")
    controlUI.style.backgroundColor = "white"
    controlUI.style.borderStyle = "solid"
    controlUI.style.borderWidth = "2px"
    controlUI.style.cursor = "pointer"
    controlUI.style.textAlign = "center"
    controlUI.title = "Click to reload the map"
    controlDiv.appendChild controlUI
    
    # Set CSS for the control interior
    controlText = document.createElement("div")
    controlText.style.fontFamily = "Arial,sans-serif"
    controlText.style.fontSize = "12px"
    controlText.style.paddingLeft = "4px"
    controlText.style.paddingRight = "4px"
    controlText.innerHTML = "<b>Reload</b>"
    controlUI.appendChild controlText
    
    # Setup the click event listeners: simply set the map to
    # Chicago
    google.maps.event.addDomListener controlUI, "click", ->
      loadCoordinator()
      loadScript()     
      return  
    return
    
  google.maps.event.addDomListener window, "load", loadScript
  dom.reload.on 'click', ->
    loadCoordinator()
    loadScript() 
  ChangeSelectedIconSrc = (data) ->
    dom.selectedIcon.attr {src:data}
  dom.cancleIcon.on 'click', ->
    image = url:"http://maps.google.com/mapfiles/ms/icons/POI.png"
    copyImgeUrl()
    loadScript()
  dom.icon1.on "click", ->
    image = url: document.getElementById(         "icon1").src
    ChangeSelectedIconSrc document.getElementById("icon1").src
    copyImgeUrl()
    loadScript() 
  dom.icon2.on "click", ->
    image = url: document.getElementById(         "icon2").src
    ChangeSelectedIconSrc document.getElementById("icon2").src
    copyImgeUrl()
    loadScript() 
  dom.icon3.on "click", ->
    image = url: document.getElementById(         "icon3").src
    ChangeSelectedIconSrc document.getElementById("icon3").src
    copyImgeUrl()
    loadScript() 
  dom.icon4.on "click", ->
    image = url: document.getElementById(         "icon4").src
    ChangeSelectedIconSrc document.getElementById("icon4").src
    copyImgeUrl()
    loadScript() 
  dom.icon5.on "click", ->
    image = url: document.getElementById(         "icon5").src
    ChangeSelectedIconSrc document.getElementById("icon5").src
    copyImgeUrl()
    loadScript() 
  dom.icon6.on "click", ->
    image = url: document.getElementById(         "icon6").src
    ChangeSelectedIconSrc document.getElementById("icon6").src
    copyImgeUrl()
    loadScript() 
  dom.icon7.on "click", ->
    image = url: document.getElementById(         "icon7").src
    ChangeSelectedIconSrc document.getElementById("icon7").src
    copyImgeUrl()
    loadScript() 
  dom.icon8.on "click", ->
    image = url: document.getElementById(         "icon8").src
    ChangeSelectedIconSrc document.getElementById("icon8").src
    copyImgeUrl()
    loadScript() 
  dom.icon9.on "click", ->
    image = url: document.getElementById(         "icon9").src
    ChangeSelectedIconSrc document.getElementById("icon9").src
    copyImgeUrl()
    loadScript() 
  dom.icon10.on "click", ->
    image = url: document.getElementById(         "icon10").src
    ChangeSelectedIconSrc document.getElementById("icon10").src
    copyImgeUrl()
    loadScript() 
  dom.icon11.on "click", ->
    image = url: document.getElementById(         "icon11").src
    ChangeSelectedIconSrc document.getElementById("icon11").src
    copyImgeUrl()
    loadScript() 
  dom.icon12.on "click", ->
    image = url: document.getElementById(         "icon12").src
    ChangeSelectedIconSrc document.getElementById("icon12").src
    copyImgeUrl()
    loadScript() 
  dom.icon13.on "click", ->
    image = url: document.getElementById(         "icon13").src
    ChangeSelectedIconSrc document.getElementById("icon13").src
    copyImgeUrl()
    loadScript()
  dom.icon14.on "click", ->
    image = url: document.getElementById(         "icon14").src
    ChangeSelectedIconSrc document.getElementById("icon14").src
    copyImgeUrl()
    loadScript() 
  dom.icon15.on "click", ->
    image = url: document.getElementById(         "icon15").src
    ChangeSelectedIconSrc document.getElementById("icon15").src
    copyImgeUrl()
    loadScript() 
  dom.icon16.on "click", ->
    image = url: document.getElementById(         "icon16").src
    ChangeSelectedIconSrc document.getElementById("icon16").src
    copyImgeUrl()
    loadScript() 
  dom.icon17.on "click", ->
    image = url: document.getElementById(         "icon17").src
    ChangeSelectedIconSrc document.getElementById("icon17").src
    copyImgeUrl()
    loadScript() 
  dom.icon18.on "click", ->
    image = url: document.getElementById(         "icon18").src
    ChangeSelectedIconSrc document.getElementById("icon18").src
    copyImgeUrl()
    loadScript() 
  dom.icon19.on "click", ->
    image = url: document.getElementById(         "icon19").src
    ChangeSelectedIconSrc document.getElementById("icon19").src
    copyImgeUrl()
    loadScript() 
  dom.icon20.on "click", ->
    image = url: document.getElementById(         "icon20").src
    ChangeSelectedIconSrc document.getElementById("icon20").src
    copyImgeUrl()
    loadScript() 
  dom.icon21.on "click", ->
    image = url: document.getElementById(         "icon21").src
    ChangeSelectedIconSrc document.getElementById("icon21").src
    copyImgeUrl()
    loadScript() 
  dom.icon22.on "click", ->
    image = url: document.getElementById(         "icon22").src
    ChangeSelectedIconSrc document.getElementById("icon22").src
    copyImgeUrl()
    loadScript() 
  dom.icon23.on "click", ->
    image = url: document.getElementById(         "icon23").src
    ChangeSelectedIconSrc document.getElementById("icon23").src
    copyImgeUrl()
    loadScript() 
  dom.icon24.on "click", ->
    image = url: document.getElementById(         "icon24").src
    ChangeSelectedIconSrc document.getElementById("icon24").src
    copyImgeUrl()
    loadScript() 
  dom.icon25.on "click", ->
    image = url: document.getElementById(         "icon25").src
    ChangeSelectedIconSrc document.getElementById("icon25").src
    copyImgeUrl()
    loadScript() 
  dom.icon26.on "click", ->
    image = url: document.getElementById(         "icon26").src
    ChangeSelectedIconSrc document.getElementById("icon26").src
    copyImgeUrl()
    loadScript() 
  dom.icon27.on "click", ->
    image = url: document.getElementById(         "icon27").src
    ChangeSelectedIconSrc document.getElementById("icon27").src
    copyImgeUrl()
    loadScript() 
  dom.icon28.on "click", ->
    image = url: document.getElementById(         "icon28").src
    ChangeSelectedIconSrc document.getElementById("icon28").src
    copyImgeUrl()
    loadScript() 
  dom.icon29.on "click", ->
    image = url: document.getElementById(         "icon29").src
    ChangeSelectedIconSrc document.getElementById("icon29").src
    copyImgeUrl()
    loadScript() 
  dom.icon30.on "click", ->
    image = url: document.getElementById(         "icon30").src
    ChangeSelectedIconSrc document.getElementById("icon30").src
    copyImgeUrl()
    loadScript() 
  dom.icon31.on "click", ->
    image = url: document.getElementById(         "icon31").src
    ChangeSelectedIconSrc document.getElementById("icon31").src
    copyImgeUrl()
    loadScript() 
  dom.icon32.on "click", ->
    image = url: document.getElementById(         "icon32").src
    ChangeSelectedIconSrc document.getElementById("icon32").src
    copyImgeUrl()
    loadScript() 
  CovertIMGsize = (img, w, h) ->  
    # create an off-screen canvas
    canvas = document.createElement("canvas")
    ctx = canvas.getContext("2d")    
    # set its dimension to target size
    canvas.width = w
    canvas.height = h    
    # draw source image into the off-screen canvas:
    ctx.drawImage img, 0, 0, w, h    
    # encode image to data-uri with base64 version of compressed image
    canvas.toDataURL()
  dom.usePicAsMarker.on "click", ->
    temp1 =  new Image()
    temp2 =  new Image()
    temp3 =  new Image()
    temp4 =  new Image()
    temp5 =  new Image()
    temp6 =  new Image()
    temp1.src = $("#image1").attr "content"
    temp2.src = $("#image2").attr "content"
    temp3.src = $("#image3").attr "content"
    temp4.src = $("#image4").attr "content"
    temp5.src = $("#image5").attr "content"
    temp6.src = $("#image6").attr "content"
    tour1 = url: CovertIMGsize(temp1, 40, 40)
    tour2 = url: CovertIMGsize(temp2, 40, 40)
    tour3 = url: CovertIMGsize(temp3, 40, 40)
    tour4 = url: CovertIMGsize(temp4, 40, 40)
    tour5 = url: CovertIMGsize(temp5, 40, 40)
    tour6 = url: CovertIMGsize(temp6, 40, 40)
    loadScript()
  dom.widthL.on "click", ->
    temp1 =  new Image()
    temp2 =  new Image()
    temp3 =  new Image()
    temp4 =  new Image()
    temp5 =  new Image()
    temp6 =  new Image()
    temp1.src = tour1.url
    temp2.src = tour2.url
    temp3.src = tour3.url
    temp4.src = tour4.url
    temp5.src = tour5.url
    temp6.src = tour6.url
    size1= temp1.width-10
    size2= temp2.height
    tour1 = url: CovertIMGsize(temp1, size1, size2)
    tour2 = url: CovertIMGsize(temp2, size1, size2)
    tour3 = url: CovertIMGsize(temp3, size1, size2)
    tour4 = url: CovertIMGsize(temp4, size1, size2)
    tour5 = url: CovertIMGsize(temp5, size1, size2)
    tour6 = url: CovertIMGsize(temp6, size1, size2)
    loadScript()
  dom.widthM.on "click", ->
    temp1 =  new Image()
    temp2 =  new Image()
    temp3 =  new Image()
    temp4 =  new Image()
    temp5 =  new Image()
    temp6 =  new Image()
    temp1.src = tour1.url
    temp2.src = tour2.url
    temp3.src = tour3.url
    temp4.src = tour4.url
    temp5.src = tour5.url
    temp6.src = tour6.url
    size1= temp1.width+10
    size2= temp2.height
    tour1 = url: CovertIMGsize(temp1, size1, size2)
    tour2 = url: CovertIMGsize(temp2, size1, size2)
    tour3 = url: CovertIMGsize(temp3, size1, size2)
    tour4 = url: CovertIMGsize(temp4, size1, size2)
    tour5 = url: CovertIMGsize(temp5, size1, size2)
    tour6 = url: CovertIMGsize(temp6, size1, size2)
    loadScript()
  dom.heightL.on "click", ->
    temp1 =  new Image()
    temp2 =  new Image()
    temp3 =  new Image()
    temp4 =  new Image()
    temp5 =  new Image()
    temp6 =  new Image()
    temp1.src = tour1.url
    temp2.src = tour2.url
    temp3.src = tour3.url
    temp4.src = tour4.url
    temp5.src = tour5.url
    temp6.src = tour6.url
    size1= temp1.width
    size2= temp1.height-10
    tour1 = url: CovertIMGsize(temp1, size1, size2)
    tour2 = url: CovertIMGsize(temp2, size1, size2)
    tour3 = url: CovertIMGsize(temp3, size1, size2)
    tour4 = url: CovertIMGsize(temp4, size1, size2)
    tour5 = url: CovertIMGsize(temp5, size1, size2)
    tour6 = url: CovertIMGsize(temp6, size1, size2)
    loadScript()
  dom.heightM.on "click", ->
    temp1 =  new Image()
    temp2 =  new Image()
    temp3 =  new Image()
    temp4 =  new Image()
    temp5 =  new Image()
    temp6 =  new Image()
    temp1.src = tour1.url
    temp2.src = tour2.url
    temp3.src = tour3.url
    temp4.src = tour4.url
    temp5.src = tour5.url
    temp6.src = tour6.url
    size1= temp1.width
    size2= temp2.height+10
    tour1 = url: CovertIMGsize(temp1, size1, size2)
    tour2 = url: CovertIMGsize(temp2, size1, size2)
    tour3 = url: CovertIMGsize(temp3, size1, size2)
    tour4 = url: CovertIMGsize(temp4, size1, size2)
    tour5 = url: CovertIMGsize(temp5, size1, size2)
    tour6 = url: CovertIMGsize(temp6, size1, size2)
    loadScript()
   dom.sizeL.on "click", ->
    temp1 =  new Image()
    temp2 =  new Image()
    temp3 =  new Image()
    temp4 =  new Image()
    temp5 =  new Image()
    temp6 =  new Image()
    temp1.src = tour1.url
    temp2.src = tour2.url
    temp3.src = tour3.url
    temp4.src = tour4.url
    temp5.src = tour5.url
    temp6.src = tour6.url
    size1= temp1.width-10
    size2= temp1.height-10
    tour1 = url: CovertIMGsize(temp1, size1, size2)
    tour2 = url: CovertIMGsize(temp2, size1, size2)
    tour3 = url: CovertIMGsize(temp3, size1, size2)
    tour4 = url: CovertIMGsize(temp4, size1, size2)
    tour5 = url: CovertIMGsize(temp5, size1, size2)
    tour6 = url: CovertIMGsize(temp6, size1, size2)
    loadScript()
  dom.sizeM.on "click", ->
    temp1 =  new Image()
    temp2 =  new Image()
    temp3 =  new Image()
    temp4 =  new Image()
    temp5 =  new Image()
    temp6 =  new Image()
    temp1.src = tour1.url
    temp2.src = tour2.url
    temp3.src = tour3.url
    temp4.src = tour4.url
    temp5.src = tour5.url
    temp6.src = tour6.url
    size1= temp1.width+10
    size2= temp2.height+10
    tour1 = url: CovertIMGsize(temp1, size1, size2)
    tour2 = url: CovertIMGsize(temp2, size1, size2)
    tour3 = url: CovertIMGsize(temp3, size1, size2)
    tour4 = url: CovertIMGsize(temp4, size1, size2)
    tour5 = url: CovertIMGsize(temp5, size1, size2)
    tour6 = url: CovertIMGsize(temp6, size1, size2)
    loadScript()
  $('.user_edit_enable').hide()
  dom.login.on "click", -> #function to check userid & password  
    #the following code checkes whether the entered userid and password are matching
    if document.getElementById("username").value is "user" and document.getElementById("password").value is "123"
      $('.user_edit_enable').show()
      dom.loginbtn.text "logout"
      alert("Successfully logged in");
      
    else
      alert "Error Password or Username" #displays error message
    return
  
  dom.upload.on "click", ->
    img = new Image() 
    onRead = (file, content) ->
      img.src = content 
      if js.File.isWebImageType file.type
        image = url: CovertIMGsize(img, 32, 32)
        ChangeSelectedIconSrc CovertIMGsize(img, 32, 32)
        copyImgeUrl()
        loadScript() 
    js.File.read onRead
  
###
  cd "Users/vin/Desktop/course_page/"
  coffee -cwo javascripts/ coffeescripts/
###

