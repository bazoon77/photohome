# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $('#conversation_recipients').tokenInput('/ajax/users',{theme: 'facebook',prePopulate: $('#letter_people_tokens').data('load')})