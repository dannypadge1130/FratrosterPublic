<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'fraternityofficerslist.css')}" type="text/css">
		<g:render template="/include/genericIncludes"/>
	</head>
	<body>
	<g:render template="/include/header"/>
	<!--Begin Main Content Section-->
	<div id="main">
		<!--Beign Frat List Banner-->
		<div id="fraternityOfficerBanner" class="largeContentBanner">
			<p class="bannerTitle">
				Test Frat Officer List Header
			</p>
		</div>
		<!--End Frat List Banner-->
		<!--Begin Search-->
		<div id="searchBox">
		<input type="text" id="search" placeholder="Find Officers">
		<button type="submit" id="searchIcon"></button>
		</div>
		<!--Begin Fraternity Officer Section-->
		<div class="dividertop">
		</div>
		<!--Begin Officer List Section-->
		<g:each in="${officerList}" status="i" var="officer">
		<div class="brother">
			<!--Begin Officer Photo-->
			<div class="fratphoto">
					<g:if test="${officer?.profileImageName}">
						<img src="${officer?.profileImageUrl}" alt="profile image"/>
					</g:if>
					<g:else>
						<img src="${resource(dir: 'images/userprofile', file: 'fratrosterDefaultBrotherProfile.png')}" alt="Fratroster default profile image"/>
					</g:else>
			</div>
			<!--End Officer Photo-->
			<!--Begin Officer Name and Status Section-->
			<div class="fraternityMember">
				<div class="fraternityOfficerName">
					<p>${officer.user.profile.firstName} ${officer.user.profile.lastName}</p>
				</div>
				<div class="fraternityOfficerTitle">
					<p>${officer.officerMember.title}</p>
				</div>
			</div>
			<!--End Officer Name and Status Section-->
			<!--Begin Officer Description-->
				<div class="description">
				<p>${officer.user.profile.description}</p>
			</div>
			<!--End Officer Description-->
			<!--Begin Message Section-->
			<div class="images">
				<div class="messageImage">
				</div>
				<div class="userSpecificInformation">
					<div class="userGradYear">
						<span>Grad Year:</span><span class="highlight">${officer.user.profile.graduationYear}</span>
					</div>
				</div>
			</div>
		</div>
		<div class="dividertop">
		</div>
		</g:each>
		<!--End Fraternity Officer Section-->
	</div>
	<!--End Main Content Section-->
	<g:render template="/include/footer"/>	
	</body>
</html>