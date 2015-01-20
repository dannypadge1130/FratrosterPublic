globaljs = {
	submitForm:function(form){
		form.submit();
	},
	showModal:function(modalId) {
		$(modalId).modal('show');
	},
	hideModal:function(modalId) {
		$(modalId).modal('hide');
	},
	ajaxError:function(message) {
		alert("Ajax exception! - Update this.");
	}
}