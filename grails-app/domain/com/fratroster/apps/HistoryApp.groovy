package com.fratroster.apps

import com.fratroster.FratApp

class HistoryApp extends FratApp {
	
	Date dateCreated
	Date lastUpdated
	String description

    static constraints = {
		description(maxSize: 500)
	}
}
