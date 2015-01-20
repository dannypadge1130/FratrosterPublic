<%@ page import="com.fratroster.memberType.RushMember"%>

<g:if test="${alertMessage != null && !alertMessage.isEmpty()}">
	<div class="alert alert-success text-center">
		<a class="close" data-dismiss="alert">×</a>
		<p>
			${alertMessage}
		</p>
	</div>
</g:if>

<div class="row tab-information">
	<div class="col-lg-12">
		<div id="container">
			<!--begin rush listing-->
			<g:each in="${RushMember.findAllByFrat(fratInstance)}" status="i"
				var="rush">
				<div class="col-lg-3 col-md-4 col-sm-6">
					<div class="list-background">
						<div class="banner">
							<p class="banner-title">
								${rush?.user?.profile?.getFullName()}
							</p>
							<g:set var="voted" value="${false}" />
							<g:if test="${rush?.getUsersVote(currUser) != null}">
								<g:set var="voted" value="${true}" />
								<g:set var="vote" value="${rush?.getUsersVote(currUser).liked}" />
							</g:if>
							<ul class="list-inline social-feedback">
								<span id="voted_${rush.id}"
									<g:if test="${voted}">style="display:none;"</g:if>>
									<li>
										<g:remoteLink action="submitRushVote"
											params="[rushId:rush.id, liked:true]"
											onLoading="voteCast(true,'${rush.id}');">
											<i class="fa fa-thumbs-o-up"></i>
										</g:remoteLink>
										<span id="upCount2_${rush.id}"> ${rush?.getLikeCount()}</span>
									</li>
									<li>
										<g:remoteLink action="submitRushVote"
											params="[rushId:rush.id, liked:false]"
											onLoading="voteCast(false,'${rush.id}');">
											<i class="fa fa-thumbs-o-down"></i>
										</g:remoteLink>
										<span id="downCount2_${rush.id}"> ${rush?.getDislikeCount()}</span>
									</li>
								</span>
								<span id="removeVote_${rush.id}"
									<g:if test="${!voted}">style="display:none;"</g:if>> <i
									class="fa fa-thumbs-o-up fa-lg"></i><span
									id="upCount1_${rush.id}"> ${rush?.getLikeCount()}
								</span> <i class="fa fa-thumbs-o-down fa-lg"></i><span
									id="downCount1_${rush.id}"> ${rush?.getDislikeCount()}
								</span> <span id="voteCast_${rush.id}"> <g:if test="${voted}">
											<g:if test="${vote}">voted for.</g:if>
											<g:else>voted against.</g:else>
										</g:if>
								</span> <g:remoteLink action="removeRushVote" params="[rushId:rush.id]"
										onLoading="removeVote('${rush.id}');">change vote.</g:remoteLink>
									<input type="hidden" id="vote_${rush.id}"
									<g:if test="${voted}">value="${vote}"</g:if>
									<g:else>value=""</g:else> /> <input type="hidden"
									id="voteForCount_${rush.id}" value="${rush?.getLikeCount()}" />
									<input type="hidden" id="voteAgainstCount_${rush.id}"
									value="${rush?.getDislikeCount()}" />
								</span>
								<li>
									<g:remoteLink controller="apps"
										action="updateCommentModal" onComplete="showCommentModal()"
										params="[appId:appId]" id="${rush.id}"
										update="commentRefreshArea">
										<i class="fa fa-comment-o fa-lg"></i>
									</g:remoteLink> ${rush?.comments?.size()}
								</li>
							</ul>
						</div>                 
						
						<!--rush container-->
						<div class="list-container">
							<!--hover-mask-->
							<div class="hover-mask">
								<g:if test="${rush.accepted}">PENDING BID</g:if>
								<!--rush Image-->
								<div class="profile-photo">
									<g:link controller="userProfile" action="show"
										id="${rush?.user?.profile?.id}">
										<g:if test="${rush?.user?.profile?.profileImage?.imageUrl}">
											<img src="${rush?.user?.profile?.profileImage?.imageUrl}"
												class="img-thumbnail image-resize listing-logo pull-left"
												alt="profile image" />
										</g:if>
										<g:else>
											<!--Generic Profile Image-->
											<i class="fa fa-user fa-5x generic-user-image-sm listing-logo"></i>
										</g:else>
									</g:link>
								</div>
								<div class="info">
									<g:link controller="userProfile" action="show" id="${rush?.user?.profile?.id}">
										<h4 class="listing-response">${rush?.user?.profile?.firstName} ${rush?.user?.profile?.lastName}</h4>
									</g:link>
									<p class="listing-response">
										<i class="fa fa-book"></i> ${rush?.user?.profile?.gpa}
										<i class="fa fa-graduation-cap"></i> <g:formatDate format="yyyy" date="${rush?.user?.profile?.graduationYear}" />
									</p>
									<!--Approve/Reject Rush-->
									<div class="btn-group">
										<g:remoteLink class="btn btn-default btn-xs" 
									  		action="approveRushModalRefresh"
											id="${rush?.id}"
											update="modalRefresh_send" params="[appId:appId]"
											onComplete="showApproveRushModal()">
											Add Rush
										</g:remoteLink>
									  <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
									    <span class="caret"></span>
									    <span class="sr-only">Toggle Dropdown</span>
									  </button>
									  <ul class="dropdown-menu" role="menu">									    
									    <li>
									    	<g:remoteLink action="denyRushModalRefresh"
												id="${rush?.id}" class="btn btn-default btn-xs"
												update="modalRefresh_deny" params="[appId:appId]"
												onComplete="showDenyRushModal()">
												Remove Rush
											</g:remoteLink>
									    </li>									   
									  </ul>
									</div>
								</div>
								<!--/info-->
							</div>
							<!--/hover-mask-->
						</div>
						<!--/list-container-->
					</div>
					<!--/list-background-->
				</div>
				<!--pledge-->
			</g:each>
		</div>
	</div>
</div>