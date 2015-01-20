package com.fratroster.user

import com.fratroster.State

class UserContact {

	Date dateCreated
	Date lastUpdated
	String preferredEmail
	String address1
	String address2
	State state
	String phone
	
    static constraints = {
		preferredEmail(email:true, nullable:true)
		address1(nullable:true)
		address2(nullable:true)
		state(nullable:true)
		phone(nullable:true, matches: '\\d{3}\\-\\d{3}\\-\\d{4}')
    }
	
	static mapping = {
		state lazy:false
	}
	
	static belongsTo = [profile:UserProfile]
}
