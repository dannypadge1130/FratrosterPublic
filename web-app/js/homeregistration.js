$(document).ready(function() {
/*Begin Fraternity Creation / Registration Validation*/
	 $('#register').validate({	 	
		 rules: {
			 firstName: {
				 required: true
			 },
			 lastName: {
				 required: true
			 },
			 email: {
			 	required: true
			 },
			 password: {
			 	required: true
			 },
			 college: {
			 	required: true
			 },
			 fraternityName: {
			 	required: true
			 },
			 fraternityCategory: {
			 	required: true
			 },
			 nationalOrganization: {
			 	required: '#national:checked'
			 }
		 }, //end rules
		messages: {
			firstName: {
				required: 'Please provide your First Name'
			},
			lastName: {
				required: 'Please provide your Last Name'
			},
			email: {
				required: 'Please provide your College Email'
			},
			password: {
				required: 'Please provide a Password'
			},
			college: {
				required: 'Please select your College'
			},
			fraternityName: {
				required: 'Please provide a Fraternity Name'
			},
			fraternityCategory: {
				required: 'Please select your type of Fraternity'
			},
			nationalOrganization: {
				required: 'Please select your National Organization'
			}
		} //end Messages
	 }) //end validate
}); // end ready
