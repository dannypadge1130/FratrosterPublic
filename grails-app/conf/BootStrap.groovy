import grails.util.Environment

import java.text.SimpleDateFormat

import com.fratroster.College
import com.fratroster.Frat
import com.fratroster.FratApp;
import com.fratroster.FratMember
import com.fratroster.FratMemberAppPermission
import com.fratroster.S3Image
import com.fratroster.SocialNetworkInfo
import com.fratroster.State
import com.fratroster.apps.AlumniListApp
import com.fratroster.apps.BrotherListApp
import com.fratroster.apps.HistoryApp
import com.fratroster.apps.PendingUserApp
import com.fratroster.apps.PledgeListApp
import com.fratroster.apps.RushListApp
import com.fratroster.memberType.BrotherMember
import com.fratroster.memberType.PledgeMember
import com.fratroster.memberType.RushMember
import com.fratroster.pendinguser.PendingMember
import com.fratroster.pendinguser.PendingRush
import com.fratroster.user.Role
import com.fratroster.user.User
import com.fratroster.user.UserContact
import com.fratroster.user.UserProfile
import com.fratroster.user.UserRole

class BootStrap {
	
       def static final String FRAT_THUMBNAIL_BUCKET = "https://s3.amazonaws.com/fratroster/frat_thumbnails/"
	   def static final String COLLEGE_IMAGE_BUCKET = "https://s3.amazonaws.com/fratroster/college_thumbnails/"
	   def static final String DEFAULT_DESCRIPTION = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam ultrices purus et pulvinar iaculis. Curabitur vel adipiscing metus, nec venenatis est. Proin sit amet tincidunt ligula."
	
