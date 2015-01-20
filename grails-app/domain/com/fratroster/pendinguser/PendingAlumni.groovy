package com.fratroster.pendinguser

import com.fratroster.Frat
import com.fratroster.user.User

class PendingAlumni {

	Date dateCreated
	Date lastUpdated
	
	static constraints = {}
	
	static belongsTo = [alumFrat:Frat, user:User]
}
