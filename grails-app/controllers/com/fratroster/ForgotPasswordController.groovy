package com.fratroster

import com.fratroster.user.User

class ForgotPasswordController {

	def messageSource
	
    def index() {
		render(view: "forgotpassword")
	}
	
	def submitForgotPassword() {
		if (params.user_email != null && !params.user_email.isEmpty()){
			def username = (params.user_email).toString()
			def currUser = User.findByUsername(username)
			if(currUser != null){
				//TODO: call forgot password email
				render(view: "requestSuccessful")
			} else {
				render(view: "forgotpassword", model: [errorMessage: message(code:"forgotpassword.missingemail")])
			}
		} else {
			render(view: "forgotpassword", model: [errorMessage: message(code:"forgotpassword.nullemail")])
		}
	}
}