	   def generateFratApps() {

		   for(frat in Frat.list()) {
			   List<FratMember> flist = frat.getMembers().asList()
			   
			   if(frat.apps == null || !frat.apps.contains(PendingUserApp)) {
				   PendingUserApp fratPendingUserApp = new PendingUserApp(globallyViewable: false)
				   fratPendingUserApp.frat = frat
				   fratPendingUserApp.appName = "Pending"
				   fratPendingUserApp.identifier = "pendinguserapp"
				   fratPendingUserApp.description = DEFAULT_DESCRIPTION
				   fratPendingUserApp.image = "fa fa-question fa-3x"
				   fratPendingUserApp.save(flush: true)
				   
				   for (fmember in flist) {
					   FratMemberAppPermission fpermission = new FratMemberAppPermission(permissions: "WR")
					   fpermission.fratMember = fmember
					   fpermission.fratApp = fratPendingUserApp
					   fpermission.save(flush: true)
					   fmember.addToFratMemberAppPermissions(fpermission).save(flush: true)
				   }
			   }
			   
			   if(frat.apps == null || !frat.apps.contains(AlumniListApp)) {
				   AlumniListApp fratAlumniListApp = new AlumniListApp(globallyViewable: true)
				   fratAlumniListApp.frat = frat
				   fratAlumniListApp.identifier = "alumnilistapp"
				   fratAlumniListApp.appName = "Alumni"
				   fratAlumniListApp.description = DEFAULT_DESCRIPTION
				   fratAlumniListApp.image = "fa fa-briefcase fa-3x"
				   fratAlumniListApp.save(flush: true)
				   
				   for (fmember in flist) {
					   FratMemberAppPermission fpermission = new FratMemberAppPermission(permissions: "WR")
					   fpermission.fratMember = fmember
					   fpermission.fratApp = fratAlumniListApp
					   fpermission.save(flush: true)
					   fmember.addToFratMemberAppPermissions(fpermission).save(flush: true)
				   }
			   }
			   
			   if(frat.apps == null || !frat.apps.contains(BrotherListApp)) {
				   BrotherListApp fratBrotherListApp = new BrotherListApp()
				   fratBrotherListApp.globallyViewable = true
				   fratBrotherListApp.frat = frat
				   fratBrotherListApp.identifier = "brotherlistapp"
				   fratBrotherListApp.appName = "Brothers"
				   fratBrotherListApp.description = DEFAULT_DESCRIPTION
				   fratBrotherListApp.image = "fa fa-user fa-3x"
				   fratBrotherListApp.save(flush: true)
	  
				   for (fmember in flist) {
					   FratMemberAppPermission fpermission = new FratMemberAppPermission(permissions: "WR")
					   fpermission.fratMember = fmember
					   fpermission.fratApp = fratBrotherListApp
					   fpermission.save(flush: true)
					   fmember.addToFratMemberAppPermissions(fpermission).save(flush: true)
				   }
			   }
			   
			   if(frat.apps == null || !frat.apps.contains(PledgeListApp)) {
				   PledgeListApp fratPledgeListApp = new PledgeListApp()
				   fratPledgeListApp.globallyViewable = true
				   fratPledgeListApp.frat = frat
				   fratPledgeListApp.identifier = "pledgelistapp"
				   fratPledgeListApp.appName = "Pledges"
				   fratPledgeListApp.description = DEFAULT_DESCRIPTION
				   fratPledgeListApp.image = "fa fa-meh-o fa-3x"
				   fratPledgeListApp.save(flush: true)
				   
				   for (fmember in flist) {
					   FratMemberAppPermission fpermission = new FratMemberAppPermission(permissions: "WR")
					   fpermission.fratMember = fmember
					   fpermission.fratApp = fratPledgeListApp
					   fpermission.save(flush: true)
					   fmember.addToFratMemberAppPermissions(fpermission).save(flush: true)
				   }
			   }
			   
			   if(frat.apps == null || !frat.apps.contains(HistoryApp)) {
				   HistoryApp fratHistoryApp = new HistoryApp()
				   fratHistoryApp.globallyViewable = true
				   fratHistoryApp.frat = frat
				   fratHistoryApp.identifier = "historyapp"
				   fratHistoryApp.appName = "History"
				   fratHistoryApp.description = DEFAULT_DESCRIPTION
				   fratHistoryApp.image = "fa fa-edit fa-3x"
				   fratHistoryApp.save(flush: true)
				   
				   for (fmember in flist) {
					   FratMemberAppPermission fpermission = new FratMemberAppPermission(permissions: "WR")
					   fpermission.fratMember = fmember
					   fpermission.fratApp = fratHistoryApp
					   fpermission.save(flush: true)
					   fmember.addToFratMemberAppPermissions(fpermission).save(flush: true)
				   }
			   }
				   
			   if(frat.apps == null || !frat.apps.contains(RushListApp)) {
				   RushListApp fratRushListApp = new RushListApp()
				   fratRushListApp.globallyViewable = true
				   fratRushListApp.frat = frat
				   fratRushListApp.identifier = "rushlistapp"
				   fratRushListApp.appName = "Rushes"
				   fratRushListApp.description = DEFAULT_DESCRIPTION
				   fratRushListApp.image = "fa fa-bullseye fa-3x"
				   fratRushListApp.save(flush: true)
	
				   for (fmember in flist) {
					   FratMemberAppPermission fpermission = new FratMemberAppPermission(permissions: "WR")
					   fpermission.fratMember = fmember
					   fpermission.fratApp = fratRushListApp
					   fpermission.save(flush: true)
					   fmember.addToFratMemberAppPermissions(fpermission).save(flush: true)
				   }
			   }
		   }
	   }
	   
	   def getSocialNetworkInfo() {
		   def socialNetworkInfo = new SocialNetworkInfo()
		   socialNetworkInfo.save(flush: true)
		   return socialNetworkInfo
	   }
		
	   def createFrat(String name, College college, String imageName, int fratType, String description) {
		   def frat = new Frat()
		   frat.fratName = name
		   frat.fratDescription = description
		   frat.college = college
		   
		   Calendar now = Calendar.getInstance();
		   int year = now.get(Calendar.YEAR);
		   SimpleDateFormat f = new SimpleDateFormat("yyyy")
		   frat.foundedYear = f.parse(String.valueOf(year))
		   
		   frat.socialNetworkInfo = getSocialNetworkInfo()
		   frat.fratType = fratType
		   
		   S3Image image = new S3Image()
		   image.imageName = imageName
		   image.imageUrl = FRAT_THUMBNAIL_BUCKET+imageName
		   image.save(flush: true)
		   frat.image = image
		   
		   frat.save(flush: true)
	   }
	   
