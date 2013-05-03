# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $("#form_small").hide()
  $("#solve_small").click ->
    $("#solve_small").hide()
    $("#form_small").show()
  $("#form_large").hide()
  $("#solve_large").click ->
    $("#solve_large").hide()
    $("#form_large").show()
