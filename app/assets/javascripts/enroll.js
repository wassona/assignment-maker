document.addEventListener('DOMContentLoaded', function() {
	



	if (document.querySelector('.enroll-unenroll')) {
		
		document.querySelectorAll('.enroll').forEach(function(el){
			el.addEventListener('click', enrollSwap, false);
		})

		document.querySelectorAll('.unenroll').forEach(function(el){
			el.addEventListener('click', unenrollSwap, false);
		})


		function enrollSwap(event){
			var currentButton = event.currentTarget,
				parent = event.currentTarget.parentNode,
				newButton = parent.querySelector('.unenroll').cloneNode(true);
			
			parent.replaceChild(newButton, currentButton);
			newButton.addEventListener('click', unenrollSwap, false);
		}

		function unenrollSwap(event){
			var currentButton = event.currentTarget,
				parent = event.currentTarget.parentNode,
				newButton = parent.querySelector('.enroll').cloneNode(true);
			
			parent.replaceChild(newButton, currentButton);
			newButton.addEventListener('click', enrollSwap, false);
		}

	}
});