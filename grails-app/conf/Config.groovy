import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;

grails.project.groupId = appName // change this to alter the default package name and Maven publishing destination
grails.mime.file.extensions = true // enables the parsing of file extensions from URLs into the request format
grails.mime.use.accept.header = false
grails.mime.types = [
    all:           '*/*',
    atom:          'application/atom+xml',
    css:           'text/css',
    csv:           'text/csv',
    form:          'application/x-www-form-urlencoded',
    html:          ['text/html','application/xhtml+xml'],
    js:            'text/javascript',
    json:          ['application/json', 'text/json'],
    multipartForm: 'multipart/form-data',
    rss:           'application/rss+xml',
    text:          'text/plain',
    xml:           ['text/xml', 'application/xml']
]

// What URL patterns should be processed by the resources plugin
grails.resources.adhoc.patterns = ['/images/*', '/css/*', '/js/*', '/plugins/*']

// The default codec used to encode data with ${}
grails.views.default.codec = "none" // none, html, base64
grails.views.gsp.encoding = "UTF-8"
grails.converters.encoding = "UTF-8"
// enable Sitemesh preprocessing of GSP pages
grails.views.gsp.sitemesh.preprocess = true
// scaffolding templates configuration
grails.scaffolding.templates.domainSuffix = 'Instance'

// Set to false to use the new Grails 1.2 JSONBuilder in the render method
grails.json.legacy.builder = false
// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true
// packages to include in Spring bean scanning
grails.spring.bean.packages = []
// whether to disable processing of multi part requests
grails.web.disable.multipart=false

// request parameters to mask when logging exceptions
grails.exceptionresolver.params.exclude = ['password']

// configure auto-caching of queries by default (if false you can cache individual queries with 'cache: true')
grails.hibernate.cache.queries = false

environments {
    development {
		grails.plugins.springsecurity.portMapper.httpPort = 8080
		grails.plugins.springsecurity.portMapper.httpsPort = 8443
        grails.logging.jul.usebridge = true
		grails.serverURL = "http://localhost:8080/${appName}"
		grails.plugins.springsecurity.facebook.appId="APP_ID"
		grails.plugins.springsecurity.facebook.secret="SECRET_ID"
		
		grails.mail.host = "smtp.gmail.com"
		grails.mail.port = 465
		grails.mail.username = "fratroster@fratroster.com"
		grails.mail.password = "PASSWORD"
		grails.mail.default.from="support@fratroster.com"
		grails.mail.props = ["mail.smtp.auth":"true", "mail.smtp.socketFactory.port":"465",
					   "mail.smtp.socketFactory.class":"javax.net.ssl.SSLSocketFactory",
					   "mail.smtp.socketFactory.fallback":"false"]
    }
	
	test {
		grails.logging.jul.usebridge = false
		grails.serverURL = "http://www.fratroster.com"
		grails.plugins.springsecurity.facebook.appId="APP_ID"
		grails.plugins.springsecurity.facebook.secret="SECRET_ID"
		
		grails.plugin.databasemigration.dbDocController.enabled = true
		grails.plugin.databasemigration.updateOnStart = true
		grails.plugin.databasemigration.updateOnStartFileNames = ['changelog.groovy']
		
		grails.mail.host = "smtp.gmail.com"
		grails.mail.port = 465
		grails.mail.username = "fratroster@fratroster.com"
		grails.mail.password = "PASSWORD"
		grails.mail.default.from="support@fratroster.com"
		grails.mail.props = ["mail.smtp.auth":"true", "mail.smtp.socketFactory.port":"465",
					   "mail.smtp.socketFactory.class":"javax.net.ssl.SSLSocketFactory",
					   "mail.smtp.socketFactory.fallback":"false"]
	}
	
    production {
        grails.logging.jul.usebridge = false
        grails.serverURL = "http://www.fratroster.com"
		grails.plugins.springsecurity.facebook.appId="APP_ID"
		grails.plugins.springsecurity.facebook.secret="SECRET_ID"
		
		grails.plugin.databasemigration.dbDocController.enabled = true
		grails.plugin.databasemigration.updateOnStart = true
		grails.plugin.databasemigration.updateOnStartFileNames = ['changelog.groovy']
		
		grails.mail.host = "smtp.gmail.com"
		grails.mail.port = 465
		grails.mail.username = "fratroster1@gmail.com"
		grails.mail.password = "PASSWORD"
		grails.mail.default.from="support@fratroster.com"
		grails.mail.props = ["mail.smtp.auth":"true", "mail.smtp.socketFactory.port":"465",
					   "mail.smtp.socketFactory.class":"javax.net.ssl.SSLSocketFactory",
					   "mail.smtp.socketFactory.fallback":"false"]
    }
}

// log4j configuration
log4j = {
	debug  'grails.app.jobs'
    error  'org.codehaus.groovy.grails.web.servlet',        // controllers
           'org.codehaus.groovy.grails.web.pages',          // GSP
           'org.codehaus.groovy.grails.web.sitemesh',       // layouts
           'org.codehaus.groovy.grails.web.mapping.filter', // URL mapping
           'org.codehaus.groovy.grails.web.mapping',        // URL mapping
           'org.codehaus.groovy.grails.commons',            // core / classloading
           'org.codehaus.groovy.grails.plugins',            // plugins
           'org.codehaus.groovy.grails.orm.hibernate',      // hibernate integration
           'org.springframework',
           'org.hibernate',
           'net.sf.ehcache.hibernate'
}

// Added by the Spring Security Core plugin:
grails.plugins.springsecurity.userLookup.userDomainClassName = 'com.fratroster.user.User'
grails.plugins.springsecurity.userLookup.authorityJoinClassName = 'com.fratroster.user.UserRole'
grails.plugins.springsecurity.authority.className = 'com.fratroster.Role'
grails.plugins.springsecurity.successHandler.defaultTargetUrl = '/profile'

grails.plugins.springsecurity.facebook.domain.classname='com.fratroster.user.FacebookUser'
grails.plugins.springsecurity.facebook.filter.redirect.successHandler = 'redirectSuccessHandler'
grails.plugins.springsecurity.facebook.filter.redirect.failureHandler='redirectFailureHandler'
grails.plugins.springsecurity.facebook.filter.type='redirect'

grails.plugins.springsecurity.secureChannel.useHeaderCheckChannelSecurity = true
grails.plugin.springsecurity.secureChannel.definition = [
	'/': 'REQUIRES_INSECURE_CHANNEL',
	'/signup': 'REQUIRES_INSECURE_CHANNEL', 
	'/about': 'REQUIRES_INSECURE_CHANNEL',
	'/login/auth': 'REQUIRES_INSECURE_CHANNEL',
	'/forgotpassword': 'REQUIRES_INSECURE_CHANNEL',
	'/**':	'REQUIRES_SECURE_CHANNEL',
 ]

grails.views.javascript.library="jquery"