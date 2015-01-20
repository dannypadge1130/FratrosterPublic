package com.fratroster.apps

import org.springframework.transaction.annotation.Transactional

import com.fratroster.FratApp
import com.fratroster.FratMemberAppPermission
import com.fratroster.user.User

class PermissionService {

	def springSecurityService
	
	@Transactional(readOnly=true)
	def writePermissionsCheck(Long fratAppId) {
		FratApp fratapp = FratApp.get(fratAppId);
		User user = springSecurityService.currentUser;
		
		def fMemberList = user.fratMembers
		for(FratMemberAppPermission appPerm in fratapp.memberPermissions) {
			if(fMemberList.contains(appPerm.fratMember)) {
				if(appPerm.permissions.equals("WR")) {
					return true
				}
			}
		}
		return false;
	}
	
	@Transactional(readOnly=true)
	def readPermissionsCheck(Long fratAppId) {
		FratApp fratapp = FratApp.get(fratAppId);
		User user = springSecurityService.currentUser;
		
		if(fratapp.globallyViewable) {
			return true
		}
		
		def fMemberList = user.fratMembers
		for(FratMemberAppPermission appPerm in fratapp.memberPermissions) {
			if(fMemberList.contains(appPerm.fratMember)) {
				if(!appPerm.permissions.equals("N")) {
					return true
				}
			}
		}
		return false;
	}
}