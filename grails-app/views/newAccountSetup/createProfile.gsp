<%@ page import="com.fratroster.user.User"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Register on fratroster to exclusively connect with prospective rushes and fraternities on campus.">
<meta name="author" content="">
<meta name="keywords" content="fraternities, rushes, alumni">
<title>fratroster - Create Profile</title>
<g:render template="/include/genericIncludes"/>
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="../../assets/js/html5shiv.js"></script>
      <script src="../../assets/js/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<g:render template="/include/header"/>
	<!--Container-->
	<div class="container">
		<!--Create profile callout-->
		<div class="row">
			<div class="col-lg-12 text-center">
				<h1>Awesome, you're just a few steps away.</h1>
				<p class="help-block">What are you waiting for?</p>
				<hr>
			</div>
		</div>
		<!--/Create profile success callout-->
		<!--Create profile Section-->
		<div class="row">
			<div class="text-center create-profile-section">
				<sec:ifAnyGranted roles="ROLE_FACEBOOK">
					<g:facebookUserImg />
				</sec:ifAnyGranted>
				<sec:ifNotGranted roles="ROLE_FACEBOOK">	
					<g:if test="${userInstance?.profile?.profileImage?.imageUrl != null && !userInstance?.profile?.profileImage?.imageUrl.isEmpty()}">
						<span id="preloadProfileImage">
							<img id="profilepicture" class="img-thumbnail profile-image" src="${userInstance?.profile?.profileImage?.imageUrl}" alt="profile image"/>
						</span>
					</g:if>
					<g:else>
						<i class="img-thumbnail profile-image create-profile-image fa fa-user fa-8x"></i>
					</g:else>
					<div class="upload-profile-photo">
						<g:uploadForm action='photoUpload'>
							<span class="btn btn-default btn-file"><i class="fa fa-picture-o"></i> Change Image 
								<input type="file" name="file">
	              			</span>   
						    <button type='submit' class="btn btn-default">Submit Image</button>
						</g:uploadForm>
					</div>
				</sec:ifNotGranted>
			</div>
		</div>
		<div class="row">
			<g:hasErrors bean="${userInstance}">
				<ul class="errors" role="alert">
					<g:eachError bean="${userInstance}" var="error">
						<li
							<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
								error="${error}" /></li>
					</g:eachError>
				</ul>
			</g:hasErrors>
			<div
				class="col-lg-4 col-lg-offset-4 col-md-5 col-md-offset-4 col-sm-6 col-sm-offset-3">
				
				<g:set var="firstName" value="${userInstance?.profile?.firstName}" />
				<g:if test="${firstName == null || firstName == 'new_user'}">
					<g:set var="firstName" value="" />
				</g:if>
				
				<g:set var="lastName" value="${userInstance?.profile?.lastName}" />
				<g:if test="${lastName == null || lastName == 'new_user'}">
					<g:set var="lastName" value="" />
				</g:if>
				
				<g:form role="form" action="saveprofile" id="create-profile-form" name="create-profile-form"
					useToken="true">
					<div class="form-group">
						<input type="text" class="form-control" name="firstName" value="${firstName}"
							id="firstName" placeholder="First Name">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" name="lastName" value="${lastName}"
							id="lastName" placeholder="Last Name">
					</div>

					<sec:ifNotGranted roles="ROLE_FACEBOOK">
						<div class="form-group">
							<input type="password" class="form-control" name="password"
								id="password" placeholder="Password">
						</div>
						<div class="form-group">
							<input type="password" class="form-control"
								name="confirmPassword" id="confirmPassword"
								placeholder="Confirm Password">
						</div>
					</sec:ifNotGranted>

					<g:set var="gradYear" value="${userInstance?.profile?.graduationYear}" />
					<g:if test="${gradYear == null}">
						<g:set var="gradYear" value="${new Date()}" />
					</g:if>

					<div class="form-group">
						<g:datePicker name="gradYear" value="${gradYear}" precision="year" relativeYears="[-50..10]"
	              			noSelection="['':'-Choose-']"/>
					</div>
					<button type="submit" class="btn-mobile btn btn-primary">Next</button>
				</g:form>
			</div>
		</div>
		<!--/Create profile Section-->
	<g:render template="/include/newaccountsetupbreadcrumbs1"/>
	</div>
	<!-- /Container -->
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<g:render template="/include/javascript"/>
	<script>
		$(function() {
			//focus on first field
			$('#create-profile-form :input:enabled:visible:first').focus();
			//validate registration form 
			$('#create-profile-form')
					.validate(
							{
								rules : {
									firstName : {
										required : true
									},
									lastName : {
										required : true
									},
									password : {
										required : true,
										minlength : 6
									},
									confirmPassword : {
										required : true,
										minlength : 6,
										equalTo : '#password'
									},
									gradYear : {
										required : true
									}
								}, //end form validation rules
								messages : {
									firstName : {
										required : "Please enter your First Name."
									},
									lastName : {
										required : "Please enter your Last Name."
									},
									password : {
										required : "Please enter your Password.",
										minlength : jQuery
												.format("At least {0} characters required.")
									},
									confirmPassword : {
										required : "Please enter your Password.",
										minlength : jQuery
												.format("At least {0} characters required."),
										equalTo : "Passwords must match."
									},
									gradYear : {
										required : "Please select your Grad Year. "
									}
								}
							//end form error messages
							});
		});
	</script>
</body>
</html>