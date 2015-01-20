/*CHANGE PASSWORD PAGE*/
//Define the regular expression to check if password includes at least on number on Change Password Page
$(function ()
		{
		    $.validator.addMethod("loginRegex", function(value, element) {
		        return this.optional(element) || /^(?=.*[A-Za-z])(?=.*[0-9])[A-Za-z0-9]+$/i.test(value);
		    }, "The user's password must contain at least one number.");
		});
/*Begin Front-end Change Password Validation*/ 
$(document).ready(function() {
	$('#changePasswordForm').validate({
		rules: {
			password: {
				required: true,
				minlength: 6,
				loginRegex: true
				},
			confirm_password: {
				equalTo:'#password'
				}
			   }, //end rules
		messages: {
			password: {
				required: 'Please provide a password',
			    minlength: 'Password must be at least 6 characters long.',
			    loginRegex: 'Password must include at least 1 number'
			    },
			confirm_password: {
			    equalTo: 'The two passwords do not match.'
			    }
			   } //end messages 
	}); // end validate
/*UPDATE PROFILE PAGE*/
/*Begin Front-end Update Profile Validation*/
	 $('#updateProfileForm').validate({
		rules: {
			firstName: {
				required: true
				},
		    lastName: {
		     	required: true
				},
			fratName: {
		     	required: true
				},
			graduationYear: {
				required: true
				}
		   }, //end rules
	 messages: {
		   	firstName: {
		    	required: 'Please provide a first name'
		      },
		     lastName: {
		     	required: 'Please provide a last name.'
		      },
		      fratName: {
		     	required: 'Please provide a frat name.'
		      },
		     graduationYear: {
		     	required: 'Please provide your graduation year'
		     }
		   } //end messages 
	}); // end validate 	
/*LOGIN PAGE*/
/*Begin Front-end Login Page Validation*/
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
/*FORGOT PASSWORD PAGE*/
/*Begin Front-end Forgot Password Page Validation*/
	 $('#resetUserPassword').validate({
		 rules: {
			 user_email: {
				 required: true
			 }
		 }, //end rules
		messages: {
			user_email: {
				required: 'Please provide an email'
			}
		} //end Messages
	 }) //end validate
}); // end ready