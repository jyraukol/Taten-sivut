# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
 $(document).ready ->
  $(".present_line").click ->
    if $(this).find(".present_description").is(":hidden")
      $(this).find(".present_description").slideDown("slow")
    else
      $(this).find(".present_description").slideUp("slow")
