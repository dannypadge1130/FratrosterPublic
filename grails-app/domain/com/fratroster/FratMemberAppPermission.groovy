package com.fratroster


class FratMemberAppPermission {

	Date dateCreated
	Date lastUpdated
	String permissions //R - read, WR- read write, N - none
	    
	static constraints = {
		permissions(blank: false, validator: {String val ->
			if (!val.equalsIgnoreCase('R') && !val.equalsIgnoreCase('WR') && !val.equalsIgnoreCase('N')) {
				"app.permissions.invalid"
			}
		})
    }
	
	static belongsTo = [fratApp: FratApp, fratMember: FratMember]
}
