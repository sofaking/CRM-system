# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('input[type=checkbox]').click ->
    this.form.submit.click()
  $('.form_todo').onsubmit ->
    this.form.submit.click()