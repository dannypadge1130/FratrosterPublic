package com.fratroster


class College {

	Date dateCreated
	Date lastUpdated
    String collegeName
	S3Image image
	String shortDescription
	String longDescription
	String emailDomain
	SocialNetworkInfo socialNetworkInfo
	
	static belongsTo = [state:State]
	static hasMany = [frats:Frat]
	
	static constraints = {
		collegeName(blank:false, unique:true)
		image(nullable:true)
		shortDescription(nullable:true, maxSize:128)
		longDescription(nullable:true, maxSize:256)
		emailDomain(blank:false, unique:true)
		socialNetworkInfo(nullable:true)
    }
	
	static mapping = {
		image lazy:false
		socialNetworkInfo lazy:false
	}
}
