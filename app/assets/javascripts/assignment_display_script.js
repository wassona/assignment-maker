window.onload = function(){
	if(document.querySelector('#auto-label-wrapper')){
		JSON.parse(labelData).forEach(function(div, index){
			var newLabel = document.createElement('label');
			var newInput = document.createElement('input');

			newLabel.style.height = div.height;
			newLabel.style.top = div.top;
			newLabel.className = 'auto-label';
			newInput.className = 'auto-input';
			newInput.setAttribute('name', 'answers[' + index +']');

			document.querySelector('#auto-label-wrapper').append(newLabel);
			newLabel.append(newInput);

		})




	}
}