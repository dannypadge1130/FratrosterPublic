package com.fratroster

import grails.transaction.Transactional

import java.text.SimpleDateFormat
import java.util.regex.Matcher
import java.util.regex.Pattern

import org.springframework.social.facebook.api.FacebookProfile

import com.fratroster.constants.GlobalKeyValues
import com.fratroster.user.FacebookUser
import com.fratroster.user.Role
import com.fratroster.user.User
import com.fratroster.user.UserContact
import com.fratroster.user.UserProfile
import com.fratroster.user.UserRole

@Transactional
class UserService {

	def commonService
	def emailService
	
	@Transactional
	def createNewRegUser(Map<String, String> userRegMap) {
		User user = new User()
		user.username = userRegMap.get(GlobalKeyValues.USER_USERNAME, null)
		def tempPassword = commonService.generateNewPassword()
		user.password = tempPassword
		user.enabled = true
		user.accountExpired = false
		user.accountLocked = false
		user.passwordExpired = false
		user.profile = createNewRegUserProfile(userRegMap)
		if(user.save()) {
			defineUserRole(user)
		}
		emailService.newRegistrationPasswordEmail(user, tempPassword)
		return user
	}
	
	@Transactional
	def createNewUserFromFBProfile(FacebookProfile fbProfile) {
		User user = new User()
		user.username = fbProfile.email
		user.password = commonService.generateNewPassword()
		user.enabled = true
		user.accountExpired = false
		user.accountLocked = false
		user.passwordExpired = false
		user.profile = createNewFBUserProfile(fbProfile)
		user.save(flush: true)
		defineUserRole(user)
		//TODO: send user a thank you for registering email
		return user
	}
	
	@Transactional
	def createNewFacebookUser(User user, long tokenUid, String accessToken, Date accessTokenExpires) {
		FacebookUser fbUser = new FacebookUser()
		fbUser.uid = tokenUid
		fbUser.accessToken = accessToken
		fbUser.accessTokenExpires = accessTokenExpires
		fbUser.user = user
		fbUser.save(flush: true)
		defineFacebookUserRole(user)
		return fbUser
	}
	
	@Transactional
	def createNewFBUserProfile(FacebookProfile fbProfile) {
		UserProfile profile = new UserProfile()
		profile.firstName = fbProfile.firstName
		profile.lastName = fbProfile.lastName
		
		Calendar now = Calendar.getInstance();
		int year = now.get(Calendar.YEAR);
		SimpleDateFormat f = new SimpleDateFormat("yyyy")
		profile.graduationYear = f.parse(String.valueOf(year))
		
		def userContact = new UserContact()
		userContact.preferredEmail = fbProfile.email
		profile.contactInfo = userContact
		
		def socialNetworkInfo = new SocialNetworkInfo()
		socialNetworkInfo.facebook = fbProfile.link
		socialNetworkInfo.save(flush: true)
		profile.socialNetworkInfo = socialNetworkInfo
		profile.save(flush: true)
		return profile
	}
	
	@Transactional
	def createNewRegUserProfile(Map<String, String> userRegMap) {
		UserProfile profile = new UserProfile()
		profile.firstName = userRegMap.get(GlobalKeyValues.PROFILE_FIRST_NAME, "")
		profile.lastName = userRegMap.get(GlobalKeyValues.PROFILE_LAST_NAME, "")
		
		Calendar now = Calendar.getInstance();
		int year = now.get(Calendar.YEAR);
		SimpleDateFormat f = new SimpleDateFormat("yyyy")
		profile.graduationYear = f.parse(String.valueOf(year))
		
		def userContact = new UserContact()
		profile.contactInfo = userContact
		def socialNetworkInfo = new SocialNetworkInfo()
		socialNetworkInfo.save(flush: true)
		profile.socialNetworkInfo = socialNetworkInfo
		profile.save(flush: true)
		return profile
	}
	
	@Transactional
	def updateUsersSocialNetworkLinks(User user, Map<String, String> map) {
		if(!map.isEmpty() && map.size() > 0) {
			SocialNetworkInfo social = user.profile.socialNetworkInfo
			for (Map.Entry<String, String> entry : map.entrySet()) {
				if(entry.key.equals(GlobalKeyValues.SOCIALMEDIA_FACEBOOK)) {
					social.facebook = entry.value
				} else if (entry.key.equals(GlobalKeyValues.SOCIALMEDIA_GOOGLEPLUS)) {
					social.googleplus = entry.value
				} else if (entry.key.equals(GlobalKeyValues.SOCIALMEDIA_LINKEDIN)) {
					social.linkedin = entry.value
				} else if (entry.key.equals(GlobalKeyValues.SOCIALMEDIA_TWITTER)) {
					social.twitter = entry.value
				} else if (entry.key.equals(GlobalKeyValues.SOCIALMEDIA_WEBSITE)) {
					social.website = entry.value
				}
			}
			social.save(flush: true)
		}
	}
	
