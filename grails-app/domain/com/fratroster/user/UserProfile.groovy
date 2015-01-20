package com.fratroster.user

import com.fratroster.S3Image
import com.fratroster.SocialNetworkInfo
import com.fratroster.Frat

class UserProfile {

	Date dateCreated
	Date lastUpdated
	String firstName
	String lastName
	String description
	String highschool
	Date graduationYear
	String major
	Double gpa
	Date birthday
	S3Image profileImage
	UserContact contactInfo
	SocialNetworkInfo socialNetworkInfo
	boolean isProfileSetup = false
	
	static constraints = {
		firstName(blank:false, maxSize: 60)
		lastName(blank:false, maxSize: 60)
		description(nullable: true, maxSize:128)
		graduationYear(blank:false)
		major(nullable:true)
		gpa(nullable:true, range:0..4)
		birthday(nullable: true)
		profileImage(nullable:true)
		highschool(nullable:true, maxSize: 128)
		contactInfo(blank:false)
		socialNetworkInfo(blank:false)
    }
	
	String getFullName() {
		return (this.firstName+" "+this.lastName)
	}
	
	static mapping = {
		profileImage lazy:false
		contactInfo lazy:false
		socialNetworkInfo lazy:false
	}
	
	static belongsTo = [user:User]
}