<%@ page import="com.fratroster.user.User" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Login to fratroster.">
    <meta name="author" content="">
    <meta name="keywords" content="fraternities, rushes, alumni">
    <title><g:message code="SITE_TITLE" args='["Password Sent"]'/></title>
    <g:render template="/include/genericIncludes"/> 
  </head> 
<body>
    <g:render template="/include/header"/>
    <!--Container-->
    <div class="container">
      <!--forgot-password-callout-->
      <div class="row">
        <div class="col-lg-12 text-center">          
          <h1>Password Sent!</h1>      
          <p class="help-block">If you don't receive instructions within a few minutes, check your email's spam and junk filters.</p>  
          <hr>
        </div>
      </div>
      <!--/forgot-password-callout-->
      <!--forgot-password-section-->
      <div class="row">
        <div class="col-lg-12 text-center">         
          <g:link controller="forgotPassword" action="index">Still haven't received it?</g:link>
        </div>
      </div>
      <!--/forgot-password-section-->
    </div> 
    <!--/Container --> 
  <g:render template="/include/javascript"/>
</body>
