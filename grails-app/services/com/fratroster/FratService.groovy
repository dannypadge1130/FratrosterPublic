package com.fratroster

import org.springframework.transaction.annotation.Transactional

import com.fratroster.user.User

class FratService {
	
	def grailsApplication
	def springSecurityService
	
	@Transactional
	def updateFratMemberPerm(Long fMemberId, Long fratAppId, String permission) throws Exception {
		FratApp fratApp = FratApp.get(fratAppId)
		FratMember member = FratMember.get(fMemberId)
		FratMemberAppPermission userPermission = member.fratMemberAppPermissions.asList().find {it.fratApp.id == fratApp.id}
		if(userPermission != null) {
			userPermission.permissions = permission
			userPermission.save(flush: true)
		} else { 
			FratMemberAppPermission newUserPermission = new FratMemberAppPermission()
			newUserPermission.fratApp = fratApp
			newUserPermission.fratMember = member
			newUserPermission.permissions = permission
			newUserPermission.save(flush: true)
		}
	}
	
	@Transactional
	def removeFratApp(Long id) throws Exception {
		FratApp fratApp = FratApp.get(id)
		fratApp.delete()
	}
	
	@Transactional(readOnly=true)
	def fetchFratList() {
		User currentUser = springSecurityService.currentUser
		College college = currentUser.college
		return college.frats.asList().sort{it.fratName}
	}
}
