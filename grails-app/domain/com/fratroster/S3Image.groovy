package com.fratroster


class S3Image {

	Date dateCreated
	Date lastUpdated
	String imageUrl
	String imageName //image name stored to allow for easier deletion
	
    static constraints = {
		imageUrl(blank:false)
		imageName(blank:false)	
    }
}
