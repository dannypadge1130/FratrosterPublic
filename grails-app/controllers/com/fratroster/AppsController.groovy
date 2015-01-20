package com.fratroster

import grails.converters.JSON
import grails.plugins.springsecurity.Secured
import groovy.json.JsonBuilder

import com.fratroster.memberType.AlumniMember
import com.fratroster.memberType.PledgeMember
import com.fratroster.memberType.RushMember
import com.fratroster.pendinguser.PendingMember
import com.fratroster.pendinguser.PendingRush

class AppsController {

	def springSecurityService
	def messageSource
	def grailsApplication
	def permissionService
	def eventAppService
	def alumniService
	def rushService
	def brotherService
	def pledgeService
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def approvePendingAlumni(Long id) {
		try {
			AlumniMember alumni = AlumniMember.get(id)
			def userFrat = alumni.frat
			alumniService.createNewApprovedAlumni(id)
			def sortedAlumni = userFrat.pendingAlumnis.asList().sort{it.firstName}
			render (template:"pendingusers/pendingAlumniList", model:[pendingAlumniList: sortedAlumni, alertMessage: message(code:"APPROVE_ALUMNI_ALERT")])
		} catch (Exception e) {
			log.error("Error create new alumni record for frat: "+e.getMessage())
		}
	}
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def denyPendingAlumni(Long id) {
		try {
			AlumniMember alumni = AlumniMember.get(id)
			def userFrat = alumni.frat
			alumniService.denyPendingAlumni(id)
			def sortedAlumni = userFrat.pendingAlumnis.asList().sort{it.firstName}
			render (template:"pendingusers/pendingAlumniList", model:[pendingAlumniList: sortedAlumni, alertMessage: message(code:"DENY_ALUMNI_ALERT")])
		} catch (Exception e) {
			log.error("Error denying pending alumni: "+e.getMessage())
		}
	}

	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def denyPendingBrother(Long id) {
		try {
			PendingMember pMember = PendingMember.get(id)
			Frat currFrat = pMember.frat
			brotherService.denyPendingBrother(id)
			def sortedBrotherList = currFrat.pendingMembers.asList().sort{it.user.profile.firstName}
			render (template:"pendingusers/pendingMemberList", model:[pendingMemberList: sortedBrotherList, alertMessage: message(code:"DENY_BROTHER_ALERT")])
		} catch (Exception e) {
			log.error("Error denying pending brother: "+e.getMessage())
		}
	}
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def approvedPendingBrother(Long id) {
		try {
			PendingMember pMember = PendingMember.get(id)
			Frat currFrat = pMember.frat
			brotherService.approvedPendingBrother(id)
			def sortedBrotherList = currFrat.pendingMembers.asList().sort{it.user.profile.firstName}
			render (template:"pendingusers/pendingMemberList", model:[pendingMemberList: sortedBrotherList, alertMessage: message(code:"APPROVE_BROTHER_ALERT")])
		} catch (Exception e) {
			log.error("Error approving pending brother: "+e.getMessage())
		}
	}
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def denyPendingRush(Long id) {
		try {
			PendingRush pRush = PendingRush.get(id)
			Frat currFrat = pRush.frat
			rushService.denyPendingRush(id)
			def sortedRushList = currFrat.pendingRushs.asList().sort{it.user.profile.firstName}
			render (template:"pendingusers/pendingRushList", model:[pendingRushList: sortedRushList, alertMessage: message(code:"DENY_RUSH_ALERT")])	
		} catch (Exception e) {
			log.error("Error denying pending rush: "+e.getMessage())
		}
	}
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def approvedPendingRush(Long id) {
		try {
			PendingRush pRush = PendingRush.get(id)
			Frat currFrat = pRush.frat
			//rushService.approvedPendingRush(id)
			def sortedRushList = currFrat.pendingRushs.asList().sort{it.user.profile.firstName}
			render (template:"pendingusers/pendingRushList", model:[pendingRushList: sortedRushList, alertMessage: message(code:"APPROVE_RUSH_ALERT")])	
		} catch (Exception e) {
			log.error("Error approving pending rush: "+e.getMessage())
		}
	}
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def getApprovalModalJSON(String type, String userid) {
		
		def bMessage = ""
		def aMessage = ""
		def actionLink = ""
		
		def g = grailsApplication.mainContext.getBean('org.codehaus.groovy.grails.plugins.web.taglib.ApplicationTagLib')
		
		if(type.equalsIgnoreCase('alumni')) {
			bMessage = message(code:"APPROVE_ALUMNI_BANNER")
			aMessage = message(code:"APPROVE_ALUMNI_MESSAGE")
			actionLink = g.remoteFunction(action:"approvePendingAlumni", update:"pendingAlumni", id:userid)
		} else if (type.equalsIgnoreCase('member')) {
			bMessage = message(code:"APPROVE_MEMBER_BANNER")
			aMessage = message(code:"APPROVE_MEMBER_MESSAGE")
			actionLink = g.remoteFunction(action:"approvedPendingBrother", update:"pendingBrothers", id:userid)
		} else if (type.equalsIgnoreCase('rush')) {
			bMessage = message(code:"APPROVE_RUSH_BANNER")
			aMessage = message(code:"APPROVE_RUSH_MESSAGE")
			actionLink = g.remoteFunction(action:"approvedPendingRush", update:"pendingRushes", id:userid)
		}
		
		def approvalModalJSON = [
			bannerMessage: bMessage,
			approvalMessage: aMessage,
			actionLink: actionLink
		]
		
		def modalBuilder = new JsonBuilder(approvalModalJSON);
		render modalBuilder as JSON
	}
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def getDenyModalJSON(String type, String userid) {
		def bMessage = ""
		def aMessage = ""
		def actionLink = ""
		
		def g = grailsApplication.mainContext.getBean('org.codehaus.groovy.grails.plugins.web.taglib.ApplicationTagLib')
		
		if(type.equalsIgnoreCase('alumni')) {
			bMessage = message(code:"DENY_ALUMNI_BANNER")
			aMessage = message(code:"DENY_ALUMNI_MESSAGE")
			actionLink = g.remoteFunction(action:"denyPendingAlumni", update:"tabs4-pane1", id:userid)
		} else if (type.equalsIgnoreCase('member')) {
			bMessage = message(code:"DENY_MEMBER_BANNER")
			aMessage = message(code:"DENY_MEMBER_MESSAGE")
			actionLink = g.remoteFunction(action:"denyPendingBrother", update:"tabs4-pane2", id:userid)
		} else if (type.equalsIgnoreCase('rush')) {
			bMessage = message(code:"DENY_RUSH_BANNER")
			aMessage = message(code:"DENY_RUSH_MESSAGE")
			actionLink = g.remoteFunction(action:"denyPendingRush", update:"tabs4-pane3", id:userid)
		}
		
		def approvalModalJSON = [
			bannerMessage: bMessage,
			approvalMessage: aMessage,
			actionLink: actionLink
		]
		
		def modalBuilder = new JsonBuilder(approvalModalJSON);
		render modalBuilder as JSON
	}
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def updateCommentModal(Long id) {
		RushMember rush = RushMember.get(id)
		render (template:"rushCommentModal", model:[rush: rush, appId: params.appId, currentUser: springSecurityService.currentUser])
	}
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def acceptPledge(Long id) {
		PledgeMember pledge = PledgeMember.get(id)
		Frat frat = pledge.frat
		pledgeService.acceptPledge(id)
		def pledgeSort = frat.pledges.asList().sort{it.user.profile.firstName}
		render (template:"/apps/refresh/pledgeList", model:[alertMessage: "Pledge Accepted to Fraternity.", pledgeList: pledgeSort])
	}
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def denyPledge(Long id) {
		PledgeMember pledge = PledgeMember.get(id)
		Frat frat = pledge.frat
		pledgeService.denyPledge(id)
		def pledgeSort = frat.pledges.asList().sort{it.user.profile.firstName}
		render (template:"/apps/refresh/pledgeList", model:[alertMessage: "Pledge notified of denial.", pledgeList: pledgeSort])
	}
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def acceptRush(Long id) {
		RushMember rush = RushMember.get(id)
		Frat frat = rush.frat
		rushService.acceptRush(id)
		def rushSort = frat.rushs.asList().sort{it.user.profile.firstName}
		render (template:"/apps/refresh/rushList", model:[alertMessage: "Sent Rush a bid.", rushList: rushSort])
	}
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def denyRush(Long id) {
		RushMember rush = RushMember.get(id)
		Frat frat = rush.frat
		rushService.deleteRush(id)
		def rushSort = frat.rushs.asList().sort{it.user.profile.firstName}
		render (template:"/apps/refresh/rushList", model:[alertMessage: "Rush notified of denial.", rushList: rushSort])
	}
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def denyPledgeModalRefresh(Long id) {
		PledgeMember pledge = PledgeMember.get(id) 
		render (template:"/apps/modal/pledgeDenyBid", model:[fullName: pledge?.user?.profile?.getFullName(), pledgeId: id])
	}
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def approvePledgeModalRefresh(Long id) {
		PledgeMember pledge = PledgeMember.get(id)
		render (template:"/apps/modal/pledgeSendBid", model:[fullName: pledge?.user?.profile?.getFullName(), pledgeId: id])
	}
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def denyRushModalRefresh(Long id) {
		RushMember rush = RushMember.get(id)
		render (template:"/apps/modal/rushDenyBid", model:[fullName: rush?.user?.profile?.getFullName(), rushId: id, appId: params.appId])
	}
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def approveRushModalRefresh(Long id) {
		RushMember rush = RushMember.get(id)
		render (template:"/apps/modal/rushSendBid", model:[fullName: rush?.user?.profile?.getFullName(), rushId: id, appId: params.appId])
	}
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def submitRushComment() {
		try {
			def message = params.rushComment
			def authorId = Long.parseLong(params.authorId)
			def rushId = Long.parseLong(params.rushId)
			rushService.createNewRushComment(message, authorId, rushId)
			redirect (action:"rushListApp", params:[id: params.appId, alertMessage: "Comment Added!"])
		} catch (Exception e) {
			log.error("Error creating comment for rush: "+e.getMessage())
			redirect(controller: "error", action: "genericError")
		}
	}
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def submitRushVote() {
		try {
			def rushId = Long.parseLong(params.rushId)
			def liked = Boolean.valueOf(params.liked)
			rushService.castRushVote(rushId, liked)
			
			def responseJson = [
				success: 'success',
			]
			def modalBuilder = new JsonBuilder(responseJson);
			render responseJson as JSON
			
		} catch (Exception e) {
			log.error("Error voting for rush: "+e.getMessage())
			redirect(controller: "error", action: "genericError")
		}
	}
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def removeRushVote() {
		try {
			def rushId = Long.parseLong(params.rushId)
			rushService.removeRushVote(rushId)
			
			def responseJson = [
				success: 'success'
			]
			def modalBuilder = new JsonBuilder(responseJson);
			render responseJson as JSON
			
		} catch (Exception e) {
			log.error("Error voting for rush: "+e.getMessage())
			redirect(controller: "error", action: "genericError")
		}
	}
}
