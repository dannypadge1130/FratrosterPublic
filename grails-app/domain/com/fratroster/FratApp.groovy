package com.fratroster

import java.util.Date;

import com.fratroster.apps.*

class FratApp {

	Date dateCreated
	Date lastUpdated
	boolean globallyViewable //if true everyone can see this app, if false reverts to check per frat user
	String identifier
	String description
	String image
	String appName
	
    static constraints = {
		globallyViewable(blank:false)
		identifier(blank:false)
	}
	
	static belongsTo = [frat:Frat]
	static hasMany = [memberPermissions: FratMemberAppPermission]
	
	static mapping = {
		tablePerHierarchy false
	}
}
