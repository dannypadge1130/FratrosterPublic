<%@ page import="com.fratroster.memberType.RushMember"%>
<%@ page import="com.fratroster.FratMember"%>
<%@ page import="com.fratroster.user.User"%>

<div class="row tab-information">
	<div class="col-lg-12">
		<g:each in="${RushMember.findAllByUserAndAccepted(userInstance, false)}" status="i" var="rushedFrat">
			<div class="col-lg-3 col-md-4 col-sm-6">
				<div class="list-background">
					<div class="banner">
						<p class="banner-title">
							${rushedFrat?.frat?.fratName}
						</p>
					</div>
					<!--frat container-->
					<div class="list-container">
						<!--fraternity-profile-image-->
						<div class="profile-photo">
							<g:link action="show" controller="frat"
								id="${rushedFrat?.frat?.id}">
								<img class="img-thumbnail image-resize listing-logo pull-left"
									src="${rushedFrat?.frat?.image?.imageUrl}" />
							</g:link>
						</div>
						<!--/fraternity-profile-image-->
						<!--fraternity-info-->
						<div class="info">
							<h4 class="listing-response">
								<g:link action="show" controller="frat" id="${rushedFrat?.frat?.id}">${rushedFrat?.frat?.fratName}</g:link>
							</h4>
							<p class="listing-response">
								<g:if test="${rushedFrat?.frat?.averageGpa != null}">									
							    	<i class="fa fa-book"></i> <g:formatNumber number="${rushedFrat?.frat?.averageGpa}" minFractionDigits="1" maxFractionDigits="2" maxIntegerDigits="1" minIntegerDigits="1" />						   			
						   		</g:if>
						      	<g:if test="${rushedFrat?.frat?.foundedYear != null}">									
									<i class="fa fa-leaf"></i> <g:formatDate format="yyyy" date="${rushedFrat?.frat?.foundedYear}"/>						    		
						    	</g:if>
					    	</p>
					    	<!--fraternity-info-->							
							<!--decline-rush-invitation-->
							<g:remoteLink class="btn btn-default btn-xs" action="stopRushingModal" id="${rushedFrat?.frat?.id}" 
								update="stopRushingModal" onComplete="globaljs.showModal('#stop-rushing-modal');" onFailed="globaljs.ajaxError();">
								Stop Rushing
							</g:remoteLink>
							<!--/decline-rush-invitation-->
						</div>
					</div>
				</div>
			</div>
		</g:each>
	</div>
</div>