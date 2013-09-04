// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on('ready page:load', function() {

    // page is now ready, initialize the calendar...

    $('#calendar').fullCalendar({
        // put your options and callbacks here
		
		weekMode: 'liquid',
		firstDay: 1,

		eventSources: [{
          	url: '/events',
            color: 'yellow',
            textColor: 'black',
            ignoreTimezone: false
        }],
		
        eventClick: function(event) {
            if (event.url) {
                window.open(event.url);
                return false;
            }
        },
        
        dayClick: function(date, allDay, jsEvent, view) {
			window.open('events/new?date=' + date ,'_self');
		}
    });
});