//= require jquery
//= require rails-ujs
//= require_tree ./modules
//= require cocoon

$(function(){
  var headerHeight = $('header').outerHeight();
  $('#slide-menu').css('margin-top', headerHeight + 'px');

  $('.menu-trigger').on('click', function(){
    if($(this).hasClass('active')){
      $(this).removeClass('active');
      $('#slide-menu').removeClass('open');
    } else {
      $(this).addClass('active');
      $('#slide-menu').addClass('open');
    }
  });
});