	   def College createCollege(String name, String emailDomain, String imageName, State state) {
		   def college = new College()
		   college.state = state
		   college.collegeName = name
		   college.emailDomain = emailDomain
		   college.state = state
		   
		   def collegeImage = new S3Image()
		   collegeImage.imageName = imageName
		   collegeImage.imageUrl = COLLEGE_IMAGE_BUCKET+imageName
		   collegeImage.save(flush: true)
		   college.image = collegeImage
		   
		   college.save(flush: true)
		   return college
	   }
		
	   def State createState(String name, String abrv) {  
		   def state = new State()
		   state.stateName = name
		   state.stateAbrv = abrv
		   state.save(flush: true)
		   return state
	   }
	   
	   def User generateUser(String userName, College college) {
		   def user = new User()
		   user.username = userName
		   user.enabled = true
		   user.password = 'passw0rd'
		   user.college = college
		   user.accountExpired = false
		   user.passwordExpired = false
		   user.validEduEmail = true
		   user.activeRush = true
		   
		   def contactInfo = new UserContact()
		   def userProfile = new UserProfile()
		   userProfile.firstName = "FirstName"+User.findAll().size()
		   userProfile.lastName = "LastName"+User.findAll().size()
		   userProfile.isProfileSetup = true
		   Calendar now = Calendar.getInstance();
		   int year = now.get(Calendar.YEAR);
		   SimpleDateFormat f = new SimpleDateFormat("yyyy")
		   userProfile.graduationYear = f.parse(String.valueOf(year))
		   userProfile.description = "Test User Description"
		   userProfile.contactInfo = contactInfo
		   userProfile.major = "Spanish"
		   userProfile.gpa = 4.0
		   userProfile.socialNetworkInfo = getSocialNetworkInfo()
		   user.profile = userProfile;
		   userProfile.save(flush: true)
		   user.save(flush: true)
		   
		   Role role = Role.findByAuthority("ROLE_USER")
		   UserRole.create user, role, true 
		   return user
	   }
	   
	   def createAdmin(Frat frat) {
		   def userName = (frat.fratName+"_admin@"+frat.college.emailDomain).replaceAll("\\s","").toLowerCase()
		   def user = generateUser(userName, frat.college)
		   BrotherMember brother = new BrotherMember()
		   brother.frat = frat
		   brother.user = user
		   brother.save(flush: true)
		   frat.addToMembers(brother)
		   frat.fratAdmin = user;
		   user.addToFratMembers(brother)
	   }
	   
	   def createBrother(Frat frat){
		   def userName = (frat.fratName+"_brother@"+frat.college.emailDomain).replaceAll("\\s","").toLowerCase()
		   def user = generateUser(userName, frat.college)
		   BrotherMember brother = new BrotherMember()
		   brother.frat = frat
		   brother.user = user
		   brother.save(flush: true)
		   frat.addToMembers(brother)
		   user.addToFratMembers(brother)
	   }
	   
	   def createPledge(Frat frat) {
		   def userName = (frat.fratName+"_pledge@"+frat.college.emailDomain).replaceAll("\\s","").toLowerCase()
		   def user = generateUser(userName, frat.college)
		   PledgeMember pledge = new PledgeMember()
		   pledge.frat = frat
		   pledge.user = user
		   pledge.save(flush: true)
		   frat.addToMembers(pledge)
		   user.addToFratMembers(pledge)
	   }
	   
	   def createRush(Frat frat) {
		   def userName = (frat.fratName+"_rush@"+frat.college.emailDomain).replaceAll("\\s","").toLowerCase()
		   def user = generateUser(userName, frat.college)
		   RushMember rush = new RushMember()
		   rush.frat = frat
		   rush.user = user
		   rush.save(flush: true)
		   frat.addToMembers(rush)
		   user.addToFratMembers(rush)
	   }
	   
