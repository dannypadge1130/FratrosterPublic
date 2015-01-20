package com.fratroster

import grails.plugins.springsecurity.Secured
import grails.plugins.springsecurity.SpringSecurityService;

import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

import com.fratroster.constants.GlobalKeyValues
import com.fratroster.pendinguser.PendingAlumni;
import com.fratroster.pendinguser.PendingMember
import com.fratroster.user.User

class NewAccountSetupController {
	
	def springSecurityService
	def userService
	def amazonS3Service
	def brotherService
	def alumniService
	def fratService
	
	@Secured(['ROLE_USER', 'ROLE_ADMIN'])
	def createProfile = {
		User currUser = springSecurityService.currentUser;
		[userInstance: currUser]
	}
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def saveprofile = {
		User currUser = springSecurityService.currentUser;
		Map<String, String> userRegMap = new HashMap<String, String>()
		userRegMap.put(GlobalKeyValues.PROFILE_FIRST_NAME, params.firstName)
		userRegMap.put(GlobalKeyValues.PROFILE_LAST_NAME, params.lastName)
		userRegMap.put(GlobalKeyValues.PROFILE_GRADUATION_YEAR, String.valueOf(params.gradYear))
		
		currUser = userService.updateUserProfile(currUser, userRegMap)
		
		if(!SpringSecurityUtils.ifAllGranted("ROLE_FACEBOOK")) {
			currUser = userService.updateUserPassword(currUser, params.password, params.confirmPassword)
		}
		
		flash.model = currUser
		if(currUser.hasErrors()) {
			redirect (action: "saveProfile_failed")
		} else {
			currUser.profile.isProfileSetup = true
			currUser.save(flush: true)
			redirect (action: "selectStatus")
		}
	}
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def saveProfile_failed() {
		render (view: "createProfile", model: [userInstance: flash.model])
	}
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def photoUpload = {
		User currUser = springSecurityService.currentUser
		def file = request.getFile('file')
		if (file != null || !file.empty) {
			amazonS3Service.photoUpload(file)
		}		
		redirect(action: "createProfile")
	}
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def selectStatus() {}
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def schoolEmailSetup() {
		User currUser = springSecurityService.currentUser	
		if(!currUser.validEduEmail) {
			redirect(action: "emailValidation", params: [flowType: params.flowType])
			return
		}
		
		if(params.flowType == "rush") {
			redirect(controller: "userProfile", action: "show", id: currUser.id)
			return
		} else if(params.flowType == "brother") {
			redirect(action: "selectFraternity")
			return
		}
		redirect(action: "selectStatus")
	}
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def emailValidation() {
		User currUser = springSecurityService.currentUser
		session.flowType = params.flowType
		[userInstance: currUser]
	}
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def emailValidation_save() {
		User currUser = springSecurityService.currentUser
		currUser = userService.eduEmailValidation(currUser, params.collegeEmail)
		flash.model = currUser
		redirect(action: "emailValidation_submitted")
	}
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def eduPinValidation() {
		User currUser = springSecurityService.currentUser
		currUser = userService.eduEmailPinValidation(currUser, params.verificationPin)
		flash.model = currUser
		if(currUser.hasErrors()) {
			redirect (action: "emailValidation_submitted")
			return
		}
		
		currUser.validEduEmail = true
		currUser.save(flush: true)
			
		def flowType = session.flowType
		if(flowType != null) {
			if(flowType == "brother") {
				redirect (action: "selectFraternity")
				return
			} else if (flowType == "rush"){
				redirect(controller: "userProfile", action: "show", id: currUser.id)
				return
			}
		}
		redirect (action: "selectStatus")
	}
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def emailValidation_submitted() {
		render (view: "emailValidation", model: [userInstance: flash.model])
	}
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def selectFraternity() {
		User currUser = springSecurityService.currentUser
		if(!currUser.validEduEmail || currUser.college == null) {
			redirect(action: "emailValidation")
		}
		[fratList: currUser.college.frats]
	}
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def selectFraternity_save() {
		User currUser = springSecurityService.currentUser
		PendingMember pMember = new PendingMember()
		if(params.selectFraternity != null && params.selectFraternity != "") {
			def fratId = Long.parseLong(params.selectFraternity)
			pMember = brotherService.createPendingBrother(fratId, currUser.id)
		} else {
			pMember.errors.reject("fraternity.id.blank", "")
		}
		if(pMember.hasErrors()) {
			flash.model = pMember
			redirect(action: "selectFraternity_failed")
			return
		}
		redirect(action: "show", controller: "userProfile", id: currUser.id)
	}
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def selectFraternity_failed() {
		render (view: "selectFraternity", model: [pBrotherInstance: flash.model])
	}
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def alumniSetup() {
		session.flowType = "alumni"
		[states: State.list()]
	}
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def alumniSetup_save() {
		User currUser = springSecurityService.currentUser
		PendingAlumni pAlumni = new PendingAlumni()
		if(params.selectFraternity != null && params.selectFraternity != "") {
			def fratId = Long.parseLong(params.selectFraternity)
			pAlumni = alumniService.createPendingAlumni(currUser.id, fratId)
		} else {
			pAlumni.errors.reject("fraternity.id.blank", "")
		}
		if(pAlumni.hasErrors()) {
			flash.model = pAlumni
			redirect(action: "alumniSetup_failed")
			return
		}
		redirect(action: "show", controller: "userProfile", id: currUser.id)
	}
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def alumniSetup_failed() {
		render (view: "alumniSetup", model: [pAlumniInstance: flash.model])
	}
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def createFraternity() {
		User currUser = springSecurityService.currentUser
		if(!currUser.validEduEmail || currUser.college == null) {
			redirect(action: "emailValidation")
		}
	}
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def createFraternity_save() {
		User currUser = springSecurityService.currentUser
		Frat frat = new Frat(params)
		frat.fratAdmin = currUser
		frat.college = currUser.college
		frat.save(flush: true)
		if(frat.hasErrors()) {
			flash.model = frat
			redirect(action: "createFraternity_failed")
			return
		}
		redirect(action: "show", controller: "frat", id: frat.id)
	}
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def createFraternity_failed() {
		render(view: "createFraternity", model: [fratInstance: flash.model])
	}
}
