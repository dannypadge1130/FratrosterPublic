package com.fratroster


class State {

	Date dateCreated
	Date lastUpdated
    String stateName
	String stateAbrv
	
	static constraints = {
		stateName(blank:false)
		stateAbrv(blank:false)
    }
	
	static hasMany = [colleges:College]
}
