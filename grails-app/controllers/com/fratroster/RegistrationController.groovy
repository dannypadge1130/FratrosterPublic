package com.fratroster

import com.fratroster.constants.GlobalKeyValues;
import com.fratroster.user.User

import grails.converters.JSON
import groovy.json.JsonBuilder

import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

class RegistrationController {
	
	def springSecurityService
	def commonService
	def userService
		
	def signup() {
		if (springSecurityService.isLoggedIn()) {
			redirect (controller: "userProfile", action: "show", id: springSecurityService.currentUser.id)
			return
		}
		String postUrl = "${request.contextPath}${SpringSecurityUtils.securityConfig.apf.filterProcessesUrl}"
		[postUrl: postUrl, rememberMeParameter: SpringSecurityUtils.securityConfig.rememberMe.parameter]
	}
	
	def register() {
		Map<String, String> userRegMap = new HashMap<String, String>()
		userRegMap.put(GlobalKeyValues.USER_USERNAME, params.email)
		userRegMap.put(GlobalKeyValues.PROFILE_FIRST_NAME, "new_user")
		userRegMap.put(GlobalKeyValues.PROFILE_LAST_NAME, "new_user")
		def user = userService.createNewRegUser(userRegMap)
		flash.model = user
		if(!user.validate()) {
			redirect (action: "failedRegistration")
		} else {
			redirect(action: "successfulRegistration")
		}	
	}
	
	def failedRegistration() {
		render (view: "signup", model: [userReg: flash.model])
	}
	
	def successfulRegistration() {
		[username: flash.model?.username]
	}
	
	def getFratInfo() {
		def collegeName = params.collegeName.toString()
		if(collegeName!=null && !collegeName.isEmpty()){
			College college = College.findByCollegeName(collegeName)
			if(college != null){
				def fratList = [
					frats: college.frats.collect{
						Frat c -> [fratName: c.fratName]
					}
				]
				if (fratList!= null) {
					def fratBuilder = new JsonBuilder(fratList)
					render fratBuilder as JSON
				}
			}
		}
	}
	
	def getCollegeInfo() {
		def currState = State.findByStateAbrv(params.stateAbrv);
		def collegeList = [
			colleges: currState.colleges.collect{
				College c -> [collegeName: c.collegeName]
			}
		]
		def collegeBuilder = new JsonBuilder(collegeList);
		
		render collegeBuilder as JSON
	}
}
