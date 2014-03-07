Handlebars.registerHelper "icon", (context) ->
  #Only output if the template actually exists
  if typeof(Template[context + "Icon"]) is "function"
    new Handlebars.SafeString(Template[context + "Icon"]())
Handlebars.registerHelper "currentParamIs", (param,a,b) ->
  currentParam = Router.current().params[param]
  currentParam is a or currentParam is b
Handlebars.registerHelper "currentParamIsNot", (param,a,b) ->
  currentParam = Router.current().params[param]
  currentParam isnt a and currentParam isnt b
Handlebars.registerHelper "currentParam", (context) ->
  Router.current().params[context]
Handlebars.registerHelper "currentContext", (context) ->
  Router.current().template
Handlebars.registerHelper "currentContextIs", (context) ->
  Router.current().template is context
Handlebars.registerHelper "currentContextIsNot", (context) ->
  Router.current().template isnt context
Handlebars.registerHelper "coverIs", (context) ->
  Session.equals("cover",context)
Handlebars.registerHelper "getSession", (context) ->
  Session.get context
Handlebars.registerHelper "setSession", (context,value) ->
  Session.set context,value
Handlebars.registerHelper "equalsSession", (context,value) ->
  Session.equals context,value
Handlebars.registerHelper "notEqualsSession", (context,value) ->
  !Session.equals context,value
Handlebars.registerHelper "borderState", (context,value) ->
  if Router.current().template is "dashboard" or
    Router.current().params["section"] is "field-info" or
    Router.current().params["section"] is "fertility-map" or
    Router.current().params["section"] is "crop-plans"
      "collapsed"
    else
      "expanded"
Handlebars.registerHelper "backgroundState", (context,value) ->
  if Router.current().params["section"] is "revenue-and-expenses"
    "transparent"
  else
    null
