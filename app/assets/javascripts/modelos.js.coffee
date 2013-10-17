# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->

  $("#accordionTopico").click ->
    idTopico = "#" + $(this).children(".panel.panel-success").children(".panel-collapse.collapse").attr "id"