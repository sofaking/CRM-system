# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('input[type=checkbox]').click ->
    $('label#' + this.value).attr('style',
      if this.checked
        'color:red'
      else
        ''
    )