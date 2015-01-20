<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="fratroster is an exclusive site that let's fraternities connect with rushes, consolidate operations, and grow on campus.">
    <meta name="author" content="">
    <meta name="keywords" content="fraternities, rushes, alumni">
  	<title><g:message code="SITE_TITLE" args='["Home"]'/></title>
    <g:render template="/include/genericIncludes"/>        
    <!--Social Button Styles-->
    <link href="${resource(dir: 'css/social-buttons', file: 'social-buttons.css')}" rel="stylesheet">
  </head>
  <body>
    <g:render template="/include/header"/>
    <!--begin container-->
    <div class="container"> 
      <div class="text-center">
        <h1>Welcome to fratroster.</h1>         
        <div class="home-actions">          
          <g:link controller="registration" action="signup" class="btn btn-primary btn-mobile">Get Started</g:link>
          <facebookAuth:connect />
        </div>
        <p>Already have an account? <g:link controller="login" action="index" class="login-link">Log in</g:link></p>
        <hr>
        <!--fratroster-promotion-video-->        
        <iframe width="100%" height="315" src="//www.youtube.com/embed/vqWtYaZskWI" frameborder="0" allowfullscreen></iframe>        
      </div>    
      <g:render template="/include/footer"/>
    </div> 
    <!--/container -->    
</body>
</html>