package com.fratroster.memberType

import com.fratroster.FratMember

class AlumniMember extends FratMember {

	String profession
	String type = 'alumni'
	
    static constraints = {
		profession(nullable: true)
    }
}
