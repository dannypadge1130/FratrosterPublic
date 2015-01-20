<%@ page import="com.fratroster.memberType.AlumniMember" %>

<div class="row main-container">
	<div class="col-lg-12">
		<!--begin alumnus listing-->
		<g:each in="${AlumniMember.findAllByFrat(fratInstance)}" status="i" var="alumni">
			<!--alumnus-->
			<div class="col-lg-3 col-md-4 col-sm-6">
				<div class="list-background">
					<div class="banner">
						<p class="banner-title">${alumni?.user?.profile?.firstName} ${alumni?.user?.profile?.lastName}</p>
					</div>
					<!--alumnus container-->
					<div class="list-container">
						<!--alumnus Image-->
						<div class="profile-photo">
							<g:link controller="userProfile" action="show"
								id="${alumni?.user?.profile?.id}">
								<g:if test="${alumni?.user?.profile?.profileImage}">
									<img class="img-thumbnail image-resize listing-logo pull-left"
										src="${alumni?.user?.profile?.profileImage.imageUrl}"
										alt="profile image" />
								</g:if>
								<g:else>
									<!--Generic Profile Image-->
									<i class="fa fa-user fa-5x generic-user-image-sm listing-logo"></i>
								</g:else>
							</g:link>
						</div>
						<div class="info">
							<h4 class="listing-response">${alumni?.user?.profile?.firstName} ${alumni?.user?.profile?.lastName}</h4>
							<p class="listing-response">
								<span><i class="fa fa-book"></i></span> ${alumni?.profession}
								<span><i class="fa fa-leaf"></i></span>	<g:formatDate format="yyyy" date="${alumni?.user?.profile?.graduationYear}" />						
							</p>
						</div>
					</div>
				</div>
			</div>
			<!--/alumnus-->
		</g:each>
	</div>
	<!--col-->
</div>
<!-- /row -->