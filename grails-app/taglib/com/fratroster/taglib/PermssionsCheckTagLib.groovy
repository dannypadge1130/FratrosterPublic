package com.fratroster.taglib

import com.fratroster.Frat
import com.fratroster.FratApp

class PermssionsCheckTagLib {
	def springSecurityService
	def permissionService
	
	def hasReadPermission = { attrs, body ->
		if(springSecurityService.isLoggedIn()) {
			Frat frat = Frat.get(attrs.fratId)
			FratApp fratApp = FratApp.findByIdentifierAndFrat(attrs.identifier, frat)
			if(permissionService.readPermissionsCheck(fratApp.id)) {
				out << body()
			}
		}
	}
	
	def hasWritePermission = { attrs, body ->
		if(springSecurityService.isLoggedIn()) {
			Frat frat = Frat.get(attrs.fratId)
			FratApp fratApp = FratApp.findByIdentifierAndFrat(attrs.identifier, frat)
			if(permissionService.writePermissionsCheck(fratApp.id)) {
				out << body()
			}
		}
	}
}
