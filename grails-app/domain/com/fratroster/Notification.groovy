package com.fratroster

import com.fratroster.user.User

class Notification {

	Date dateCreated
	Date lastUpdated
	boolean readNote = false
	boolean markForDelete = false
	String message
	
    static constraints = {
    	readNote(blank:false)
		markForDelete(blank:false)
		message(blank:false, maxSize:140)
	}
	
	static belongsTo = [user:User]
	
//	207.97.200.47
}
