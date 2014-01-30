Router.map ->
  @route "/",
    path: "/"
    yieldTemplates:
      header:
        to: "header"
      subHeader:
        to: "subHeader"
      leftSidebar:
        to: "leftSidebar"
      rightSidebar:
        to: "rightSidebar"
    data: ->
      Router.go "dashboard"
      Session.set "subHeaderState","closed"
      Session.set "leftSidebarState","closed"
      Session.set "leftSidebarToggleState","closed"
      Session.set "rightSidebarState","closed"
      Session.set "rightSidebarToggleState","closed"

  @route "dashboard",
    path: "/dashboard/:section?/:assetsInfo?"
    yieldTemplates:
      header:
        to: "header"
      subHeader:
        to: "subHeader"
      leftSidebar:
        to: "leftSidebar"
      rightSidebar:
        to: "rightSidebar"
    data: ->
      Session.set "subHeaderState","closed"
      Session.set "leftSidebarState","closed"
      Session.set "leftSidebarToggleState","closed"
      Session.set "rightSidebarState","closed"
      Session.set "rightSidebarToggleState","closed"
      Session.set "activeHeaderPath","dashboard"

  @route "fields",
    path: "/fields/:section?/:assetsInfo?"
    yieldTemplates:
      header:
        to: "header"
      subHeader:
        to: "subHeader"
      leftSidebar:
        to: "leftSidebar"
      rightSidebar:
        to: "rightSidebar"
    data: ->
      Session.set "subHeaderState","open"
      Session.set "activeHeaderPath","fields"
      Session.set "notice","field-boundary"
      if !@params.section
        Router.go "fields",
          section: "field-info"
      else
        Session.set "activeSubheaderPath",@params.section

      if !@params.assetsInfo
        Session.set "activeSidebarPath",undefined
        #Session.set "activeSidebarPath",undefined
        #if Session.equals "activeSidebarPath",undefined
        #  Session.set "activeSidebarPath","370"
        #if !Session.equals "activeSidebarPath","370"
        #  Session.set "activeSidebarPath","370"
      else
        Session.set "activeSidebarPath",@params.assetsInfo

      #Fields Info
      if @params.section is "field-info"
        Session.set "leftSidebarState","open"
        Session.set "leftSidebarToggleState","open"
        if !@params.assetsInfo
          Session.set "rightSidebarState","closed"
          Session.set "rightSidebarToggleState","closed"
        else
          Session.set "rightSidebarState","open"
          Session.set "rightSidebarToggleState","open"

      #Soil Testing
      if @params.section is "soil-testing"
        Session.set "leftSidebarState","open"
        Session.set "leftSidebarToggleState","open"
        Session.set "rightSidebarState","closed"
        Session.set "rightSidebarToggleState","closed"

      #Fertility Map
      if @params.section is "fertility-map"
        Session.set "leftSidebarState","open"
        Session.set "leftSidebarToggleState","open"
        Session.set "rightSidebarState","open"
        Session.set "rightSidebarToggleState","open"

      #RX Rates
      if @params.section is "rx-rates"
        Session.set "leftSidebarState","open"
        Session.set "leftSidebarToggleState","open"
        Session.set "rightSidebarState","open"
        Session.set "rightSidebarToggleState","open"

      #RX Files
      if @params.section is "rx-files"
        Session.set "leftSidebarState","open"
        Session.set "leftSidebarToggleState","open"
        Session.set "rightSidebarState","closed"
        Session.set "rightSidebarToggleState","closed"

      #Yield Reports
      if @params.section is "yield-report"
        Session.set "leftSidebarState","open"
        Session.set "leftSidebarToggleState","open"
        Session.set "rightSidebarState","closed"
        Session.set "rightSidebarToggleState","closed"

  @route "equipment",
    path: "/equipment/:section?/:assetsInfo?"
    yieldTemplates:
      header:
        to: "header"
      subHeader:
        to: "subHeader"
      leftSidebar:
        to: "leftSidebar"
      rightSidebar:
        to: "rightSidebar"
    data: ->
      Session.set "subHeaderState","open"
      Session.set "leftSidebarState","open"
      Session.set "leftSidebarToggleState","open"
      Session.set "rightSidebarState","open"
      Session.set "rightSidebarToggleState","open"
      Session.set "activeHeaderPath","equipment"
      if !@params.section
        Router.go "equipment",
          section: "equipment-info"
          #assetsInfo: "1337"
      else
        Session.set "activeSubheaderPath",@params.section
        Session.set "equipmentType","Select Equipment Type"

      if !@params.assetsInfo
        Session.set "activeSidebarPath",undefined
      else
        Session.set "activeSidebarPath",@params.assetsInfo
        Session.set "equipmentType","Seeding System"

  @route "market",
    path: "/market/:section?/:assetsInfo?"
    yieldTemplates:
      header:
        to: "header"
      subHeader:
        to: "subHeader"
      leftSidebar:
        to: "leftSidebar"
      rightSidebar:
        to: "rightSidebar"
    data: ->
      Session.set "subHeaderState","open"
      Session.set "activeHeaderPath","market"
      if !@params.section
        Router.go "market",
          section: "profit"
      else
        Session.set "activeSubheaderPath",@params.section

      if !@params.assetsInfo
        #Session.set "activeSidebarPath","1221"
      else
        Session.set "activeSidebarPath",@params.assetsInfo

      #Profit
      if @params.section is "profit"
        Session.set "leftSidebarState","open"
        Session.set "leftSidebarToggleState","open"
        Session.set "rightSidebarState","closed"
        Session.set "rightSidebarToggleState","closed"
        if !@params.assetsInfo
          Session.set "activeSidebarPath",undefined

      #Revenue & Expenses
      if @params.section is "revenue-and-expenses"
        Session.set "leftSidebarState","open"
        Session.set "leftSidebarToggleState","open"
        Session.set "rightSidebarState","closed"
        Session.set "rightSidebarToggleState","closed"
        if !@params.assetsInfo
          Session.set "activeSidebarPath","1221"
      #Hedge Plan
      if @params.section is "hedge-plan"
        Session.set "leftSidebarState","open"
        Session.set "leftSidebarToggleState","open"
        Session.set "rightSidebarState","open"
        Session.set "rightSidebarToggleState","open"
        if !@params.assetsInfo
          Session.set "activeSidebarPath","1221"

      #Positions
      if @params.section is "positions"
        Session.set "leftSidebarState","open"
        Session.set "leftSidebarToggleState","open"
        Session.set "rightSidebarState","closed"
        Session.set "rightSidebarToggleState","closed"
        if !@params.assetsInfo
          Session.set "activeSidebarPath","1221"

      #Research
      if @params.section is "research"
        Session.set "leftSidebarState","open"
        Session.set "leftSidebarToggleState","open"
        Session.set "rightSidebarState","closed"
        Session.set "rightSidebarToggleState","closed"
        if !@params.assetsInfo
          Session.set "activeSidebarPath","1221"

  @route "farm-planner",
    path: "/farm-planner/:section?/:assetsInfo?"
    yieldTemplates:
      header:
        to: "header"
      subHeader:
        to: "subHeader"
      leftSidebar:
        to: "leftSidebar"
      rightSidebar:
        to: "rightSidebar"
    data: ->
      Session.set "subHeaderState","open"
      Session.set "activeHeaderPath","farm-planner"
      Session.set "noticeHidden",false
      Session.set "notice","field-boundary"
      if !@params.section
        Session.set "rightSidebarState","closed"
        Router.go "farm-planner",
          section: "crop-plans"
      else
        Session.set "activeSubheaderPath",@params.section

      if !@params.assetsInfo
        Session.set "activeSidebarPath",undefined
      else
        Session.set "activeSidebarPath",@params.assetsInfo

      #Crop Plans
      if @params.section is "crop-plans"
        Session.set "leftSidebarState","open"
        Session.set "leftSidebarToggleState","open"
        if !@params.assetsInfo
          Session.set "rightSidebarState","closed"
          Session.set "rightSidebarToggleState","closed"
        else
          Session.set "rightSidebarState","open"
          Session.set "rightSidebarToggleState","open"

      #Revenue and Expenses
      if @params.section is "revenue-and-expenses"
        Session.set "leftSidebarState","open"
        Session.set "leftSidebarToggleState","open"
        Session.set "rightSidebarState","closed"
        Session.set "rightSidebarToggleState","closed"

      #Market Plan
      if @params.section is "market-plan"
        Session.set "leftSidebarState","open"
        Session.set "leftSidebarToggleState","open"
        Session.set "rightSidebarState","closed"
        Session.set "rightSidebarToggleState","closed"

      #Work Orders
      if @params.section is "work-orders"
        Session.set "leftSidebarState","open"
        Session.set "leftSidebarToggleState","open"
        Session.set "rightSidebarState","closed"
        Session.set "rightSidebarToggleState","closed"

  @route "profile",
    path: "/profile/:section?/:assetsInfo?"
    yieldTemplates:
      header:
        to: "header"
      subHeader:
        to: "subHeader"
      leftSidebar:
        to: "leftSidebar"
      rightSidebar:
        to: "rightSidebar"
    data: ->
      Session.set "subHeaderState","closed"
      Session.set "leftSidebarState","closed"
      Session.set "leftSidebarToggleState","closed"
      Session.set "rightSidebarState","open"
      Session.set "rightSidebarToggleState","closed"
      Session.set "activeHeaderPath","profile"

  @route "help",
    path: "/help/:section?/:assetsInfo?"
    yieldTemplates:
      header:
        to: "header"
      subHeader:
        to: "subHeader"
      leftSidebar:
        to: "leftSidebar"
      rightSidebar:
        to: "rightSidebar"

