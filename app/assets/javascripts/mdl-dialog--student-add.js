

document.addEventListener('DOMContentLoaded', function() {
	if (document.querySelector('#s-a-dialog')){
		
		var dialog = document.querySelector('#s-a-dialog');
	    var showDialogButtons = document.querySelectorAll('.show-s-a-dialog');
	    var closeDialogButtons = dialog.querySelectorAll('.close-s-a');
	    if (! dialog.showModal) {
	      dialogPolyfill.registerDialog(dialog);
	    }
	    showDialogButtons.forEach(function(el){
	    	el.addEventListener('click', function(e) {
	     		document.querySelector('#student-id').value = e.currentTarget.getAttribute('data-student-id');
	      		dialog.showModal();
	      	});
	    });
	    closeDialogButtons.forEach(function(el){
	    	el.addEventListener('click', function(e) {
	      		dialog.close();
	      	});
	    });


	}

});