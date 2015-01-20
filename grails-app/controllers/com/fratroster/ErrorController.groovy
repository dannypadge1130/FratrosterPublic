package com.fratroster

abstract class ErrorController {
	
	def defaultException(Exception e){
		log.error("Fatal Exception has occured: "+e);
		if(log.debugEnabled) {
			log.error("StackTrace: "+e.getStackTrace())
		}
		[errorMsg: message(code:"GENERIC_ERROR")]
	}
}
