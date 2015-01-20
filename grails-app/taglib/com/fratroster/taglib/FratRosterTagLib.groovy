package com.fratroster.taglib

import com.fratroster.Frat
import com.fratroster.FratMember;
import com.fratroster.pendinguser.PendingRush
import com.fratroster.user.User

class FratRosterTagLib {
	def springSecurityService
	def facebookAuthService
	def userService
	
	def hasAFrat = { attrs, body ->
		if (springSecurityService.isLoggedIn()) {
			User user = springSecurityService.currentUser;
			if(user?.fratMembers != null && user.fratMembers.size() > 0 ){
				out << body()
			}
		}
	}
	
	def doesntHaveAFrat = { attrs, body ->
		if (springSecurityService.isLoggedIn()) {
			User user = springSecurityService.currentUser;
			if(user?.fratMembers == null || user.fratMembers.size() == 0){
				out << body()
			}
		}
	}
	
	def ifFratAdmin = { attrs, body ->
		if(springSecurityService.isLoggedIn()) {
			if(attrs?.fratid != null){
				User user = springSecurityService.currentUser;
				Frat frat = Frat.get(attrs.fratid)
				if(frat?.fratAdmin != null && frat.fratAdmin.id == user.id) {
					out << body()
				}
			}
		}
	}
	
	def ifAFratAdmin = { attrs, body ->
		if(springSecurityService.isLoggedIn()) {
			User user = springSecurityService.currentUser;
			def fratList = Frat.findAllByFratAdmin(user)
			if(fratList != null && fratList.size() > 0) {
				out << body()
			}
		}
	}
	
	def isPendingRushOfFrat = { attrs, body ->
		User currentUser = springSecurityService.currentUser
		Frat frat = Frat.get(attrs.fratId)
		def pendingMemberList = PendingRush.findAllByFrat(frat)*.user
		if(pendingMemberList.contains(currentUser)) {
			out << body()
		}
	}
	
	def isPendingRushOfUsersFrats = { attrs, body ->
		User user = User.get(attrs.userId)
		User currentUser = springSecurityService.currentUser
		for(Frat frat : currentUser.getOwnerships()) {
			def pendingMemberList = PendingRush.findAllByFratAndInvited(frat, attrs.invited)*.user
			if(pendingMemberList.contains(user)) {
				out << body()
			}
		}
	}
	
	def isNonMemberOfFrat = { attrs, body ->
		User currentUser = springSecurityService.currentUser
		Frat frat = Frat.get(attrs.fratId)
		def memberList = FratMember.findAllByFratAndUser(frat, currentUser)
		if(null == memberList || memberList.isEmpty()) {
			out << body()
		}
	}
		
	def isNonMemberOfUsersFrats = { attrs, body ->
		User user = User.get(attrs.userId)
		User currentUser = springSecurityService.currentUser
		def userRelationMap = userService.getUserToFratRelation(user, currentUser.getOwnerships())
		for(entry in userRelationMap) {
			if(entry.value.equals("nonmember")) {
				out << body()
			}
		}
	}
	
	def facebookUserImg = { attrs, body ->
		String imageSrc = facebookAuthService.getUserImageUrl()
		out << "<img src='"+imageSrc+"' />"
	}
}