if Meteor.isClient
  @toggleCover = () ->
    if Session.equals("coverHidden",false)
      Session.set("coverHidden",true)
    else
      Session.set("coverHidden",false)

  @toggleNotice = () ->
    if Session.equals("noticeHidden",false)
      Session.set("noticeHidden",true)
    else
      Session.set("noticeHidden",false)

  initMap = () ->
    map = undefined
    fbLayer = undefined
    @SelectionFieldChanged = (fieldId,customerId) ->
      #console.log "Called!"
      fbLayer.clearSelection()
      queryString = undefined
      if fieldId is 0
        queryString = "CustomerId=#{customerId}"
        #console.log "queryString: ",queryString
        SetZoomExtent2Features queryString, 2.0, 0
      else
        queryString = "CustomerId=#{customerId} And Field_Id=#{fieldId}"
        #console.log "queryString: ",queryString
        SetZoomExtent2Features queryString, 1.0, 1

    @SetZoomExtent2Features = (QueryString, expandFactor, showSelected) ->
      query = new esri.tasks.Query()
      query.where = QueryString
      if showSelected is 1
        fbLayer.clearSelection()
        select = fbLayer.selectFeatures(query, esri.layers.FeatureLayer.SELECTION_NEW)

      #query.outSpatialReference = 102100;
      fbLayer.queryFeatures query, (featureSet) ->
        data = []
        data = featureSet.features  if featureSet and featureSet.features and featureSet.features.length > 0
        zoomExtent = esri.graphicsExtent(data)
        map.setExtent zoomExtent.expand(expandFactor)

    #map.infoWindow.show(zoomExtent.getCenter(), map.getInfoWindowAnchor(zoomExtent.getCenter()));
    #define.amd.$ = true
    require ["esri/map", "esri/dijit/BasemapGallery", "esri/arcgis/utils", "dojo/parser", "esri/dijit/Scalebar", "esri/lang", "dijit/TooltipDialog", "dijit/popup", "dojo/dom-style", "esri/layers/FeatureLayer", "dojo/dom-class", "dojo/dom-construct", "dojo/on", "dijit/layout/BorderContainer", "dijit/layout/ContentPane", "dijit/TitlePane", "dojo/domReady!"], (Map, BasemapGallery, arcgisUtils, parser, Scalebar, esriLang, TooltipDialog, dijitPopup, domStyle, FeatureLayer, domClass, domConstruct, theme) ->

      #infoWindow: popup,
      # spatialReference:102100

      #apply custom theme to popup. The custom popup theme was defined using css
      #to specify new colors, fonts etc for the popup
      #We've also modified the default popup image used for the popup pointers to
      #match the new color scheme.

      #close the dialog when the mouse leaves the highlight graphic

      #map.graphics.on("mouse-out", closeDialog);

      #listen for when the onMouseOver event fires on the countiesGraphicsLayer
      #when fired, create a new graphic with the geometry from the event.graphic and add it to the maps graphics layer
      closeDialog = ->

        # map.graphics.clear();
        dijitPopup.close dialog
      parser.parse()
      map = new Map("map",
        basemap: "hybrid"
        center: [-113, 51]
        zoom: 6
      )
      domClass.add map.infoWindow.domNode, "myTheme"
      fbLayerUrl = "http://ec2-54-214-245-29.us-west-2.compute.amazonaws.com:6080/arcgis/rest/services/test/fieldboundary/FeatureServer/0"
      token = "q8IKfatL4eFiLk-Ys-Wy_gts-3vJ8Pdd0mLGiUHpQ3wM3Eq2f-lIwoyVBYQ32gy9"
      fbLayerSecureUrl = fbLayerUrl + "?token=" + token
      fbLayer = new FeatureLayer(fbLayerSecureUrl,
        mode: FeatureLayer.MODE_SNAPSHOT
        outFields: ["*"]
        id: "fbLayer"
      )
      CustomerID_Selected = undefined
      CustomerID_Selected = 11390976
      fbLayer.setDefinitionExpression "CustomerId = " + CustomerID_Selected
      QueryString = "1=1"
      SetZoomExtent2Features QueryString, 2.0, 0
      fieldsSelectionSymbol = new esri.symbol.SimpleFillSymbol().setColor(new dojo.Color([255, 255, 0, 0.5]))
      fieldsSelectionSymbol.setOutline new esri.symbol.SimpleLineSymbol("dashdot", new dojo.Color([255, 0, 0]), 2)
      fbLayer.setSelectionSymbol fieldsSelectionSymbol
      map.addLayers [fbLayer]
      dialog = new TooltipDialog(
        id: "tooltipDialog"
        style: "position: absolute; width: 125px; font: normal normal normal 8pt Helvetica;z-index:100"
      )
      dialog.startup()
      map.on "load", ->
        map.graphics.enableMouseEvents()

      fbLayer.on "mouse-over", (evt) ->
        t = "<b>${Legal_Desc}</b><hr><b>Acreage: </b>${Acreage:NumberFormat}"
        content = esriLang.substitute(evt.graphic.attributes, t)
        dialog.setContent content
        domStyle.set dialog.domNode, "opacity", 0.85
        dijitPopup.open
          popup: dialog
          x: evt.pageX
          y: evt.pageY


      fbLayer.on "mouse-out", closeDialog
      scalebar = new Scalebar(
        map: map

        # "dual" displays both miles and kilmometers
        # "english" is the default, which displays miles
        # use "metric" for kilometers
        scalebarUnit: "dual"
      )

      #add the basemap gallery, in this case we'll display maps from ArcGIS.com including bing maps
      basemapGallery = new BasemapGallery(
          showArcGISBasemaps: true
          map: map
        , "basemapGallery")
        basemapGallery.startup()
        basemapGallery.on "error", (msg) ->
          console.log "basemap gallery error:  ", msg

  Router.configure
    layoutTemplate: "layout"
    #notFoundTemplate: "notFound"
    #loadingTemplate: "loading"

    @Subscriptions =
      fields: Meteor.subscribe "allFields"
      market: Meteor.subscribe "allMarket"
      equipment: Meteor.subscribe "allEquipment"
      inventories: Meteor.subscribe "allInventories"
      notes: Meteor.subscribe "allNotes"
      workOrders: Meteor.subscribe "allWorkOrders"
      users: Meteor.subscribe "allUsers"

  Meteor.startup ->
    #console.log $(document)
    Session.setDefault "subHeaderState","open"
    Session.setDefault "mapState","open"
    Session.setDefault "leftSidebarToggleState","open"
    Session.setDefault "rightSidebarToggleState","open"
    Session.setDefault "leftSidebarState","open"
    Session.setDefault "rightSidebarState","open"
    Session.setDefault "coverHidden",true
    Session.setDefault "noticeHidden",false
    Session.setDefault "fieldsFilter","All Fields - 2013"
    Session.setDefault "equipmentFilter","All Equipment"
    Session.setDefault "marketFilter","All Commodities"
    Session.setDefault "farm-plannerFilter","Farm Planner 2013"
    Session.setDefault "positionType","Future"
    Session.setDefault "equipmentType","Select Equipment Type"
    Session.setDefault "positionCommodity","Canola"
    Session.setDefault "activeTile","compareYield"
    Session.setDefault "dropdownState","closed"
    Session.setDefault "fieldEditMode","view"
    Session.setDefault "toolbarState","alert"

    Template.layout.rendered = ->
      datepickers = this.findAll(".datepicker")
      $(datepickers).datepicker()
      selectize = $("select").selectize()
      #Set up select change event listener
      selectize.on("change",()->
        currentTarget = $(this)
        action = currentTarget.attr("data-action")
        if action is "setPositionCommodity"
          Session.set "positionCommodity",currentTarget.attr("value")
          Session.set "positionType",undefined
        if action is "setPositionType"
          Session.set "positionType",currentTarget.attr("value")
        if action is "setEquipmentType"
          console.log "CHANGING!"
          console.log currentTarget.attr("value")
          Session.set "equipmentType",currentTarget.attr("value")
      )
      textareas = $(this.findAll(".expanding"))
      if textareas.length isnt 0
        textareas.expandingTextarea()

      $(".stubImage").waitForImages({
        finished: ->
          loadingSpinner.stop()
        each: ->
          console.log "Each Image"
        waitForAll: true
      })

    Template.layout.events
      #Disable dropdown when the user clicks outside the region
      "click .header, click .subHeader, click .sidebar, click .content":(e,t)->
        Session.set "dropdownState","closed"
      "click [data-action='uploadFile']":(e,t)->
        #console.log "uploadFile called!"
        $("input[type=file]").trigger("click");
      "click [data-action='toggleDropdown']":(e,t)->
        if Session.equals "dropdownState","open"
          Session.set "dropdownState","closed"
        else
          Session.set "dropdownState","open"
      "click [data-action='toggleCover']":(e,t)->
        e.stopImmediatePropagation()
        console.log "toggleCover clicked!"
        currentTarget = $(e.currentTarget)
        cover = currentTarget.data("cover")
        #If there's a cover data-attribute, set the current cover to be that ID
        Session.set("cover",cover) if cover?
        toggleCover()
      "click [data-action='toggleNotice']":(e,t)->
        e.stopImmediatePropagation()
        console.log "toggleNotice clicked!"
        currentTarget = $(e.currentTarget)
        notice = currentTarget.data("notice")
        #If there's a cover data-attribute, set the current cover to be that ID
        Session.set("notice",notice) if notice?
        toggleNotice()
      "click [data-action='setNotice']":(e,t)->
        currentTarget = $(e.currentTarget)
        notice = currentTarget.data("notice")
        Session.set("notice",notice) if notice?
      "click .coverContent":(e,t)->
        e.stopImmediatePropagation()
      "click [data-action='toggle']":(e,t)->
        currentTarget = $(e.currentTarget)
        state = currentTarget.attr("data-state")
        if state is "yes"
          console.log "Yes"
          currentTarget.attr("data-state","no")
        else
          console.log "No"
          currentTarget.attr("data-state","yes")
      "click [data-action='changeTile']":(e,t)->
        currentTarget = $(e.currentTarget)
        tile = currentTarget.attr("data-tile")
        console.log("tile",tile)
        console.log("this:",this)
        Session.set "activeTile",tile
      "click [data-action='setToolbar']":(e,t)->
        console.log "setToolbar"
        currentTarget = $(e.currentTarget)
        console.log currentTarget
        toolbar = currentTarget.attr("data-toolbar")
        console.log "TOOLBAR!",toolbar
        Session.set "toolbarState",toolbar

    Template.spinner.rendered = ->
      opts =
        lines: 10 # The number of lines to draw
        length: 0 # The length of each line
        width: 10 # The line thickness
        radius: 30 # The radius of the inner circle
        corners: 1 # Corner roundness (0..1)
        rotate: 0 # The rotation offset
        direction: 1 # 1: clockwise, -1: counterclockwise
        color: "#000" # #rgb or #rrggbb
        speed: 1 # Rounds per second
        trail: 50 # Afterglow percentage
        shadow: false # Whether to render a shadow
        hwaccel: true # Whether to use hardware acceleration
        className: "spinner" # The CSS class to assign to the spinner
        zIndex: 2e9 # The z-index (defaults to 2000000000)
        #top: "auto" # Top position relative to parent in px
        #left: "auto" # Left position relative to parent in px

      target = document.getElementById("spinner")
      window.loadingSpinner = new Spinner(opts)
      loadingSpinner.spin(target)

    Template.map.rendered = ->
      console.log "Map rendered!"
      mapRoot = this.findAll("#map_root")
      #console.log "mapRoot: ",mapRoot
      #ESRI Map Rendering Code
      #Automatically authenticate to ESRI and submit the form so that I don't
      #have to manually enter their fucking bullshit every time
      #If instance of map already created, don't init.
      if mapRoot.length is 0
        initMap()
      Meteor.setTimeout(()->
        #Set form values
        $("#dijit_form_ValidationTextBox_0").val("MFMUser")
        $("#dijit_form_ValidationTextBox_1").val("MFMF@rming")
        $("#dijit_form_Button_0_label").click()
      ,5000)

    Template.cover.rendered = ->
      textareas = $(this.findAll(".expanding"))
      if textareas.length isnt 0
        textareas.expandingTextarea()

    Template.leftSidebar.events
      "click .sidebarNotch":(e,t)->
        if Session.equals "leftSidebarState","open"
          Session.set "leftSidebarState","closed"
        else
          Session.set "leftSidebarState","open"
      "click [data-action='changeField']":(e,t)->
        #e.preventDefault()
        console.log "changeField clicked"
        currentTarget = $(e.currentTarget)
        fieldId = currentTarget.data("field-id")
        #Hard coded customerId for the time being
        customerId = 11390976
        SelectionFieldChanged(fieldId,customerId)
      "click [data-action='changeFilter']":(e,t)->
        e.preventDefault()
        currentTarget = $(e.currentTarget)
        filter = currentTarget.data("filter")
        console.log "filter: ",filter
        #Get the current site context
        context = Router.current().template
        console.log "context: ",context
        #Set the context appropriate filter
        Session.set "#{context}Filter",filter

    Template.rightSidebar.events
      "click [data-action='toggleFieldDetails']":(e,t)->
        if Session.equals "fieldEditMode","edit"
          Session.set "fieldEditMode","view"
        else
          Session.set "fieldEditMode","edit"
      "click .sidebarNotch":(e,t)->
        if Session.equals "rightSidebarState","open"
          Session.set "rightSidebarState","closed"
        else
          Session.set "rightSidebarState","open"

    Template.layout.preserve({
      ".sidebar.left"
      ".sidebar.right"
      ".sidebarToggle.left"
      ".sidebarToggle.right"
      ".subHeader"
      ".content"
      ".cover"
      ".coverContent"
      ".mapHolder"
    })

    Template.groupedBarChart.rendered = ->
      margin =
        top: 20
        right: 20
        bottom: 30
        left: 40

      width = 960 - margin.left - margin.right
      height = 500 - margin.top - margin.bottom
      x0 = d3.scale.ordinal().rangeRoundBands([0, width], .1)
      x1 = d3.scale.ordinal()
      y = d3.scale.linear().range([height, 0])
      color = d3.scale.ordinal().range(["#98abc5", "#8a89a6", "#7b6888", "#6b486b", "#a05d56", "#d0743c", "#ff8c00"])
      xAxis = d3.svg.axis().scale(x0).orient("bottom")
      yAxis = d3.svg.axis().scale(y).orient("left").tickFormat(d3.format(".2s"))
      svg = d3.select(".groupedBarChart").append("svg").attr("width", width + margin.left + margin.right).attr("height", height + margin.top + margin.bottom).append("g").attr("transform", "translate(" + margin.left + "," + margin.top + ")")
      d3.csv "/data/compareYield.csv", (error, data) ->
        ageNames = d3.keys(data[0]).filter((key) ->
          key isnt "State"
        )
        data.forEach (d) ->
          d.ages = ageNames.map((name) ->
            name: name
            value: +d[name]
          )

        x0.domain data.map((d) ->
          d.State
        )
        x1.domain(ageNames).rangeRoundBands [0, x0.rangeBand()]
        y.domain [0, d3.max(data, (d) ->
          d3.max d.ages, (d) ->
            d.value

        )]
        svg.append("g").attr("class", "x axis").attr("transform", "translate(0," + height + ")").call xAxis
        svg.append("g").attr("class", "y axis").call(yAxis).append("text").attr("transform", "rotate(-90)").attr("y", 6).attr("dy", ".71em").style("text-anchor", "end").text "Population"
        state = svg.selectAll(".state").data(data).enter().append("g").attr("class", "g").attr("transform", (d) ->
          "translate(" + x0(d.State) + ",0)"
        )
        state.selectAll("rect").data((d) ->
          d.ages
        ).enter().append("rect").attr("width", x1.rangeBand()).attr("x", (d) ->
          x1 d.name
        ).attr("y", (d) ->
          y d.value
        ).attr("height", (d) ->
          height - y(d.value)
        ).style "fill", (d) ->
          color d.name

        legend = svg.selectAll(".legend").data(ageNames.slice().reverse()).enter().append("g").attr("class", "legend").attr("transform", (d, i) ->
          "translate(0," + i * 20 + ")"
        )
        legend.append("rect").attr("x", width - 18).attr("width", 18).attr("height", 18).style "fill", color
        legend.append("text").attr("x", width - 24).attr("y", 9).attr("dy", ".35em").style("text-anchor", "end").text (d) ->
          d

    Template.stackedAreaChart.rendered = ->
      margin =
        top: 20
        right: 20
        bottom: 30
        left: 50

      width = 960 - margin.left - margin.right
      height = 500 - margin.top - margin.bottom
      parseDate = d3.time.format("%y-%b-%d").parse
      formatPercent = d3.format(".0%")
      x = d3.time.scale().range([0, width])
      y = d3.scale.linear().range([height, 0])
      color = d3.scale.category20()
      xAxis = d3.svg.axis().scale(x).orient("bottom")
      yAxis = d3.svg.axis().scale(y).orient("left").tickFormat(formatPercent)
      area = d3.svg.area().x((d) ->
        x d.date
      ).y0((d) ->
        y d.y0
      ).y1((d) ->
        y d.y0 + d.y
      )
      stack = d3.layout.stack().values((d) ->
        d.values
      )
      svg = d3.select(".stackedAreaChart").append("svg").attr("width", width + margin.left + margin.right).attr("height", height + margin.top + margin.bottom).append("g").attr("transform", "translate(" + margin.left + "," + margin.top + ")")
      d3.csv "/data/hedgePlan.csv", (error, data) ->
        color.domain d3.keys(data[0]).filter((key) ->
          key isnt "date"
        )
        data.forEach (d) ->
          d.date = parseDate(d.date)

        browsers = stack(color.domain().map((name) ->
          name: name
          values: data.map((d) ->
            date: d.date
            y: d[name] / 100
          )
        ))
        x.domain d3.extent(data, (d) ->
          d.date
        )
        browser = svg.selectAll(".browser").data(browsers).enter().append("g").attr("class", "browser")
        browser.append("path").attr("class", "area").attr("d", (d) ->
          area d.values
        ).style "fill", (d) ->
          color d.name

        browser.append("text").datum((d) ->
          name: d.name
          value: d.values[d.values.length - 1]
        ).attr("transform", (d) ->
          "translate(" + x(d.value.date) + "," + y(d.value.y0 + d.value.y / 2) + ")"
        ).attr("x", -6).attr("dy", ".35em").text (d) ->
          d.name

        svg.append("g").attr("class", "x axis").attr("transform", "translate(0," + height + ")").call xAxis
        svg.append("g").attr("class", "y axis").call yAxis
