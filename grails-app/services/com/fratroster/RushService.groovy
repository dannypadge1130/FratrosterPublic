package com.fratroster

import org.springframework.transaction.annotation.Transactional

import com.fratroster.apps.datatype.Comment
import com.fratroster.apps.datatype.Vote
import com.fratroster.memberType.PledgeMember
import com.fratroster.memberType.RushMember
import com.fratroster.pendinguser.PendingRush
import com.fratroster.user.User

@Transactional
class RushService {
	
	def springSecurityService
	
	def createNewRushComment(String message, Long authorId, Long rushId) {
		RushMember rush = RushMember.get(rushId)
		Comment comment = new Comment()
		comment.message = message
		comment.author = User.get(authorId)
		comment.save(flush: true)
		rush.addToComments(comment)
	}
	
	def castRushVote(Long rushId, boolean liked) {
		Vote vote = new Vote()
		vote.author = springSecurityService.currentUser
		vote.liked = liked
		vote.save(flush: true)
		RushMember rush = RushMember.get(rushId)
		rush.addToVotes(vote)
	}
	
	def removeRushVote(Long rushId) {
		RushMember rush = RushMember.get(rushId)
		def vote = rush.votes.find {it.author = springSecurityService.currentUser}
		rush.removeFromVotes(vote)
	}
	
	def deleteRush(Long fratId, Long userId) {
		Frat frat = Frat.get(fratId)
		User user = User.get(userId)
		RushMember rush = RushMember.findByUserAndFrat(user, frat)
		frat.removeFromMembers(rush)
		user.removeFromFratMembers(rush)
		rush.delete()
	}
	
	def declineBid(Long fratId, Long userId) {
		//TODO: notify the frat that the rush has denied their bid
		deleteRush(fratId, userId)
	}
	
	def createNewPledge(Long fratId, Long userId) {
		Frat frat = Frat.get(fratId)
		User user = User.get(userId)
		PledgeMember pledge = new PledgeMember()
		pledge.frat = frat
		pledge.user = user
		pledge.save(flush: true)
		if(!pledge.hasErrors()) {
			frat.addToMembers(pledge)
			user.addToFratMembers(pledge)
		}
		log.debug("Created pledge, userId: "+userId+" from fratId: "+fratId)
	}
	
	def acceptedBid(Long fratId, Long userId) {
		//TODO: notify the frat the rush has accepted bid
		Frat frat = Frat.get(fratId)
		User user = User.get(userId)
		//delete rush member
		deleteRush(fratId, userId)
		//create pledge member
		createNewPledge(fratId, userId)
		
		//if not a buisness frat then delete other rushing frats
		if(frat.fratType != Frat.BUSINESS) {
			List<RushMember> rushing = RushMember.findAllByUserAndFrat(user, frat)
			if(rushing != null) {
				for(RushMember rush : rushing) {
					if(rush.frat.fratType != Frat.BUSINESS) {
						deleteRush(rush.frat.id, userId)
					}
				}
			}
		}
	}
	
	def createNewRush(Long fratId, Long userId) {
		RushMember newRush = new RushMember()
		Frat rushsFrat = Frat.get(fratId)
		User user = User.get(userId)
		newRush.approved = false
		newRush.frat = rushsFrat
		newRush.user = User.get(userId)
		newRush.save(flush: true)
		if(!newRush.hasErrors()) {
			rushsFrat.addToMembers(newRush)
			user.addToFratMembers(newRush)
		}
		log.debug("Created rush, userId: "+userId+" from fratId: "+fratId)
	}
	
	def createNewPendingRush(Long fratId, Long userId, boolean invited) {
		PendingRush pRush = new PendingRush()
		Frat currFrat = Frat.get(fratId)
		pRush.invited = invited
		pRush.user = User.get(userId)
		pRush.frat = currFrat
		pRush.save(flush: true)
		if(!pRush.hasErrors()) {
			currFrat.addToPendingRushs(pRush)
		}
		return pRush
	}
	
	def approvedPendingRush(Long fratId, Long userId) {
		Frat frat = Frat.get(fratId)
		User user = User.get(userId)
		PendingRush pRush = PendingRush.findByUserAndFrat(user, frat)
		frat.removeFromPendingRushs(pRush)
		pRush.delete(flush: true)
		log.debug("Deleted pending rush, userId: "+userId+" from fratId: "+fratId)
		createNewRush(fratId, userId)
	}
	
	def deletePendingRush(Long fratId, Long userId) {
		Frat frat = Frat.get(fratId)
		User user = User.get(userId)
		PendingRush pRush = PendingRush.findByUserAndFrat(user, frat)
		frat.removeFromPendingRushs(pRush)
		pRush.delete(flush: true)
		log.debug("Deleted pending rush, userId: "+userId+" from fratId: "+fratId)
	}
	
	@Transactional(readOnly=true)
	def fetchActiveRushs() {
		def currentUser = springSecurityService.currentUser;
		def userList = User.findAllByCollegeAndActiveRush(currentUser.college, true)
		if(userList.contains(currentUser)) {
			userList.remove(currentUser);
		}
		return userList.sort{it.profile.getFullName()}
	}
}