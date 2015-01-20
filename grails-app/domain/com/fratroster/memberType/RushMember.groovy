package com.fratroster.memberType

import com.fratroster.FratMember
import com.fratroster.Notification
import com.fratroster.apps.datatype.Comment
import com.fratroster.apps.datatype.Vote
import com.fratroster.user.User

class RushMember extends FratMember {

	boolean accepted = false //sent a bid
	String type = 'rush'
	
    static constraints = {
		accepted(blank:true)
	}
	
	int getDislikeCount() {
		int currCount = 0
		if(this.votes != null && !this.votes.isEmpty()) {
			for(Vote vote : this.votes) {
				if(!vote.liked) {
					currCount++
				}
			}	
		}
		return currCount;
	}
	
	int getLikeCount() {
		int currCount = 0
		if(this.votes != null && !this.votes.isEmpty()) {
			for(Vote vote : this.votes) {
				if(vote.liked) {
					currCount++
				}
			}
		}
		return currCount;
	}
	
	Vote getUsersVote(User user) {
		Vote currvote = null
		if(this.votes != null) {
			for (Vote vote : this.votes) {
				if(vote.author == user) {
					currvote = vote 
				}
			}
		}
		return currvote
	}
	
	List<Notification> getOrderedCommentList() {
		List<Comment> comment = this.comments.asList().sort{it.dateCreated}
		return comment
	}
	static hasMany = [comments: Comment, votes: Vote]
}

