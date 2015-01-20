<%@ page import="com.fratroster.user.User"%>

<div class="modal" id="rush-preview-modal" tabindex="-1" role="dialog" aria-labelledby="rushCardModal" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="rushCardModal">${userInstance?.profile?.getFullName()}</h4>
			</div>
			<div class="modal-body">
	            <!--/rush-actions-->  						
				<div class="row">
					<div class="col-lg-12">
						<div class="rush-preview-section">
							<!--rush-profile-image-->
							<g:link action="show" controller="userProfile" id="${userInstance?.id}">
								<img class="img-thumbnail profile-image modal-profile-image pull-left" src="${userInstance?.profile?.profileImage?.imageUrl}" />
							</g:link>
							<!--/rush-profile-image-->
							<h3>
								<g:link action="show" controller="userProfile" id="${userInstance?.id}">${userInstance?.profile?.getFullName()}</g:link>
							</h3>
							<!--rush-educational-information-->
							<p>
								<i class="fa fa-bookmark"></i> ${userInstance?.profile?.major} 
								<i class="fa fa-book"></i> ${userInstance?.profile?.gpa}
								<i class="fa fa-graduation-cap"></i> <g:formatDate format="yyyy" date="${userInstance?.profile?.graduationYear}"/>
							</p>
							<!--/rush-educational-information-->
							<!--rushs-fraternities-->
							<g:render template="/frat/template/fratThumbnailList" bean="${rush}" />
							<!--rushs-fraternities-->
						</div>
						<hr>
						<!-- Tab panes -->
						<div class="tab-content">
							<!--All Rushes-->
							<div class="tab-pane fade in active" id="about">
								<div class="row tab-information">
									<div class="col-lg-12">
										<!--details-->
										<div class="col-lg-12">
											<div class="main">
												<div class="banner">
													<p class="banner-title">Essentials</p>
												</div>
												<g:render template="/userProfile/template/about" bean="${userInstance}" />
											</div>
											<!--/main-->
										</div>
										<!--/details-->
									</div>
									<!--/col-->
								</div>
								<!--/row-->
							</div>
						</div>
						<!-- /tab-content-->
					</div>
					<!--/col-12-->
				</div>
				<!--/main-container-->
			</div>
			<!--/modal-body-->
			<div class="modal-footer">
				<button type="button" onClick="rushList.previousRush(${rushIndex})" class="btn btn-default previous-rush pull-left">
					<i class="fa fa-arrow-left"></i> Previous
				</button>
				<button type="button" onClick="rushList.nextRush(${rushIndex})" class="btn btn-default next-rush">
					Next <i class="fa fa-arrow-right"></i>
				</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.rush-preview-modal -->