	@Transactional
	def updateUserProfile(User user, Map<String, String> map) {
		if(!map.isEmpty() && map.size() > 0) {
			UserProfile userProfile = user.profile
			UserContact userContact = user.profile.contactInfo
			for (Map.Entry<String, String> entry : map.entrySet()) {
				if(entry.key.equals(GlobalKeyValues.PROFILE_FIRST_NAME)) {
					userProfile.firstName = entry.value
				} else if (entry.key.equals(GlobalKeyValues.PROFILE_LAST_NAME)) {
					userProfile.lastName = entry.value
				} else if (entry.key.equals(GlobalKeyValues.PROFILE_GRADUATION_YEAR)) {
					SimpleDateFormat f = new SimpleDateFormat("EEE MMM dd HH:mm:ss zzz yyyy");
					userProfile.graduationYear = f.parse(entry.value)
				} else if (entry.key.equals(GlobalKeyValues.PROFILE_GPA)) {
					userProfile.gpa = entry.value
				} else if (entry.key.equals(GlobalKeyValues.PROFILE_MAJOR)) {
					userProfile.major = entry.value
				} else if(entry.key.equals(GlobalKeyValues.PROFILE_HIGHSCHOOL)) {
					userProfile.highschool = entry.value
				} else if(entry.key.equals(GlobalKeyValues.PROFILE_LEGACY)) {
					userProfile.legacy = entry.value
				} else if (entry.key.equals(GlobalKeyValues.PROFILE_CONTACT_ADDRESS1))  {
					userContact.address1 = entry.value
				} else if (entry.key.equals(GlobalKeyValues.PROFILE_CONTACT_ADDRESS2)) {
					userContact.address2 = entry.value
				} else if(entry.key.equals(GlobalKeyValues.PROFILE_CONTACT_PREFERRED_EMAIL)) {
					userContact.preferredEmail = entry.value
				} else if(entry.key.equals(GlobalKeyValues.PROFILE_CONTACT_PHONE)) {
					userContact.phone = entry.value
				}
			}
			userProfile.contactInfo = userContact
			user.profile = userProfile
			user.save()
		}
		return user
	}
	
	@Transactional
	def updateUserPassword(User user, String password, String verifyPassword) {
		if(password == verifyPassword) {
			user.password = password
			user.save(flush: true)
		} else {
			user.errors.reject("invalid.matchingpasswords","")
		}
		return user;
	}
	
	@Transactional
	def defineUserRole(User user) {
		Role role = Role.findByAuthority("ROLE_USER")
		UserRole.create user, role, true
	}
	
	@Transactional
	def defineFacebookUserRole(User user) {
		Role role = Role.findByAuthority("ROLE_FACEBOOK")
		UserRole.create user, role, true
	}
	
	@Transactional
	def eduEmailValidation(User user, String eduEmail) {
		def eduEmailPattern = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"+"[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.edu)"
		Matcher matcher = Pattern.compile(eduEmailPattern).matcher(eduEmail);
		if(matcher.matches()) {
			List<String> tokEmail = eduEmail.tokenize('@')
			def college = College.findByEmailDomain(tokEmail.get(1))
			if(college != null) {
				user.verificationPin = commonService.generatePin()
				user.college = college
				user.profile.contactInfo.state = college.state
				user.save(flush: true)
				emailService.sendEduPin(eduEmail, user.verificationPin)
			} else {
				user.errors.reject("edu.email.missing.college","")
			}
		} else {
			user.errors.reject("edu.email.invalid","")
		}
		return user
	}
	
	@Transactional
	def eduEmailPinValidation(User user, String pin) {
		if(pin == user.verificationPin) {
			user.verificationPin = ""
			user.validEduEmail = true
			user.save(flush: true)
		} else {
			user.errors.reject("edu.email.pin.invalid","")
		}
		return user
	}
	
	@Transactional(readOnly=true)
	def getUserToFratRelation(User user, List<Frat> frats){
		Map<Frat, String> membershipStatus = new HashMap<Frat, String>();
		Map<Frat, String> usersFrats = new HashMap<Frat, String>();
		for(FratMember member : user.fratMembers) {
			usersFrats.put(member.frat, member.type);
		}
		
		for(Frat frat : frats) {
			if(usersFrats.containsKey(frat)) {
				membershipStatus.put(frat, usersFrats.get(frat))		
			} else {
				membershipStatus.put(frat, "nonmember");
			}
		}
		
		return membershipStatus;
	}
}
