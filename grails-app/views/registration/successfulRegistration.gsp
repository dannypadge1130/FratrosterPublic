<%@ page import="com.fratroster.user.User" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="Registration successful.">
		<meta name="author" content="">
		<meta name="keywords" content="fraternities, rushes, alumni">
		<title><g:message code="SITE_TITLE" args='["Registration Success"]'/></title>
		<g:render template="/include/genericIncludes"/>    
	</head>    
	<body>
		<g:render template="/include/header"/>
		<!--Container-->
		<div class="container">
			<!--registration-success-callout-->
			<div class="row">
				<div class="col-lg-12 text-center">          
					<g:if test="${username != null && !username.isEmpty()}">
						<h1>Congratulations! We just sent you your password.</h1>      												
			  			<p class="help-block"><g:link controller="userProfile" action="index">Head home!</g:link></p>					
					</g:if>
					<g:else>
						<h1>Sorry but it looks like your email was missing!?</h1>
						<p class="help-block"><g:link controller="registration" action="signup">Try signing up again!</g:link></p>
					</g:else>        	
					<hr>
				</div>
			</div>
			<!--/registration-success-callout-->
		</div> <!--/Container -->
	</body>
</html>
