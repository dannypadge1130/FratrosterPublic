<%@ page import="com.fratroster.pendinguser.PendingRush"%>
<%@ page import="com.fratroster.Frat"%>

<g:if test="${message != null && !message.isEmpty()}">
	<div class="alert alert-success">
	<a class="close" data-dismiss="alert">×</a>${message}   
	</div>  
</g:if>
	<div class="row tab-information">
		<div class="col-lg-12">
			<g:each in="${PendingRush.findAllByUser(userInstance)}" status="i" var="pendingRushInstance">
			<!--frat-->
			<div class="col-lg-3 col-md-4 col-sm-6">
				<div class="list-background">
					<div class="banner">
						<p class="banner-title">${pendingRushInstance?.frat?.fratName}</p>
					</div>
					<!--frat container-->
					<div class="list-container">
						<!--frat image-->
						<div class="profile-photo">
							<g:link action="show" controller="frat" id="${pendingRushInstance?.frat?.id}">
								<img class="img-thumbnail image-resize listing-logo pull-left" src="${pendingRushInstance?.frat?.image?.imageUrl}" />
							</g:link>
						</div>
						<!--frat info-->
						<div class="info">							
							<h4 class="listing-response">
								<g:link action="show" controller="frat" id="${pendingRushInstance?.frat?.id}">${pendingRushInstance?.frat?.fratName}</g:link>
							</h4>
							</p>
							<p class="listing-response">
								<g:if test="${pendingRushInstance?.frat?.averageGpa != null}">
									<span>
							    		<i class="fa fa-book"></i> <g:formatNumber number="${pendingRushInstance?.frat?.averageGpa}" minFractionDigits="1" maxFractionDigits="2" maxIntegerDigits="1" minIntegerDigits="1" />
						   			</span>
						   		</g:if>
						      	<g:if test="${pendingRushInstance?.frat?.foundedYear != null}">
									<span>
										<i class="fa fa-leaf"></i> <g:formatDate format="yyyy" date="${pendingRushInstance?.frat?.foundedYear}"/>
						    		</span>
						    	</g:if>
							</p>
							<g:if test="${pendingRushInstance?.invited}">
								<!--Accept / Decline Rush Invitation-->
								<div class="btn-group">
									<g:remoteLink class="btn btn-default btn-xs" action="acceptRushInviteModal" 
										id="${pendingRushInstance?.frat?.id}" update="acceptRushInviteModal" onComplete="globaljs.showModal('#accept-rush-modal')">
										Accept
									</g:remoteLink>
									<a type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown"> 
									<span class="caret"></span> <span
										class="sr-only">Toggle Dropdown</span>
									</a>
									<ul class="dropdown-menu" role="menu">
										<li>
											<g:remoteLink action="declineRushInviteModal" id="${pendingRushInstance?.frat?.id}" 
												update="declineRushInviteModal" onComplete="globaljs.showModal('#decline-rush-modal')">
												Decline
											</g:remoteLink>
										</li>
									</ul>
								</div>
								<!--/Accept / Decline Rush Invitation-->
							</g:if>
							<g:else>
								<g:remoteLink class="btn btn-default btn-xs" action="revokeRushRequestModal" id="${pendingRushInstance?.frat?.id}" 
									update="revokeRushRequestModal" onComplete="globaljs.showModal('#cancel-rush-invitation-request-modal');">
									Revoke Request
								</g:remoteLink>
							</g:else>
						</div>
					</div>
				</div>
			</div>
			<!--frat-->
			</g:each>
		</div>
		<!--/col-12-->
	</div>
	<!--/row-->