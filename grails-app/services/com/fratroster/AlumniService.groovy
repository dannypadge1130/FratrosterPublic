package com.fratroster

import org.springframework.transaction.annotation.Transactional
import com.fratroster.memberType.AlumniMember
import com.fratroster.pendinguser.PendingAlumni
import com.fratroster.user.Role
import com.fratroster.user.User
import com.fratroster.user.UserProfile
import com.fratroster.user.UserRole

class AlumniService {

	def commonService
	
//	@Transactional
//	def createNewApprovedAlumni(Long pendingAlumniId) throws Exception {
//		PendingAlumni pAlumni = PendingAlumni.get(pendingAlumniId)
//		User userInstance = new User()
//
//		Role role = Role.findByAuthority("ROLE_USER")
//		//UserRole.create userInstance, role, true
//		
//		AlumniMember newAlumni = new AlumniMember()
//		newAlumni.frat = pAlumni?.alumFrat
//		newAlumni.user = userInstance
//		newAlumni.profession = pAlumni.profession
//		newAlumni.save(flush: true)
//		pAlumni.alumFrat.addToAlumni(newAlumni)
//		
//		//TODO: call approve pending alumni email in EmailService
//		
//		FratApp app = pAlumni.alumFrat.apps.find { it.actionView == "pendingUserApp" }
//		Frat userFrat = app.frat
//		userFrat.removeFromPendingAlumnis(pAlumni);
//		pAlumni.delete()
//	}
	
//	@Transactional
//	def UserProfile createAlumniProfile(PendingAlumni pAlumni) throws Exception {
//		def newAlumniProfile = new UserProfile()
//		newAlumniProfile.firstName = pAlumni?.firstName
//		newAlumniProfile.lastName = pAlumni?.lastName
//		newAlumniProfile.graduationYear = (new Date()[Calendar.YEAR]).toString()
//		newAlumniProfile.profileImage = pAlumni.profileImage
//		newAlumniProfile.save(flush: true)
//		return newAlumniProfile
//	}
	
	@Transactional
	def createPendingAlumni(Long userId, Long fratId) {
		Frat currFrat = Frat.get(fratId)
		PendingAlumni pAlumni = new PendingAlumni()
		pAlumni.alumFrat = currFrat
		pAlumni.user = User.get(userId)
		pAlumni.save(flush: true)
		if(!pAlumni.hasErrors()) {
			currFrat.addToPendingAlumnis(pAlumni)
		}
		return pAlumni
	}
	
	@Transactional
	def denyPendingAlumni(Long id) throws Exception {
		PendingAlumni pAlumni = PendingAlumni.get(id)
		//TODO: call deny pending alumni email in EmailService
		pAlumni.delete()
	}
}
