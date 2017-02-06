document.addEventListener('DOMContentLoaded', function() {
	if (document.querySelector('#s-a-dialog')){
		
		let dialog = document.querySelector('#s-a-dialog');
	    let showDialogButtons = document.querySelectorAll('.show-s-a-dialog');
	    if (! dialog.showModal) {
	      dialogPolyfill.registerDialog(dialog);
	    }
	    showDialogButtons.forEach(function(el){
	    	el.addEventListener('click', function(e) {
	     		document.querySelector('#student-id').value = e.currentTarget.getAttribute('data-student-id');
	      		dialog.showModal();
	      	});
	    });
	    dialog.querySelectorAll('.close-s-a').forEach(function(el){
	    	el.addEventListener('click', function(e) {
	      		dialog.close();
	      	});
	    });


	}

});