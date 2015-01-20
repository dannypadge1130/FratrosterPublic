package com.fratroster.pendinguser

import com.fratroster.Frat
import com.fratroster.user.User

class PendingRush {

	boolean invited
	Date dateCreated
	Date lastUpdated
	
	static constraints = {
		invited(blank:false)
	}
	
	static belongsTo = [frat:Frat, user:User]
}