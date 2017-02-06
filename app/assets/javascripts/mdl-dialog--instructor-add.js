document.addEventListener('DOMContentLoaded', function() {

	if (document.querySelector('#i-a-dialog')){
		
		let dialog = document.querySelector('#i-a-dialog');
	    let showDialogButtons = document.querySelectorAll('.show-i-a-dialog');
	    let closeDialogButtons = dialog.querySelectorAll('.close-i-a');
	    if (! dialog.showModal) {
	      dialogPolyfill.registerDialog(dialog);
	    }
	    showDialogButtons.forEach(function(button){
	    	button.addEventListener('click', function(event) {

	      		dialog.querySelectorAll('.instructor-id').forEach(function(div){
	      			if( div.getAttribute('data-teacher-id') == button.getAttribute('data-teacher-id')) {
	      				div.classList = "instructor-id";
	      			} else {
	      				div.classList = "instructor-id display-none";
	      			};
	      		});
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