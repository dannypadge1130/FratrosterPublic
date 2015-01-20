<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title><g:message code="SITE_TITLE" args='["Error - Unathorized Access"]'/></title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Fraternity User Access Error">
	<g:render template="/include/genericIncludes"/>
</head>
	<body>
		 <g:render template="/include/header"/>		   		 
		 <div class="container">
        	<div class="row">
          		<div class="col-lg-6 col-lg-offset-3">
          			<div class="main">
            		<div class="banner">
              			<p class="banner-title">Access Denied!</p> 
            		</div>
              		<p class="text-center">You do not currently have access to this User.</p>
              		</div>
              	</div>
             </div>
		 <g:render template="/include/footer"/>
		 </div>
	</body>
</html>