<%@ page import="com.fratroster.Frat"%>
<%@ page import="com.fratroster.memberType.BrotherMember"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title><g:message code="SITE_TITLE"
			args='["${fratInstance?.fratName}"]' /></title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description"
		content="Connect with prospective rushes, network with alumni, and grow your fraternity's presence on campus.">
	<g:render template="/include/genericIncludes" />
</head>
<body>
	<g:render template="/include/header" />
	<!--begin container-->
	<div class="container">
		<div class="row main-container">
			<div class="col-lg-12">
				<!-- Search -->
				<div class="row">
					<div class="col-lg-12">
						<div class="text-center">										
							<img class="img-thumbnail profile-image" src="${fratInstance?.image?.imageUrl}" />															
							<!--fraternity-name-->
							<h3>
								<g:if test="${fratInstance?.fratName}">
									<g:fieldValue bean="${fratInstance}" field="fratName" /> | <g:render template="/include/socialNetworkBookmarks" bean="${fratInstance?.socialNetworkInfo}"/>
								</g:if>
							</h3>
							<!--/fraternity-name-->
							<!--fraternity-short-description-->
							<p>
								<em>
									${fratInstance?.fratDescription}
								</em>
							</p>
							<!--/fraternity-short-description-->
							<p>
								<i class="fa fa-book"></i>
									<g:formatNumber
										number="${fratInstance?.averageGpa}" minFractionDigits="1"
										maxFractionDigits="2" maxIntegerDigits="1" minIntegerDigits="1" />
								<i class="fa fa-users"></i> ${BrotherMember.findAllByFrat(fratInstance)?.size()}
								<i class="fa fa-graduation-cap"></i> <g:formatDate
										format="yyyy" date="${fratInstance?.foundedYear}" />
							</p>
							<!--/Fraternity Information-->														
						</div>
					</div>
				</div>
				<!--/Search-->
				<!--Rush Filters-->
				<div class="row">
					<div class="col-lg-12">
						<ul class="nav nav-tabs fraternity-profile-filters" id="fraternity">
							<li class="tab-pane active"><a href="#fraternity-about"
								data-toggle="tab"><i class="fa fa-edit fa"></i> About</a></li>
								
							<g:hasReadPermission identifier="pendinguserapp" fratId="${fratInstance.id}">
								<li class="tab-pane"><a href="#fraternity-pending" data-toggle="tab"><i
										class="fa fa-question"></i> Pending</a></li>
							</g:hasReadPermission>
							
							<g:hasReadPermission identifier="rushlistapp" fratId="${fratInstance.id}">
								<li class="tab-pane"><a href="#fraternity-rushes-tab" data-toggle="tab"><i
										class="fa fa-bullseye"></i> Rushes</a></li>
							</g:hasReadPermission>
							
							<g:hasReadPermission identifier="pledgelistapp" fratId="${fratInstance.id}">
								<li class="tab-pane"><a href="#fraternity-pledges" data-toggle="tab"><i
										class="fa fa-meh-o"></i> Pledges</a></li>
							</g:hasReadPermission>
							
							<g:hasReadPermission identifier="brotherlistapp" fratId="${fratInstance.id}">
								<li class="tab-pane"><a href="#fraternity-brothers" data-toggle="tab"><i
										class="fa fa-user"></i> Brothers</a></li>
							</g:hasReadPermission>
									
							<g:hasReadPermission identifier="alumnilistapp" fratId="${fratInstance.id}">							
								<li class="tab-pane"><a href="#fraternity-alumni" data-toggle="tab"><i
										class="fa fa-briefcase"></i> Alumni</a></li>
							</g:hasReadPermission>
						</ul>
					</div>
					<!--/col-->
				</div>
				<!--/row-->
			</div>
			<!--/col-->
		</div>
		<!-- Tab panes -->
		<div class="tab-content">
			<div class="tab-pane fade in active" id="fraternity-about">
				<g:render template="/frat/template/aboutFrat" />
			</div>
			<div class="tab-pane fade" id="fraternity-pending">
				<g:render template="/apps/template/pendingUserList" />
			</div>
			<div class="tab-pane fade" id="fraternity-rushes-tab">
				<g:render template="/apps/template/rushList" />
			</div>
			<div class="tab-pane fade" id="fraternity-pledges">
				<g:render template="/apps/template/pledgeList" />
			</div>
			<div class="tab-pane fade" id="fraternity-brothers">
				<g:render template="/apps/template/brotherList" />
			</div>
			<div class="tab-pane fade" id="fraternity-alumni">
				<g:render template="/apps/template/alumniList" />
			</div>
		</div>
		<g:render template="/include/footer" />
	</div>
	<!-- /container -->
	<g:render template="/include/javascript" />
</body>
</html>