<%@ page import="com.fratroster.memberType.BrotherMember" %>

<!--container title-->
<div class="row main-container">
	<div class="col-lg-12">
		<!--begin brother listing-->
		<g:each in="${BrotherMember.findAllByFrat(fratInstance)}" status="i" var="brother">
			<!--brother-->
			<div class="col-lg-3 col-md-4 col-sm-6">
				<div class="list-background">
					<div class="banner">
						<p class="banner-title">${brother?.user?.profile?.firstName} ${brother?.user?.profile?.lastName}</p>
					</div>
					<!--brother container-->
					<div class="list-container">
						<!--Brother Image-->
						<div class="profile-photo">
							<g:link controller="userProfile" action="show" id="${brother?.user?.profile?.id}">
								<g:if test="${brother?.user?.profile?.profileImage}">
									<img class="img-thumbnail image-resize listing-logo pull-left"
										src="${brother?.user?.profile?.profileImage.imageUrl}"
										alt="profile image" />
								</g:if>
								<g:else>									
									<!--Generic Profile Image-->
									<i class="fa fa-user fa-5x generic-user-image-sm listing-logo"></i>	
								</g:else>
							</g:link>
						</div>
						<div class="info">
							<g:link controller="userProfile" action="show" id="${brother?.user?.profile?.id}">
								<h4 class="listing-response">${brother?.user?.profile?.firstName} ${brother?.user?.profile?.lastName}</h4>
							</g:link>
							<p class="listing-response">
								<i class="fa fa-book"></i> ${brother?.user?.profile?.gpa}
								<i class="fa fa-graduation-cap"></i> <g:formatDate format="yyyy" date="${brother?.user?.profile?.graduationYear}" />
							</p>
						</div>
					</div>
				</div>
			</div>
			<!--brother-->
		</g:each>
	</div>
	<!--col-->
</div>
<!-- /row -->