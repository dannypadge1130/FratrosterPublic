package com.fratroster

import grails.transaction.Transactional

import com.fratroster.memberType.BrotherMember
import com.fratroster.pendinguser.PendingMember
import com.fratroster.user.User

@Transactional
class BrotherService {

	@Transactional
	def denyPendingBrother(Long id) throws Exception {
		PendingMember pMember = PendingMember.get(id)
		//TODO: call deny brother email in EmailService
		pMember.delete()
	}
	
	@Transactional
	def approvedPendingBrother(Long id) throws Exception {
		PendingMember pMember = PendingMember.get(id)
		try {
			createNewBrother(pMember.frat.id, pMember.user.id)
		} catch (Exception e) {
			log.error("Error create new brother object: "+e.getMessage())
			throw e;
		}
		//call approve brother email in EmailService		
		pMember.delete()
	}
	
	@Transactional
	def createPendingBrother(Long fratId, Long userId) {
		Frat currFrat = Frat.get(fratId)
		PendingMember pBrother = new PendingMember()
		pBrother.frat = currFrat
		pBrother.user = User.get(userId)
		pBrother.save(flush: true)
		if(pBrother.hasErrors()) {
			currFrat.addToPendingMembers(pBrother)
		}
		return pBrother
	}
	
//	@Transactional
//	def createNewBrother(Long fratId, Long userId) throws Exception {
//		Frat currFrat = Frat.get(fratId)
//		BrotherMember brother = new BrotherMember()
//		brother.frat = currFrat
//		brother.user = User.get(userId)
//		brother.save(flush: true)
//		currFrat.addToBrothers(brother)
//	}
}
