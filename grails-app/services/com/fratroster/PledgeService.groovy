package com.fratroster

import org.springframework.transaction.annotation.Transactional

import com.fratroster.memberType.PledgeMember

class PledgeService {

	def brotherService
	def notifierService
	def messageSource
	
	@Transactional
	def acceptPledge(Long pledgeId) {
		PledgeMember pledge = PledgeMember.get(pledgeId)
		brotherService.createNewBrother(pledge.frat.id, pledge.user.id)
		notifierService.createUserNotification(pledge.user.id, ("Congratulations! You have been accepted into"+pledge.frat.fratName+"."))
		pledge.delete()
	}
	
	@Transactional
	def denyPledge(Long pledgeId) {
		PledgeMember pledge = PledgeMember.get(pledgeId)
		notifierService.createUserNotification(pledge.user.id, ("You have been denied from"+pledge.frat.fratName+"."))
		pledge.delete()
	}
}