	   def createPendingRush(Frat frat) {	  
		   def userName = (frat.fratName+"_pendingrush@"+frat.college.emailDomain).replaceAll("\\s","").toLowerCase()
		   def user = generateUser(userName, frat.college)
		   def pendingRush = new PendingRush()
		   pendingRush.user = user
		   pendingRush.invited = false
		   pendingRush.save(flush: true)
		   frat.addToPendingRushs(pendingRush)
	   }
	   
	   def createPendingBrother(Frat frat) {
		   def userName = (frat.fratName+"_pendingbrother@"+frat.college.emailDomain).replaceAll("\\s","").toLowerCase()
		   def user = generateUser(userName, frat.college)
		   def pendingBrother1 = new PendingMember()
		   pendingBrother1.user = user
		   pendingBrother1.save(flush: true)
		   frat.addToPendingMembers(pendingBrother1)
	   }
	   
	   def Date getExpireTimestamp() {
		   Date currTimestamp = new Date()
		   Calendar cal = Calendar.getInstance();
		   cal.setTime(currTimestamp);
		   cal.add(Calendar.DATE, 30);
		   Date expireTimestamp = cal.getTime();
		   return expireTimestamp
	   }
	
	   def init = { servletContext ->
		   Environment.executeForCurrentEnvironment {
			   development {
				   
				   def userRole = new Role(authority: 'ROLE_USER').save(flush: true)
				   def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
				   def fBrole = new Role(authority: 'ROLE_FACEBOOK').save(flush: true)
				   
				   //define ohio colleges
				   def ohio = createState("Ohio","OH")
				   def osu = createCollege("Ohio State University", "osu.edu", "osu.jpg", ohio)
				   def miami = createCollege("Miami University of Ohio", "miamioh.edu", "miamioh.jpg", ohio);
				   
				   createFrat("TKE", osu, "tke.jpg", 2, DEFAULT_DESCRIPTION)
				   createFrat("Beta Zow", osu, "beta_zow.jpg", 2, DEFAULT_DESCRIPTION)
				   createFrat("BX", osu, "bx.jpg", 2, DEFAULT_DESCRIPTION)
				   createFrat("Alpha Omega", osu, "alpha_omega.jpg", 2, DEFAULT_DESCRIPTION)
				   
				   createFrat("TKE 2", miami, "tke.jpg", 2, DEFAULT_DESCRIPTION)
				   createFrat("Beta Zow 2", miami, "beta_zow.jpg", 2, DEFAULT_DESCRIPTION)
				   createFrat("Alpha Omega 2", miami, "alpha_omega.jpg", 2, DEFAULT_DESCRIPTION)
				   createFrat("BX 2", miami, "bx.jpg", 2, DEFAULT_DESCRIPTION)
				   
				   for(frat in Frat.list()) {
					   //create frat admin
					   createAdmin(frat)
		
					   //create frat brother
					   createBrother(frat)
					   
					   //create rushs
					   createRush(frat)
					   
					   //create pledges
					   createPledge(frat)
			
					   //create pending rush
					   createPendingRush(frat)
					   
					   //create pending brother
					   createPendingBrother(frat)
				   }
				   generateFratApps()
			   }
			   
			   test {
				   if(Role.findByAuthority("ROLE_USER") == null) {
					   def userRole = new Role(authority: 'ROLE_USER').save(flush: true)
				   }
				   if(Role.findByAuthority("ROLE_ADMIN") == null) {
					   def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
				   }
				   if(Role.findByAuthority("ROLE_FACEBOOK") == null) {
					   def fBrole = new Role(authority: 'ROLE_FACEBOOK').save(flush: true)
				   }
				   
				   if(State.findByStateName("Ohio") == null) {
					   def ohio = createState("Ohio","OH")
					   
					   if(Frat.findByFratName("Ohio State University") == null) {
						   def osu = createCollege("Ohio State University", "osu.edu", "osu.jpg", ohio)
						   
						   def tke = createFrat("TKE", osu, "tke.jpg", 2, DEFAULT_DESCRIPTION)
						   
						   createAdmin(tke)
						   createBrother(tke)
						   createRush(tke)
						   createPledge(tke)
						   createPendingRush(tke)
						   createPendingBrother(tke)
						   
						   def betazow = createFrat("Beta Zow", osu, "beta_zow.jpg", 2, DEFAULT_DESCRIPTION)
						   
						   createAdmin(betazow)
						   createBrother(betazow)
						   createRush(betazow)
						   createPledge(betazow)
						   createPendingRush(betazow)
						   createPendingBrother(betazow)
					   }
					   
					   if(Frat.findByFratName("Miami University of Ohio") == null) {
						   def miami = createCollege("Miami University of Ohio", "miamioh.edu", "miamioh.jpg", ohio);  
						   
						   def tke = createFrat("TKE 2", miami, "tke.jpg", 2, DEFAULT_DESCRIPTION)
						   
						   createAdmin(tke)
						   createBrother(tke)
						   createRush(tke)
						   createPledge(tke)
						   createPendingRush(tke)
						   createPendingBrother(tke)
						   
						   def betazow = createFrat("Beta Zow 2", miami, "beta_zow.jpg", 2, DEFAULT_DESCRIPTION)
						   
						   createAdmin(betazow)
						   createBrother(betazow)
						   createRush(betazow)
						   createPledge(betazow)
						   createPendingRush(betazow)
						   createPendingBrother(betazow)
					   } 
				   }
				   
				   generateFratApps()
			   }
			   
			   production {
				   
				   if(Role.findByAuthority("ROLE_USER") == null) {
					   def userRole = new Role(authority: 'ROLE_USER').save(flush: true)
				   }
				   if(Role.findByAuthority("ROLE_ADMIN") == null) {
					   def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
				   }
				   if(Role.findByAuthority("ROLE_FACEBOOK") == null) {
					   def fBrole = new Role(authority: 'ROLE_FACEBOOK').save(flush: true)
				   }
				   
				   if(State.findByStateName("Ohio") == null) {
					   def ohio = createState("Ohio","OH")
					   
					   if(Frat.findByFratName("Ohio State University") == null) {
						   def osu = createCollege("Ohio State University", "osu.edu", "osu.jpg", ohio)
						   
						   def tke = createFrat("TKE", osu, "tke.jpg", 2, DEFAULT_DESCRIPTION)
						   
						   createAdmin(tke)
						   createBrother(tke)
						   createRush(tke)
						   createPledge(tke)
						   createPendingRush(tke)
						   createPendingBrother(tke)
						   
						   def betazow = createFrat("Beta Zow", osu, "beta_zow.jpg", 2, DEFAULT_DESCRIPTION)
						   
						   createAdmin(betazow)
						   createBrother(betazow)
						   createRush(betazow)
						   createPledge(betazow)
						   createPendingRush(betazow)
						   createPendingBrother(betazow)
					   }
					   
					   if(Frat.findByFratName("Miami University of Ohio") == null) {
						   def miami = createCollege("Miami University of Ohio", "miamioh.edu", "miamioh.jpg", ohio);
						   
						   def tke = createFrat("TKE 2", miami, "tke.jpg", 2, DEFAULT_DESCRIPTION)
						   
						   createAdmin(tke)
						   createBrother(tke)
						   createRush(tke)
						   createPledge(tke)
						   createPendingRush(tke)
						   createPendingBrother(tke)
						   
						   def betazow = createFrat("Beta Zow 2", miami, "beta_zow.jpg", 2, DEFAULT_DESCRIPTION)
						   
						   createAdmin(betazow)
						   createBrother(betazow)
						   createRush(betazow)
						   createPledge(betazow)
						   createPendingRush(betazow)
						   createPendingBrother(betazow)
					   }
				   }
				   
				   generateFratApps()
			   }
		   }
	   }
	   def destroy = {}
}
