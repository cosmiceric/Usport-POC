function loadPlayerInMainBody(card_id){
  $.post('/home/player_partial', {card_id: card_id}, function(data){
    $('#main-body').html(data);
  });
}

$(document).ready(function(){
	/* if (navigator.userAgent.match(/iPhone/i) || navigator.userAgent.match(/iPad/i)) {
	    var viewportmeta = document.querySelector('meta[name="viewport"]');
	    if (viewportmeta) {
	        viewportmeta.content = 'width=1024, minimum-scale=1.0, maximum-scale=1.0, initial-scale=1.0';
	        document.body.addEventListener('gesturestart', function () {
	            viewportmeta.content = 'width=1024, minimum-scale=1.0, maximum-scale=1.0';
	            console.log('gesturestart detected');
	        }, false);
	    }
	} */
});