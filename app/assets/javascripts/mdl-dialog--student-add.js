document.addEventListener('DOMContentLoaded', function() {
	if (document.querySelector('#s-a-dialog')){
		
		let dialog = document.querySelector('#s-a-dialog');
	    let showDialogButtons = document.querySelectorAll('.show-s-a-dialog');
	    if (! dialog.showModal) {
	      dialogPolyfill.registerDialog(dialog);
	    }
	    showDialogButtons.forEach(function(el){
	    	el.addEventListener('click', function() {
	      		dialog.showModal();
	      	});
	    });
	    dialog.querySelector('.close').addEventListener('click', function() {
	      dialog.close();
	    });


	}
});