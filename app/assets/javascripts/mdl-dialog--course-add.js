
document.addEventListener('DOMContentLoaded', function() {

	if (document.querySelector('#a-c-dialog')){
		
		var dialog = document.querySelector('#a-c-dialog');
	    var showDialogButtons = document.querySelectorAll('.show-a-c-dialog');
	    if (! dialog.showModal) {
	      dialogPolyfill.registerDialog(dialog);
	    }
	    showDialogButtons.forEach(function(el){
	    	el.addEventListener('click', function(e) {
	    		var checkList = e.currentTarget.querySelector('.add-course-dialog-storage');
	    		var placeholder = document.createElement('span')
	    		placeholder.id = 'placeholder';
	    		checkList.parentNode.insertBefore(placeholder, checkList);

	     		document.querySelector('#add-course-dialog-body').appendChild(checkList);
	     		checkList.classList = "add-course-dialog-storage";
	      		dialog.showModal();
	      	});
	    });
	    dialog.querySelectorAll('.close-a-c').forEach(function(el){
	    	el.addEventListener('click', function(e) {
	    		var checkList = dialog.querySelector('.add-course-dialog-storage');
	    		checkList.classList = "add-course-dialog-storage none";
	    		var placeholder = document.getElementById('placeholder');
	    		placeholder.parentNode.insertBefore(checkList, placeholder);
	    		placeholder.remove();

	      		dialog.close();
	      	});
	    });


	}

});