package com.fratroster.user

import com.fratroster.College
import com.fratroster.Frat
import com.fratroster.FratMember
import com.fratroster.Notification
import com.fratroster.pendinguser.PendingRush

class User {

	transient springSecurityService

	Date dateCreated
	Date lastUpdated
	String username
	String password
	College college
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired
	boolean activeRush = false
	boolean validEduEmail = false
	String verificationPin
	UserProfile profile
	
	static hasMany = [fratMembers:FratMember, notifications: Notification]

	static constraints = {
		activeRush(blank:false)
		validEduEmail(blank: false)
		username(blank:false, unique:true, email: true)
		college(nullable:true)
		password(blank:false)
		accountExpired(blank:false)
		passwordExpired(blank: false)
		enabled(blank: false)
		verificationPin(nullable:true)
	}

	static mapping = {
		notifications sort:'dateCreated'
		password column: '`password`'
		profile lazy:false
		college lazy:false
	}
	
	int getNumberOfUnreadNotifications() {
		int currCount = 0
		if(this.notifications != null) {
			for(Notification note : this.notifications) {
				if(note.read){
					currCount++
				}
			}
		}
		return currCount
	}
	
	List<Frat> getOwnerships() {
		def frats = new ArrayList<Frat>();
		for(FratMember member : this.fratMembers) {
			if(member.frat.fratAdmin == this) {
				frats.add(member.frat);
			}
		}
		return frats
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}
}
