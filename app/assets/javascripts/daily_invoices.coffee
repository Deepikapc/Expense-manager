# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
   $('#daily_invoice_date').datepicker({
    dateFormat: "yy-mm-dd"
  })

  $('#exampleInputdate').datepicker({
    dateFormat: "yy-mm-dd"
  })
