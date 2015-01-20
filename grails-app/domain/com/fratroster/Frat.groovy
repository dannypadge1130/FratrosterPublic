package com.fratroster

import com.fratroster.memberType.AlumniMember
import com.fratroster.memberType.RushMember
import com.fratroster.memberType.BrotherMember
import com.fratroster.memberType.PledgeMember
import com.fratroster.pendinguser.PendingAlumni
import com.fratroster.pendinguser.PendingMember
import com.fratroster.pendinguser.PendingRush
import com.fratroster.user.User
import com.sun.org.apache.xerces.internal.jaxp.validation.ValidatorHandlerImpl;

class Frat {
	
	public static final int NATIONAL = 1
	public static final int LOCAL = 2
	public static final int BUSINESS = 3

	Date dateCreated
	Date lastUpdated
    String fratName
	String fratDescription
	Date foundedYear
	Double averageGpa
	User fratAdmin
	S3Image image
	SocialNetworkInfo socialNetworkInfo
	Integer fratType //1 = National, 2 = Local, 3 = Business
	
	static constraints = {
		fratName(blank:false)
		fratType(blank:false, range:1..3)
		fratAdmin(nullable:true)
		fratDescription(nullable:true, maxSize: 400)
		image(nullable:true)
		foundedYear(nullable:true)
		socialNetworkInfo(nullable:true)
		averageGpa(nullable: true, range:0..4)
    }
	
	static mapping = {
		fratAdmin lazy:false
		image lazy:false
		socialNetworkInfo lazy:false
	}
	
	static belongsTo = [college: College]
	static hasMany = [members: FratMember, pendingRushs: PendingRush, pendingMembers: PendingMember, apps: FratApp]
}
