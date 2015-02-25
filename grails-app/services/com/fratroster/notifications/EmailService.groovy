package com.fratroster.notifications

import static grails.async.Promises.*
import grails.async.*
import grails.transaction.Transactional
import org.springframework.context.MessageSource
import org.springframework.context.i18n.LocaleContextHolder as LCH


@Transactional
class EmailService {

	def mailService
	def MessageSource messageSource
	
    def newRegistrationPasswordEmail(userEmail,tempPassword) {
		def emailSubject = messageSource.getMessage("NEW_REGISTRATION_EMAIL", null, LCH.getLocale())
		Promise p = task {
			mailService.sendMail {
				to userEmail
				subject emailSubject
				html(view:"/emails/newUser", model:[name:userEmail, password:tempPassword]) 
			}
		}
		p.onError { Throwable err ->
			log.error("Error sending new user registration email: "+err.getMessage())
		}
		p.onComplete {
			log.info("Sent new user ["+userEmail+"] registration email.")
		}
    }
	
	def sendEduPin(userEmail,pin) {
		def emailSubject = messageSource.getMessage("VERIFY_EDU_EMAIL", null, LCH.getLocale())
		Promise p = task {
			mailService.sendMail {
				to userEmail
				subject emailSubject
				html(view:"/emails/eduPinEmail", model:[name:userEmail, pin:pin])
			}
		}
		p.onError { Throwable err ->
			log.error("Error sending new edu verification email: "+err.getMessage())
		}
		p.onComplete {
			log.info("Sent verification email for user ["+userEmail+"].")
		}
	}
	
	def forgotPassword(userEmail,tempPassword){
		def emailSubject = messageSource.getMessage("FORGOT_PASSWORD_EMAIL", null, LCH.getLocale())
		Promise p = task {
			mailService.sendMail {
				to userEmail
				subject emailSubject
				html(view:"/emails/forgotPassword", model:[name:userEmail, password:tempPassword])
			}
		}
		p.onError { Throwable err ->
			log.error("Error sending forgot password email: "+err.getMessage())
		}
		p.onComplete {
			log.info("Sent user new password ["+userEmail+"].")
		}
	}
	
	def alumniDenyed(userEmail, fratname){
		def emailSubject = messageSource.getMessage("REQUEST_DENIED_EMAIL", null, LCH.getLocale())
		Promise p = task {	
			mailService.sendMail {
				to userEmail
				subject emailSubject
				html(view:"/emails/denyAlumniEmail", model:[name:userEmail, fratname:fratname])
			}	
		}
		
		p.onError { Throwable err ->
			log.error("Error sending deny alumni email: "+err.getMessage())
		}
		p.onComplete {
			log.info("Sent deny alumni email for ["+userEmail+"].")
		}
	}
	
	def brotherAcceptance(userEmail, fratname, approved){
		Promise p = task {
			mailService.sendMail {
				to userEmail
				if(approved) {
					subject messageSource.getMessage("REQUEST_ACCEPTED_EMAIL", null, LCH.getLocale())
				} else {
					subject messageSource.getMessage("REQUEST_DENIED_EMAIL", null, LCH.getLocale())
				}
				html(view:"/emails/pendingBrotherEmail", model:[name:userEmail, fratname:fratname, isApproved:approved])
			}
		}
		
		p.onError { Throwable err ->
			log.error("Error sending brother acceptance email: "+err.getMessage())
		}
		p.onComplete {
			log.info("Sent brother acceptance email for ["+userEmail+"].")
		}
	}
	
	def rushAcceptance(userEmail, fratname, approved){
		Promise p = task {
			mailService.sendMail {
				to userEmail
				if(approved) {
					subject messageSource.getMessage("REQUEST_ACCEPTED_EMAIL", null, LCH.getLocale())
				} else {
					subject messageSource.getMessage("REQUEST_DENIED_EMAIL", null, LCH.getLocale())
				}
				html(view:"/emails/pendingRushEmail", model:[name:userEmail, fratname:fratname, isApproved:approved])
			}
		}
		
		p.onError { Throwable err ->
			log.error("Error sending rush acceptance email: "+err.getMessage())
		}
		p.onComplete {
			log.info("Sent rush acceptance email for ["+userEmail+"].")
		}
	}
}
