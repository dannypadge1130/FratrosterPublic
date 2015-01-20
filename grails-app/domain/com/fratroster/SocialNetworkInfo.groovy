package com.fratroster

import java.util.Date;

class SocialNetworkInfo {

	String facebook
	String googleplus
	String twitter
	String linkedin
	String website
	Date dateCreated
	Date lastUpdated
	
    static constraints = {
		facebook(nullable:true)
		googleplus(nullable:true)
		twitter(nullable:true)
		linkedin(nullable:true)
		website(nullable:true)
    }
}
