<%@ page import="com.fratroster.memberType.RushMember"%>
<%@ page import="com.fratroster.FratMember"%>
<%@ page import="com.fratroster.user.User"%>

<g:if test="${message != null && !message.isEmpty()}">
	<div class="alert alert-success">
	<a class="close" data-dismiss="alert">×</a>${message}   
	</div>  
</g:if>
<div class="row tab-information">
	<div class="col-lg-12">
		<g:each in="${RushMember.findAllByUserAndAccepted(userInstance, true)}" var="rushBid">
		<!--frat-->
		<div class="col-lg-3 col-md-4 col-sm-6">
			<div class="list-background">
				<div class="banner">
					<p class="banner-title">${rushBid?.frat?.fratName}</p>
				</div>
				<!--frat container-->
				<div class="list-container">
					<!--fraternity-image-->
					<div class="profile-photo">
						<g:link action="show" controller="frat" id="${rushBid?.frat?.id}">
							<img class="img-thumbnail image-resize listing-logo pull-left" src="${rushBid?.frat?.image?.imageUrl}" />
						</g:link>
					</div>
					<!--/fraternity-image-->
					<!--frat info-->
					<div class="info">				
						<!--fraternity-name-->		
						<h4 class="listing-response">
							<g:link action="show" controller="frat" id="${rushBid?.frat?.id}">${rushBid?.frat?.fratName}</g:link>
						</h4>				
						<!--fraternity-name-->		
						<p class="listing-response">
							<g:if test="${rushBid?.frat?.averageGpa != null}">
								<span>
						    		<i class="fa fa-book"></i> <g:formatNumber number="${rushBid.frat.averageGpa}" minFractionDigits="1" maxFractionDigits="2" maxIntegerDigits="1" minIntegerDigits="1" />
					   			</span>
					   		</g:if>
					      	<g:if test="${rushBid?.frat?.foundedYear != null}">
								<span>
									<i class="fa fa-leaf"></i> <g:formatDate format="yyyy" date="${rushBid.frat.foundedYear}"/>
					    		</span>
					    	</g:if>
						</p>
						<!--Accept / Decline Bid-->
						<div class="btn-group">
							<g:remoteLink class="btn btn-default btn-xs" action="acceptBidModal" id="${rushBid?.frat?.id}" 
								update="acceptBidModal" onComplete="globaljs.showModal('#confirm-bid-modal');" onFailed="globaljs.ajaxError();">
								Confirm
							</g:remoteLink>
								
							<a type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown"> 
								<span class="caret"></span> 
								<span class="sr-only">Toggle Dropdown</span>
							</a>
							<ul class="dropdown-menu" role="menu">
								<li>
									<g:remoteLink class="btn btn-default btn-xs" action="denyBidModal" id="${rushBid?.frat?.id}" 
										update="denyBidModal" onComplete="globaljs.showModal('#decline-bid-modal');" onFailed="globaljs.ajaxError();">
										Decline
									</g:remoteLink>
								</li>
							</ul>
						</div>
						<!--/Accept / Decline Bid-->
					</div>
				</div>
			</div>
		</div>
		<!--frat-->
		</g:each>
	</div>
	<!--/col-->
</div>