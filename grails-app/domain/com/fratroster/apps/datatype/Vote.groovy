package com.fratroster.apps.datatype

import java.util.Date;

import com.fratroster.user.User;

class Vote {

	Date dateCreated
	Date lastUpdated
	User author
	boolean liked
	
    static constraints = {
		author(blank:false)
		liked(blank:false)
    }
	
	static mapping = {
		author lazy:false
	}
}
