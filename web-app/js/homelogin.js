$(document).ready(function() {
/*Begin Login Validation*/
	 $('#loginForm').validate({
		 rules: {
			 j_username: {
				 required: true
			 },
			 j_password: {
				 required: true
			 }
		 }, //end rules
		messages: {
			j_username: {
				required: 'Please provide an email'
			},
			j_password: {
				required: 'Please provide a password'
			}
		} //end Messages
	 }) //end validate
}); // end ready
