package com.fratroster.notifications

import com.fratroster.Notification
import com.fratroster.user.User
import grails.transaction.Transactional

@Transactional
class UserNotificationMessageService {

	def createUserNotification(Long userId, String message) {
		try {
			User user = User.get(userId)
			Notification note = new Notification()
			note.message = message
			note.user = user
			note.save(flush: true)
		} catch (Exception e) {
			log.error("Issue generating notification for user event: " +e.getMessage())
		}
	}
}