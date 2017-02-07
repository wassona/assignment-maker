

document.addEventListener('DOMContentLoaded', function() {

console.log("mdl")

if (document.getElementById("uploadBtn")) {
	document.getElementById("uploadBtn").onchange = function () {
	    document.getElementById("uploadFile").value = this.files[0].name;
	};
};

document.querySelector("body").addEventListener('keyup', function(e){


	if (e.key === "Enter") {
		if (document.activeElement == document.querySelector('#uploadBtnDiv')){
			document.querySelector('#uploadBtn').click();
		}
	}
	
});


if (document.getElementById("uploadFile")) {
	document.getElementById("uploadFile").onclick = function() {
		document.getElementById("uploadBtn").click();
	};
};



});