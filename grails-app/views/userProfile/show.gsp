<%@ page import="com.fratroster.user.UserProfile"%>
<%@ page import="com.fratroster.user.User"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Register on fratroster to exclusively connect with prospective rushes and fraternities on campus.">
<meta name="author" content="">
<meta name="keywords" content="fraternities, rushes, alumni">
<title>fratroster - ${userInstance?.profile?.getFullName()}</title>
<g:render template="/include/genericIncludes"/>
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
	<script src="../../assets/js/html5shiv.js"></script>
    <script src="../../assets/js/respond.min.js"></script>
<![endif]-->
</head>
<body>
	<g:render template="/include/header"/>
	
	<g:set var="isOwner" value="${false}" />
	<g:if test="${userInstance.id.toString() == sec.loggedInUserInfo(field: 'id').toString()}">
		<g:set var="isOwner" value="${true}" />
	</g:if>
	
	<!--Container-->
	<div class="container">
		<!--user-profile-section-->
		<div class="row">
			<div class="col-lg-12">
				<!--user-information-section-->
				<div class="text-center">					
					<img class="img-thumbnail profile-image" src="${userInstance?.profile?.profileImage?.imageUrl}" />
					<h3>
						${userInstance?.profile?.getFullName()} | <g:render template="/include/socialNetworkBookmarks" bean="${college?.socialNetworkInfo}" />
					</h3>
					<p>
						<i class="fa fa-bookmark"></i> ${userInstance?.profile?.major} 
						<i class="fa fa-book"></i> ${userInstance?.profile?.gpa}
						<i class="fa fa-graduation-cap"></i> <g:formatDate format="yyyy" date="${userInstance?.profile?.graduationYear}"/>						
					</p>	
					<g:render template="/frat/template/fratThumbnailList" bean="${userInstance}" />
				</div><!--/user-information-section-->
			</div>
		</div><!--/user-profile-section-->		
		<div class="row">
			<div class="col-lg-12">
				<!--Rush Filters-->
				<div class="row">
					<div class="col-lg-12">
						<ul class="nav nav-tabs rush-profile-filters" id="rushes">
							<li class="active"><a href="#about"><i class="fa fa-pencil"></i> About</a></li>	
							<g:if test="${userInstance.activeRush}">
								<g:if test="${isOwner}">
									<li><a href="#rush-invitations"><i class="fa fa-envelope"></i> Pending Rush Invitations</a></li>
								</g:if>
								<li><a href="#fraterniites-rushing"><i class="fa fa-mail-forward"></i> Rushing</a></li>
								<g:if test="${isOwner}">
									<li><a href="#fraternity-bids"><i class="fa fa-check"></i> Bids</a></li>
								</g:if>
							</g:if>
						</ul>
					</div>
					<!--/col-->
				</div>
				<!--/row-->
				<!-- Tab panes -->
				<div class="tab-content">
					<div class="tab-pane fade in active" id="about">
						<div class="row tab-information">
							<div class="col-lg-12">
								<!--essentials-->
								<div class="col-lg-6 col-md-6 col-sm-6">
									<div class="main">
										<div class="banner">
											<p class="banner-title">Essentials</p>
											<g:if test="${isOwner}">
												<g:remoteLink action="updateAbout" id="1" update="about_section">
													<i class="pull-right edit-container fa fa-pencil"></i>
												</g:remoteLink>
											</g:if>
										</div>
										<div id="about_section">
											<g:render template="/userProfile/template/about" bean="${userInstance}" />
										</div>
									</div>
									<!--/main-->
								</div>
								<!--/essentials-->
							</div>
							<!--/col-->
						</div>
						<!--/row-->
					</div>
					<g:if test="${userInstance.activeRush && isOwner}">
						<!--pending-rush-invitations-->
						<div class="tab-pane fade" id="rush-invitations">
							<g:render template="/userProfile/template/rush/pendingRushInvites" bean="${userInstance}" />
						</div>
						<!--/rush-invitations-->
					</g:if>
					<g:if test="${userInstance.activeRush}">
						<div class="tab-pane fade" id="fraterniites-rushing">
							<g:render template="/userProfile/template/rush/rushsFratList" bean="${userInstance}" />
						</div>
					</g:if>
					<!-- /fraternities-rushing-->
					<g:if test="${userInstance.activeRush && isOwner}">
						<div class="tab-pane fade" id="fraternity-bids">
							<g:render template="/userProfile/template/rush/rushBids" bean="${userInstance}" />
						</div>
						<!--/bids-->
					</g:if>
				</div>
				<!-- /tab-content-->
			</div>
		</div>
		<g:if test="${userInstance.activeRush && isOwner}">
			<div id="stopRushingModal">
				<g:render template="/userProfile/modal/rush/stopRushingModal"/>
			</div>
			<div id="acceptBidModal">
				<g:render template="/userProfile/modal/rush/acceptBidModal"/>
			</div>
			<div id="denyBidModal">
				<g:render template="/userProfile/modal/rush/denyBidModal"/>
			</div>
			<div id="acceptRushInviteModal">
				<g:render template="/userProfile/modal/rush/acceptRushInviteModal"/>
			</div>
			<div id="declineRushInviteModal">
				<g:render template="/userProfile/modal/rush/declineRushInviteModal"/>
			</div>
			<div id="revokeRushRequestModal">
				<g:render template="/userProfile/modal/rush/revokeRushRequestModal"/>
			</div>
		</g:if>
		<g:render template="/include/footer"/>
	</div>
	<!-- /Container -->
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<g:render template="/include/javascript"/>
	<script>
		$(function() {
			$("[data-toggle='tooltip']").tooltip();
			//Tabs 
			$('#rushes a').click(function(e) {
				e.preventDefault()
				$(this).tab('show')
			})
		});
			
		function validateEsssentialForm() {

		$('#editAboutForm').validate({
			rules : {
				preferredEmail: {
					required : true,
					email : true
				}
			}, //end form validation rules
			messages : {
				preferredEmail: {
					required : "Please enter your email.",
					email: "Please enter a valid email"
				}
			} //end form error messages
		});

			//check form is valid
			if ($('#editAboutForm').validate().form()) {

			  return true;

			}

			else {

			  return false;

			}

	  	}		
	</script>
</body>
</html>