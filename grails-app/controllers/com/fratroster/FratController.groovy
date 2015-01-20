package com.fratroster

import grails.converters.JSON
import grails.plugins.springsecurity.Secured
import groovy.json.JsonBuilder

import org.springframework.dao.DataIntegrityViolationException

import com.fratroster.memberType.RushMember
import com.fratroster.pendinguser.PendingRush;
import com.fratroster.user.User

class FratController {

	def springSecurityService
	def permissionService
	def fratService
	def rushService
	def userService
	
	def usersFratLanding() {
		if(params.fratid != null){
			redirect(action: "show", id:params.fratid)
		}else{
			redirect(action: "list")
		}
	}

	@Secured(['ROLE_USER','ROLE_ADMIN'])
    def list() {
        def user = springSecurityService.currentUser
		def fratList = fratService.fetchFratList()
		def activeRushList = rushService.fetchActiveRushs()
        [activeRushList: activeRushList, fratInstanceList: fratList, college: user.college, userInstance: user]
	}

	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def show(Long id) {
        def fratInstance = Frat.get(id)
        if (!fratInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'frat.label', default: 'Frat'), id])
            redirect(action: "list")
            return
        }
		[fratInstance: fratInstance]
    }
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def editFratDescription(Long id) {
		render (template:"fratDescription", model:[fratInstance: Frat.get(id), editView: true])
	}
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def updateFratDescription() {
		def fratInstance = Frat.get(params.id)
		fratInstance.fratDescription = params.fratDescription
		fratInstance.save(flush: true)
		render (template:"fratDescription", model:[fratInstance: fratInstance, editView: false])
	}
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def appStore() {
		try {
			User user = springSecurityService.currentUser
			Frat frat = user.fratMembers.asList().get(0).frat
			def customAppList = fratService.appStoreList(frat.id)
			[customAppList: customAppList]
		} catch (Exception e) {
			log.error("Error accessing app store: "+e.getMessage())
			redirect(controller: "error", action: "genericError")
		}
	}
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def appPermissions(Long id) {
		try {
			FratApp fratApp = FratApp.get(id)
			def customMemberList = fratService.brotherPermissionList(id)
			def customAlumniList = fratService.alumniPermissionList(id)
			[fratApp: fratApp, customMemberList: customMemberList, customAlumniList: customAlumniList]
		} catch (Exception e) {
			log.error("Error accessing app permissions page: "+e.getMessage())
			redirect(controller: "error", action: "genericError")
		}
	}
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def updateFratMemberPerm() {
		try {
			def memberId = Long.parseLong(params.memberId)
			def fratAppId = Long.parseLong(params.fratAppId)
			def permission = params.perm
			fratService.updateFratMemberPerm(memberId, fratAppId, permission)
			def responseJson = [
				success: 'success',
			]
			def modalBuilder = new JsonBuilder(responseJson);
			render responseJson as JSON
		} catch (Exception e) {
			log.error("Error changing user perm: "+e.getMessage())
		}
	}
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def renderRushCard() {
		try {
			def userId = Long.parseLong(params.populateId)
			User user = User.get(userId)
			def rushMemberList = RushMember.findAllByUser(user)
			render (template:"/frat/modal/rush/rushCardModal", model:[userInstance: user, rushMemberList: rushMemberList, rushIndex: params.rushIndex])
		} catch (Exception) {
			log.error("Error rendoring rush modal, userId: "+params.populateId)
			return
		}
	}
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def populateAddRushListModal(Long id) {
		User currUser = springSecurityService.currentUser
		User rush = User.get(id)
		def fratRelMap = userService.getUserToFratRelation(rush, currUser.getOwnerships())
		def fratList = new ArrayList<Frat>();
		for(entry in fratRelMap) {
			if(entry.value.equals("nonmember")) {
				fratList.add(entry.key);
			}
		}
		render (template:"/frat/modal/rush/addToRushListModal", model:[rushInstance: rush, availableFrats: fratList])
	}
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def populateRevokeRushInviteModal(Long id) {
		User currUser = springSecurityService.currentUser
		User rushUser = User.get(id)
		
		def adminFratList = Frat.findAllByFratAdmin(currUser)
		List<Long> adminFratIdList = new ArrayList<Long>()
		for(Frat adminFrat : adminFratList) {
			adminFratIdList.add(adminFrat.id)
		}
		
		List<Frat> fratList = new ArrayList<Frat>()
		def pendingRushList = PendingRush.findAllByUser(rushUser)
		if(pendingRushList != null && pendingRushList.size() > 0) {
			for(PendingRush pRush : pendingRushList) {
				if(adminFratIdList.contains(pRush.frat.id)){
					fratList.add(pRush.frat)
				}
			}
		}
		render (template:"/frat/modal/rush/revokeRushInviteModal", model:[rushInstance: rushUser, availableFrats: fratList])
	}
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def populateRushFratModal(Long id) {
		render (template:"/frat/modal/rush/rushFratModal", model:[fratInstance: Frat.get(id)])
	}
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def deletePendingRush() {
		List<User> activeRushList = new ArrayList<User>()
		def message = message(code:"PENDING_RUSH_INVITE_REVOKE")
		User user = springSecurityService.currentUser
		def userId = Long.parseLong(params.id)
		def fratId = Long.parseLong(params.fratId)
		rushService.deletePendingRush(fratId, userId)
		
		activeRushList = rushService.fetchActiveRushs()
		render (template: "/frat/template/rushTab", model: [activeRushList: activeRushList, rushTabMessage: message])
	}
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def saveToRushList() {
		List<User> activeRushList = new ArrayList<User>()
		def message = message(code:"PENDING_RUSH_INVITE")
		User user = springSecurityService.currentUser
		def userId = Long.parseLong(params.id)
		def fratId = Long.parseLong(params.fratId)
		rushService.createNewPendingRush(fratId, userId, true)
		
		activeRushList = rushService.fetchActiveRushs()
		render (template: "/frat/template/rushTab", model: [activeRushList: activeRushList, rushTabMessage: message])
	}
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def rushFrat() {
		def message = message(code:"PENDING_RUSH_FRAT_REQUEST")
		User user = springSecurityService.currentUser
		def fratId = Long.parseLong(params.fratId)
		rushService.createNewPendingRush(fratId, user.id, false)
		
		def fratList = fratService.fetchFratList()
		render (template: "/frat/template/fratTab", model: [fratInstanceList: fratList, fratTabMessage: message, userInstance: user])
	}
}