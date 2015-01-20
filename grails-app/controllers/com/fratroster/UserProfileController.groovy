package com.fratroster

import grails.plugins.springsecurity.Secured

import com.fratroster.constants.GlobalKeyValues;
import com.fratroster.user.User
import com.fratroster.user.UserProfile

public class UserProfileController extends ErrorController {

	def springSecurityService
	def userService
	def rushService
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def index() {
		def currUser = springSecurityService.currentUser
		if(currUser.profile.isProfileSetup) {
			redirect(action: "show", id: currUser.id)
		} else {
			redirect(action: "createProfile", controller: "newAccountSetup")
		}
    }

	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def show(Long id) {
		User userInstance = User.get(id)
		[userInstance: userInstance]
    }

	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def updateAbout() {
		def currUser = springSecurityService.currentUser
        render(template: "/userProfile/template/aboutEdit", model: [userInstance: currUser])
    }
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def updateAbout_cancel() {
		def currUser = springSecurityService.currentUser
		render(template: "/userProfile/template/about", model: [userInstance: currUser])
	}
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def updateAbout_save() {
		def currUser = springSecurityService.currentUser
        def updateProfileMap = new HashMap<String,String>();
		if(params.address1 != null) {
			updateProfileMap.put(GlobalKeyValues.PROFILE_CONTACT_ADDRESS1, params.address1);
		}
		if(params.address2 != null) {
			updateProfileMap.put(GlobalKeyValues.PROFILE_CONTACT_ADDRESS2, params.address2);
		}
		if(params.preferredEmail != null) {
			updateProfileMap.put(GlobalKeyValues.PROFILE_CONTACT_PREFERRED_EMAIL, params.preferredEmail);
		}
		if(params.highschool != null) {
			updateProfileMap.put(GlobalKeyValues.PROFILE_HIGHSCHOOL, params.highschool);
		}
		if(params.phone != null) {
			updateProfileMap.put(GlobalKeyValues.PROFILE_CONTACT_PHONE, params.phone);
		}
		User postUpdateUser = userService.updateUserProfile(currUser, updateProfileMap)
		
		if(postUpdateUser.hasErrors()) {
			render(template: "/userProfile/template/aboutEdit", model: [userInstance: postUpdateUser])
		} else {
			render(template: "/userProfile/template/about", model: [userInstance: postUpdateUser])
		}
	}
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def acceptRushInviteModal(Long id) {
		render(template: "/userProfile/modal/rush/acceptRushInviteModal", model: [fratInstance: Frat.get(id)])
	}
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def acceptPendingRushInvite() {
		def currUser = springSecurityService.currentUser
		def fratId = Long.parseLong(params.fratId)
		rushService.approvedPendingRush(fratId, currUser.id)
		redirect(action: "show", id: currUser.id)
	}
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def declineRushInviteModal(Long id) {
		render(template: "/userProfile/modal/rush/declineRushInviteModal", model: [fratInstance: Frat.get(id)])
	}

	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def deletePendingRushInvite() {
		def currUser = springSecurityService.currentUser
        def fratId = Long.parseLong(params.fratId)
        rushService.deletePendingRush(fratId, currUser.id)
		render(template: "/userProfile/template/rush/pendingRushInvites", model: [userInstance : currUser, message: message(code:"PENDING_RUSH_INVITE")])
	}
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def revokeRushRequestModal(Long id) {
        render template: "/userProfile/modal/rush/revokeRushRequestModal", model: [fratInstance: Frat.get(id)]
    }
		
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def deletePendingRushRequest() {
		def currUser = springSecurityService.currentUser
		def fratId = Long.parseLong(params.fratId)
		rushService.deletePendingRush(fratId, currUser.id)
		render(template: "/userProfile/template/rush/pendingRushInvites", model: [userInstance : currUser, message: message(code:"PENDING_RUSH_INVITE_REQUEST_REMOVED")])
	}
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def stopRushingModal(Long id) {
		render(template: "/userProfile/modal/rush/stopRushingModal", model: [fratInstance: Frat.get(id)])
	}
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def stopRushingFrat() {
		def currUser = springSecurityService.currentUser
		def fratId = Long.parseLong(params.fratId)
		rushService.deleteRush(fratId, currUser.id)
		redirect(action: "show", id: currUser.id)
	}
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def acceptPledgeBid() {
		def currUser = springSecurityService.currentUser
		def fratId = Long.parseLong(params.fratId)
		rushService.acceptedBid(fratId, currUser.id)
		redirect(action: "show", id: currUser.id)
	}
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def acceptBidModal(Long id) {
		render(template: "/userProfile/modal/rush/acceptBidModal", model: [fratInstance: Frat.get(id)])
	}
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def denyPledgeBid() {
		def currUser = springSecurityService.currentUser
		def fratId = Long.parseLong(params.fratId)
		rushService.declineBid(fratId, currUser.id)
		render(template: "/userProfile/template/rush/rushBids", model: [userInstance : currUser, message: message(code:"RUSH_DENY_BID")])
	}
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def denyBidModal(Long id) {
		render(template: "/userProfile/modal/rush/denyBidModal", model: [fratInstance: Frat.get(id)])
	}
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def dashboard() {
		def currUser = springSecurityService.currentUser
		def fratId = -1
		if(currUser.fratMembers != null && currUser.fratMembers.size() > 0) {
			def fmember = currUser.fratMembers.iterator().next()
			fratId = fmember.frat.id
		}
		[userProfileInstance: currUser.profile, secUser: currUser, fratId: fratId]
	}
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def updateName() {
		def user = springSecurityService.currentUser
		UserProfile userProfileInstance = user.profile
		if(params.firstName != null && !params.firstName.isEmpty()) {
			userProfileInstance.firstName = params.firstName
		}
		if(params.lastName != null && !params.lastName.isEmpty()) {
			userProfileInstance.lastName = params.lastName
		}
		if (userProfileInstance.save(flush: true)) {
			render(template:'/userProfile/dashboardUserName', model: [userProfileInstance: user.profile])
		}
	}
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def updateEmail() {
		def user = springSecurityService.currentUser
		UserProfile userProfileInstance = user.profile
		if(userProfileInstance != null && params.email != null && !params.email.isEmpty()) {
			userProfileInstance.contactInfo.preferredEmail = params.email
			if (userProfileInstance.save(flush: true)) {
				render(template:'/userProfile/dashboardEmail', model: [userProfileInstance: user.profile])
			}
		}
	}
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def myInformation() {
		def currUser = springSecurityService.currentUser
		render(template:'/userProfile/dashboardMyInformation', model: [userProfileInstance: currUser.profile])
	}
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def fratApps() {		
		def currUser = springSecurityService.currentUser
		if(params.fratid != null) {
			def currFrat = Frat.get(params.fratid)
			if(currFrat?.fratAdmin != null && currUser.id == currFrat.fratAdmin.id) {
				render(template:'/userProfile/dashboardFratApps', model: [userProfileInstance: currUser.profile, frat: currFrat])
			}
		}
	}
}