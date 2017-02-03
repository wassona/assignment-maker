document.addEventListener('DOMContentLoaded', function() {
	if (document.querySelector('#c-a-dialog')){
		
		// modal display, hide, and polyfill functions

		let cADialog = document.querySelector('#c-a-dialog');  // ca is course assignments
	    let showCADialogButton = document.querySelector('#show-c-a-dialog');
	    if (! cADialog.showModal) {
	      dialogPolyfill.registerDialog(cADialog);
	    }
	    showCADialogButton.addEventListener('click', function() {
	      document.querySelector('#assignment-buffer').innerHTML = document.querySelector('.excluded-assignments').innerHTML;
	      cADialog.showModal();
	      attachDialogListeners();
	    });
	    


	    // ca specific code
	    function attachDialogListeners(){
		    let includedAssignments = [].slice.call(document.querySelector('.included-assignments--dialog').children),
		    	excludedAssignments = [].slice.call(document.querySelector('.excluded-assignments').children);

		    	// [].slice.call turns the HTMLCollection into an array


		    includedAssignments.forEach(function(el){
		    	el.addEventListener('click', removeAssignment, false);
		    });

		    excludedAssignments.forEach(function(el){
		    	el.addEventListener('click', addAssignment, false);
		    });
		}

	    function removeAssignment(e){
	    	// let assignmentId = e.currentTarget.getAttribute('data-assignment-id');

	    	// document.querySelectorAll('[data-assignment-id=' + "'" + assignmentId + "'" + ']').forEach(function(el){
	    	// 	el.remove();
	    	// });

	    	e.currentTarget.querySelector('i').textContent = 'control_point';
	    	document.querySelector('.excluded-assignments').appendChild(e.currentTarget);
	    	e.currentTarget.removeEventListener('click', removeAssignment);
	    	e.currentTarget.addEventListener('click', addAssignment, false);
	    };

	    function addAssignment(e){
	    	e.currentTarget.querySelector('i').textContent = 'cancel';
	    	document.querySelector('.included-assignments--dialog').appendChild(e.currentTarget);
	    	e.currentTarget.removeEventListener('click', addAssignment);
	    	e.currentTarget.addEventListener('click', removeAssignment, false);

	    }

	    cADialog.querySelector('.save').addEventListener('click', function() {
		    let includedAssignments = [].slice.call(document.querySelector('.included-assignments--dialog').children),
		    	result = [];
		    includedAssignments.forEach(function(el){
		    	result.push(el.getAttribute('data-assignment-id'));
		    });
		    cADialog.querySelector('#updated-course-assignments').value = JSON.stringify(result);

	    	document.querySelector('.included-assignments').innerHTML = document.querySelector('.included-assignments--dialog').innerHTML;
			document.querySelectorAll('.included-assignments i').forEach(function(el){
	    		el.textContent = "find_in_page";
	    	});
	    	document.querySelector('#assignment-buffer').innerHTML = document.querySelector('.excluded-assignments').innerHTML;
	    	cADialog.close();
	    	addAssignmentLinks();


	    });

	    cADialog.querySelector('.discard').addEventListener('click', function() {
	    	document.querySelector('.included-assignments--dialog').innerHTML = document.querySelector('.included-assignments').innerHTML;
	    	document.querySelectorAll('.included-assignments--dialog i').forEach(function(el){
	    		el.textContent = "cancel";
	    	});
	    	document.querySelector('.excluded-assignments').innerHTML = document.querySelector('#assignment-buffer').innerHTML;

	    	cADialog.close();
	    });

	    function addAssignmentLinks() {
		    document.querySelectorAll('.included-assignments button').forEach(function(el){
		    	el.addEventListener('click', function(){
		    		location.assign('/assignments/' + el.parentNode.getAttribute('data-assignment-id'));
		    	});
		    });
		}

		addAssignmentLinks()


	}
});