package com.fratroster.apps.datatype

import com.fratroster.user.User

class Comment {

	Date dateCreated
	Date lastUpdated
	User author
	String message
	
    static constraints = {
		author(blank:false)
		message(blank:false, maxSize: 140)
	}
	
	static mapping = {
		author lazy:false
	}
}
