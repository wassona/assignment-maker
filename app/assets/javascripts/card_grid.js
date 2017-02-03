document.addEventListener('DOMContentLoaded', function() {

	if(document.querySelector('.card-grid')){
		console.log(1);
		document.querySelectorAll('.remote-delete-card').forEach(function(el){
			el.addEventListener('click', function(){
				el.parentNode.parentNode.parentNode.remove();
			}, false);
		});
	}
});