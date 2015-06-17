require "opal"
require 'opal-jquery'

Document.ready? do
  title = Element.find('#title')
  title.html = "<h1>ASCII Character Lookup Tool</h1>"

  
  body = Element.find('#body')
  body.html = "<p>Type any character and the code will be shown below</p>"
  
  html = Element.find('html')
  lookup = Element.find('#lookup')
  keypressed = Element.find('#keypressed')
  twit = Element.find('#twit')
  twits = ''
  
  HTTP.get("https://jinthepimp.herokuapp.com/api/twits") do |res|
    twits = res.json['twitsCollection']
  end
  
  html.on(:keydown) do |evt|
    chrcode = evt.which    
    key = `String.fromCharCode(chrcode)`
    keypressed.text = key
    lookup.text = chrcode
    twit.text = twits.sample
  end
end