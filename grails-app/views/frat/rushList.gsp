<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>		
		<g:render template="/include/genericIncludes"/>
	</head>
	<body>
	<g:render template="/include/header"/>
	<!--Begin Main Content Section-->
	<div id="main">
		<!--Beign Frat List Banner-->
		<div id="fraternityRushBanner" class="largeContentBanner">
			<p class="bannerTitle">
				Test Frat Rush List Header
			</p>
		</div>
		<!--End Frat List Banner-->
		<!--Begin Search-->
		<div id="searchBox">
		<input type="text" id="search" placeholder="Find Rushes">
		<button type="submit" id="searchIcon"></button>
		</div>
		<!--Begin Fraternity Rush Section-->
		<div class="dividertop">
		</div>
		<!--Begin Rush List Section-->
		<g:each in="${rushList}" status="i" var="rush">
		<div class="rush">
			<!--Begin Rush Photo-->
			<div class="fratphoto">
					<g:if test="${rushListInstance?.profileImageName}">
						<img src="${rushListInstance?.profileImageUrl}" alt="profile image"/>
					</g:if>
					<g:else>
						<img src="${resource(dir: 'images/userprofile', file: 'fratrosterDefaultBrotherProfile.png')}" alt="Fratroster default profile image"/>
					</g:else>
			</div>
			<!--End Rush Photo-->
			<!--Begin Rush Name and Status Section-->
			<div class="fraternityMember">
				<div class="fraternityRushName">
					<p>${rush.user.profile.firstName} ${rush.user.profile.lastName}</p>
				</div>
				<div class="fraternityRushTitle">
					<p>${rush.user.profile.fratStatus}</p>
				</div>
			</div>
			<!--End Rush Name and Status Section-->
			<!--Begin Rush Description-->
				<div class="description">
				${rush.user.profile.description}
			</div>
			<!--End Brother Description-->
			<!--Begin Message Section-->
			<div class="images">
				<div class="messageImage">
				</div>
				<div class="userSpecificInformation">
					<div class="userGradYear">
						<span>Grad Year:</span><span class="highlight">${rush.user.profile.graduationYear}</span>
					</div>
				</div>
			</div>
		</div>
		<div class="dividertop">
		</div>
		</g:each><!--/Fraternity Rush Section-->
		<g:render template="/include/footer"/>
	</div><!--/Main Content Section-->	
	</body>
</html>