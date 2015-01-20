grails.servlet.version = "2.5" // Change depending on target container compliance (2.5 or 3.0)
grails.project.class.dir = "target/classes"
grails.project.test.class.dir = "target/test-classes"
grails.project.test.reports.dir = "target/test-reports"
grails.project.target.level = 1.6
grails.project.source.level = 1.6
grails.project.dependency.resolver = "maven"

grails.project.fork = [
	// configure settings for the test-app JVM, uses the daemon by default
	test: [maxMemory: 768, minMemory: 64, debug: false, maxPerm: 256, daemon:true],
	// configure settings for the run-app JVM
	run: [maxMemory: 768, minMemory: 64, debug: false, maxPerm: 256, forkReserve:false],
	// configure settings for the run-war JVM
	war: [maxMemory: 768, minMemory: 64, debug: false, maxPerm: 256, forkReserve:false],
	// configure settings for the Console UI JVM
	console: [maxMemory: 768, minMemory: 64, debug: false, maxPerm: 256]
 ]

grails.project.dependency.resolution = {
	// inherit Grails' default dependencies
	inherits("global") {
		// specify dependency exclusions here; for example, uncomment this to disable ehcache:
		// excludes 'ehcache'
	}
	log "warn" // log level of Ivy resolver, either 'error', 'warn', 'info', 'debug' or 'verbose'
	checksums true // Whether to verify checksums on resolve
	legacyResolve false // whether to do a secondary resolve on plugin installation, not advised and here for backwards compatibility

	repositories {
		inherits true // Whether to inherit repository definitions from plugins

		grailsPlugins()
		grailsHome()
		grailsCentral()

		mavenLocal()
		mavenCentral()

		mavenRepo "http://repo.spring.io/snapshot"
		mavenRepo 'http://repo.spring.io/milestone'
	}

	dependencies {
		runtime 'mysql:mysql-connector-java:5.1.30'
		runtime 'org.springframework:spring-test:3.1.0.RELEASE'
		runtime "org.springframework.social:spring-social-facebook:1.0.3.RELEASE"
		compile "net.java.dev.jets3t:jets3t:0.9.0"
	}

	plugins {
		build ':tomcat:7.0.42'
		
		runtime ':hibernate:3.6.10.3'
		runtime ':jquery:1.8.3'
		runtime ':resources:1.2'
		runtime ':database-migration:1.3.8'
		
		compile ':scaffolding:1.0.0'
		compile ':cache:1.0.1'
		compile ':spring-security-core:1.2.7.3'
		compile ':spring-security-facebook:0.15.2'
		compile ':quartz-monitor:0.3-RC2'
		compile ':quartz:1.0-RC13'
		compile ':mail:1.0.1', {
			excludes 'spring-test'
		}
	}
}