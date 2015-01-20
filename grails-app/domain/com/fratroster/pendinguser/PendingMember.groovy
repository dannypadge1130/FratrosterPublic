package com.fratroster.pendinguser

import com.fratroster.Frat
import com.fratroster.user.User

class PendingMember {

	Date dateCreated
	Date lastUpdated
	
	static constraints = {}
	
	static belongsTo = [frat:Frat, user:User]
}
