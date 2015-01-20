package com.fratroster.jobqueues

import java.util.Date;

import com.fratroster.user.User

class ProfileImageUpload {
	
	Date dateCreated
	User user
	String filePath
	
    static constraints = {
		user(blank:false)
		filePath(blank:false)
    }
}
