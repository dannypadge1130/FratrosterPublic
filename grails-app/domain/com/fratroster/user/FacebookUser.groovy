package com.fratroster.user

import java.util.Date;

class FacebookUser {
	long uid
	String accessToken
	Date accessTokenExpires
	Date dateCreated
	Date lastUpdated
	static belongsTo = [user: User] //connected to main Spring Security domain
  
	static constraints = {
	  uid unique: true
	}
}
