# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "ready page:load", ->
  
  # page is now ready, initialize the calendar...

  $("#calendar").fullCalendar
    
    # put your options and callbacks here
    
    weekMode: "liquid"
    firstDay: 1
    timeFormat: "HH:mm{ - HH:mm} "
    
    eventSources: [
      url: "/events"
      color: "green"
      textColor: "black"
      ignoreTimezone: false
    ]
    
    eventClick: (event) ->
      if event.url
        window.open event.url
        false

    dayClick: (date, allDay, jsEvent, view) ->
      window.open "events/new?date=" + date, "_self"