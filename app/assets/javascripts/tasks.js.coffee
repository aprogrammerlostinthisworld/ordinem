# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
dates = $("#from, #to").datepicker(
  dateFormat: "yy-mm-dd"
  defaultDate: "+1w"
  changeMonth: true
  changeYear: true
  onSelect: (selectedDate) ->
    option = (if @id is "from" then "minDate" else "maxDate")
    instance = $(this).data("datepicker")
    date = $.datepicker.parseDate(instance.settings.dateFormat or $.datepicker._defaults.dateFormat, selectedDate, instance.settings)
    dates.not(this).datepicker "option", option, date
)
