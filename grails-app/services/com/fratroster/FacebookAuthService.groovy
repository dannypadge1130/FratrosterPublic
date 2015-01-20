package com.fratroster

import org.codehaus.jackson.JsonNode
import org.springframework.social.facebook.api.Facebook
import org.springframework.social.facebook.api.FacebookProfile
import org.springframework.social.facebook.api.ImageType
import org.springframework.social.facebook.api.impl.FacebookTemplate
import org.springframework.social.support.URIBuilder

import com.fratroster.facebook.ExtFacebookTemplate
import com.fratroster.user.FacebookUser
import com.fratroster.user.User
import com.the6hours.grails.springsecurity.facebook.FacebookAuthToken

class FacebookAuthService {
	
	def userService
	def springSecurityService

    FacebookUser create(FacebookAuthToken token) {
		Facebook facebook = new FacebookTemplate(token.accessToken.accessToken)
		FacebookProfile fbProfile = facebook.userOperations().userProfile
		User person = userService.createNewUserFromFBProfile(fbProfile)	
		FacebookUser fbUser = userService.createNewFacebookUser(person, token.uid, token.accessToken.accessToken, token.accessToken.expireAt)
        return fbUser
    }
	
	String getUserImageUrl() {
		User user = springSecurityService.currentUser
		FacebookUser fbUser = FacebookUser.findByUser(user)
		Facebook facebook = new ExtFacebookTemplate(fbUser.accessToken)
		return facebook.fetchPictureUrl(facebook.userOperations().userProfile.id, ImageType.LARGE)
	}
}