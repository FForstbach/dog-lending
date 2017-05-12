$(document).ready(function(){

var $messages = $('#all-messages');

if ($messages.length == 0)
  return;

window.refreshCall = function() {

  $.get( window.location.href, function( data ) {
    data = $(data).find('#all-messages').html();

    $messages.html( data );
  });

};

setInterval(window.refreshCall, 5000);

});
