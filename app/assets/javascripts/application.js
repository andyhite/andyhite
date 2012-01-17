/*
 *= require jquery
 *= require bootstrap-modal
*/

$('.modal').modal('show');
$('.modal .js-dismiss').click(function(){
  $('.modal').modal('hide');
})

$(document).keypress(function(e){
  if (e.keyCode == 13) $('.modal').modal('hide');
});
