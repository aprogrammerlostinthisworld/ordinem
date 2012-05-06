jQuery ->
  $("a[rel=popover]").popover()
  $(".tooltip").tooltip()
  $("a[rel=tooltip]").tooltip()
  
($ "a[data-toggle=modal]").click ->
  target = ($ @).attr('data-target')
  url = ($ @).attr('href')
  ($ target).load(url)
