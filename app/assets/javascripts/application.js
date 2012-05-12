// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui.min
//= require jquery.ui.datepicker-en-GB
//= require jquery.ui.datepicker-uk
//= require jquery.ui.datepicker-ru
//= require twitter/bootstrap
//= require_tree .

$(document).ready(function(){
  /* Your javascripts goes here... */
  $('#loginForm').bind('click', function (e) {
    e.stopPropagation()
  })
  $('.external').attr('target', '_blank'); //for textile link
  
  var query = location.href.split('#');
  if (query[1] == "invite") {
    $('#collaborations a[href="#invite"]').tab('show'); 
  }

  
  $('.delete_task').bind('ajax:success', function() {  
    $(this).closest('.task').fadeOut().remove();  
  }); 
  
  $("#btn-all").click(function(){
    $("#tasks").children().slideDown();  
  });
  $("#btn-completed").click(function(){
    $("#tasks").children(".task_complete").slideDown();  
    $("#tasks").children(".task_incomplete").slideUp();  
  });
  $("#btn-incompleted").click(function(){
    $("#tasks").children(".task_incomplete").slideDown();  
    $("#tasks").children(".task_complete").slideUp();  
  });
  
  $('.typeahead').typeahead({
    source: function (typeahead, query) {
        return $.post('/typeahead', { query: query }, function (data) {
            return typeahead.process(data);
        });
    }
});
  
});

/*
$(document).scroll(function(){
    // If has not activated (has no attribute "data-top"
    if (!$('.subnav').attr('data-top')) {
        // If already fixed, then do nothing
        if ($('.subnav').hasClass('subnav-fixed')) return;
        // Remember top position
        var offset = $('.subnav').offset()
        $('.subnav').attr('data-top', offset.top);
    }

    if ($('.subnav').attr('data-top') - $('.subnav').outerHeight() <= $(this).scrollTop())
        $('.subnav').addClass('subnav-fixed');
    else
        $('.subnav').removeClass('subnav-fixed');
});
*/
