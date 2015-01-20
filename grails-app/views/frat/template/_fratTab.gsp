<%@ page import="com.fratroster.memberType.BrotherMember"%>


<g:if test="${fratTabMessage != null && !fratTabMessage.isEmpty()}">
	<div class="alert alert-success">
		<a class="close" data-dismiss="alert">×</a>  
		${fratTabMessage}   
	</div>  
</g:if>
<!-- Fraternity Search -->
<div class="row tab-information">
	<div class="col-lg-12">
		<!--Create Fraternity (only visible to brothers)-->
		<g:link controller="newAccountSetup" action="createFraternity"
			class="btn btn-default btn-mobile pull-right">
			<i class="fa fa-pencil"></i> Create Fraternity</g:link>
	</div>
</div>
<!--/Fraternity Search-->
<!--Fraternity Listing-->
<div class="row">
	<div class="col-lg-12">
		<g:each in="${fratInstanceList}" status="i" var="frat">
			<!--frat-->
			<div class="col-lg-3 col-md-4 col-sm-6">
				<div class="list-background">
					<div class="banner">
						<p class="banner-title">
							${frat?.fratName}
						</p>
					</div>
					<div class="list-container">
						<!--frat image-->
						<div class="profile-photo">
							<g:link controller="frat" action="show" id="${frat?.id}">
								<img class="img-thumbnail image-resize listing-logo pull-left"
									src="${frat?.image?.imageUrl}" />
							</g:link>
						</div>
						<!--frat info-->
						<div class="info">
							<!--frat name-->							
							<h4 class="listing-response">
								<g:link controller="frat" action="show" id="${frat?.id}">
									${frat?.fratName}
								</g:link>
							</h4>							
							<p class="listing-response">
								<!--active brothers-->
								<i class="fa fa-users"></i>
								${BrotherMember.findAllByFrat(frat)?.size()}
								<!--GPA-->
								<g:if test="${frat?.averageGpa != null}">
									<i class="fa fa-book"></i>
									<g:formatNumber number="${frat?.averageGpa}"
										minFractionDigits="1" maxFractionDigits="2"
										maxIntegerDigits="1" minIntegerDigits="1" />
								</g:if>
								<!--Founding Year-->
								<g:if test="${frat?.foundedYear != null}">
									<i class="fa fa-leaf"></i>
									<g:formatDate format="yyyy" date="${frat?.foundedYear}" />
								</g:if>
							</p>
							
							<g:set var="pendingRush" value="${false}"/>
							<g:isPendingRushOfFrat fratId="${frat?.id}">
								<g:set var="pendingRush" value="${true}"/>
								STATUS PENDING
							</g:isPendingRushOfFrat>
							
							<g:if test="${userInstance.activeRush && !pendingRush}">
								<g:isNonMemberOfFrat fratId="${frat?.id}">
									<g:remoteLink class="btn btn-default btn-xs" action="populateRushFratModal" id="${frat?.id}" update="rushFrat" onComplete="\$('#rush-frat-modal').modal('show');">
										Rush Fraternity
									</g:remoteLink>
								</g:isNonMemberOfFrat>
							</g:if>
						</div>
					</div>
				</div>
			</div>
			<!--frat-->
		</g:each>
	</div>
	<!--/col-->
</div>
<!--/Fraternity Listing-->