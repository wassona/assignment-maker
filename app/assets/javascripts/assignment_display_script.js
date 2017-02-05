document.addEventListener('DOMContentLoaded', function() {
	console.log('display');

	if(document.querySelector('#auto-label-wrapper')){
			labelData.forEach(function(div, index){
				var newLabel = document.createElement('label');
				var newInput = document.createElement('input');

				newLabel.style.height = div.height;
				newLabel.style.top = div.top;
				newLabel.className = 'auto-label';
				newInput.className = 'auto-input';
				newInput.addEventListener('keypress', function(event) {
			        if (event.keyCode == 13) {
			            event.preventDefault();
			        }
			    });
				newInput.setAttribute('name', 'answers[' + index +']');

				document.querySelector('#auto-label-wrapper').append(newLabel);
				newLabel.append(newInput);	

			})



	}


	if(document.querySelector('#assignment-divider-wrapper')){
		labelData.forEach(function(div, index){
				var newDiv = document.createElement('div'),
				resizer = document.createElement('div'),
				remover = document.createElement('div'),
				startY, startHeight;

				newDiv.style.height = div.height;
				newDiv.style.top = div.top;
				newDiv.className = 'auto-label';
				resizer.className = 'resizer';
				remover.className = 'auto-label-remover';
				document.querySelector('#assignment-divider-wrapper').append(newDiv);

				var parent = newDiv.parentNode,
				 	parentHeight = window.getComputedStyle(newDiv.parentNode).height;



				newDiv.addEventListener('click', init, false);

				function init() {
				    newDiv.removeEventListener('click', init, false);
				    newDiv.addEventListener('click', end, false);
				    newDiv.appendChild(resizer);
				    newDiv.appendChild(remover);
				    resizer.addEventListener('mousedown', initDrag, false);
				    remover.addEventListener('click', destroy, false);
				};

				function initDrag(e) {
				   startY = e.clientY;
				   e.preventDefault();
				   startHeight = parseInt(document.defaultView.getComputedStyle(newDiv).height, 10);
				   document.documentElement.addEventListener('mousemove', doDrag, false);
				   document.documentElement.addEventListener('mouseup', stopDrag, false);
				}

				function doDrag(e) {
				   newDiv.style.height = ((startHeight + e.clientY - startY)/parseInt(parentHeight))*100 + '%';
				}

				function stopDrag(e) {
				    document.documentElement.removeEventListener('mousemove', doDrag, false);
				    document.documentElement.removeEventListener('mouseup', stopDrag, false);

				}

				function end(){
					newDiv.removeEventListener('click', end, false);
					newDiv.addEventListener('click', init, false);
					newDiv.removeChild(resizer);
					newDiv.removeChild(remover);
				};

				function destroy(){
					parent.removeChild(newDiv);
				}

			})

	}


});