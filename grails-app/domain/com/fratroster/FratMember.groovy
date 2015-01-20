package com.fratroster

import com.fratroster.user.User

class FratMember {
	
	Date dateCreated
	Date lastUpdated
	String type
	static constraints = {
		type(blank:false)
	}
	
	static belongsTo = [frat:Frat, user:User]
	static hasMany = [fratMemberAppPermissions: FratMemberAppPermission]
	
	static mapping = {
		tablePerHierarchy false
	}
}
