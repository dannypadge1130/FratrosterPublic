class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}
		
		"/setup"{
			controller="newAccountSetup"
			action="index"
		}
		
		"/setup/updateprofile"{
			controller="newAccountSetup"
			action="updateprofile"
		}
		
		"/setup/changepassword"{
			controller="newAccountSetup"
			action="changepassword"
		}
		
		"/setup/addprofilepicture"{
			controller="newAccountSetup"
			action="uploadphoto"
		}
		
		"/fraternities"{
			controller="frat"
			action="list"
		}
		
		"/collegeInfoJSON"{
			controller="registration"
			action="getCollegeInfo"
		}
		
		"/getFratJSON"{
			controller="registration"
			action="getFratInfo"
		}
		
		"/profile"{
			controller="userProfile"
			action="index"
		}
		
		"/signup"{
			controller="registration" 
			action="signup"
		}
		
		"/successful_registration" {
			controller="registration"
			action="successfulRegistration"
		}
				
		"/forgotpassword"{
			controller="forgotPassword"
			action="index"
		}
		
		//error views
		"/unauthorized-app-user"{
			controller="error"
			action="unauthorizedAppAccess"
		}
		
		//static pages
		"/"(view:"/home")
		"/about"(view:"/about")
		"/termsofuse" (view:"/termsofuse")		
		"/privacypolicy" (view:"/privacypolicy")
		"/faq" (view:"/faq")
		"500"(view:'/error')
		"404"(view:"/error/notFound")
	}
}
