<%@ page import="com.fratroster.Frat" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Log In to fratroster.">
    <meta name="author" content="">
    <meta name="keywords" content="fraternities, rushes, alumni">
  	<title><g:message code="SITE_TITLE" args='["Log In"]'/></title>
    <g:render template="/include/genericIncludes"/>
    <!--Bootstrap3 Social Button Styles-->
    <link href="${resource(dir: 'css/social-buttons', file: 'social-buttons.css')}" rel="stylesheet">     
  </head>	
	<body>
		<g:render template="/include/header"/>
	    <!--Container-->
	    <div class="container">
	      <!--Log In callout--> 
	      <div class="row">
	        <div class="col-lg-12 text-center">          
	          <h1><g:message code="LOG_IN_TO_FRATROSTER"/></h1>      
	          <p class="help-block"><g:message code="NOT_COOL_YET"/> <g:link controller="registration" action="signup">Register</g:link>.</p>  
	          <hr>
	        </div>
	      </div><!--/Registration callout-->
	      <!--Log In Form Section-->
	      <div class="row">
	        <div class="col-lg-4 col-lg-offset-4 col-md-5 col-md-offset-4 col-sm-6 col-sm-offset-3">
	          <form role="form" action='${postUrl}' method='POST' name='loginForm' id='loginForm'>
	            <div class="form-group text-center">
	           		<g:if test='${flash.message}'>
	           			<div class="alert alert-danger fade in">	    					
	    					${flash.message}
	  					</div>	                	
	              	</g:if>	
	            	<facebookAuth:connect />
	            </div>
	            <div class="form-group">
	              <p class="help-block text-center"><g:message code="OR"/></p>
	              <input type="email" class="form-control" id="username" name="j_username" placeholder="Email">
	            </div>
	             <div class="form-group">
	              <input type="password" class="form-control" id="password" name="j_password" placeholder="Password">
	            </div>
	            <div class="checkbox">
	              <label>
	                <input type="checkbox" id="remember_me" name="${rememberMeParameter}" <g:if test='${hasCookie}'>checked='checked'</g:if>/><g:message code="REMEMBER_ME"/>
	              </label>
	            </div> 	            
	            <button type="submit" class="btn-mobile btn btn-primary" id="login"><g:message code="LOG_IN"/></button>
	            <p class="help-block text-center"><g:link controller="forgotPassword" action="index">Forgot your password?</g:link></p>
	          </form>
	        </div>
	      </div><!--/Log In Form Section-->
	    </div> <!-- /Container -->				
	</body>
    <g:render template="/include/javascript"/>    
    <script>
    $(function() {      
      //focus on first field
      $('#loginForm:not(.btn) :input:enabled:visible:first').focus();
      //validate registration form 
      $('#loginForm').validate({
        rules: {
          j_username: {
            required: true
          },
          j_password: {
            required: true,
            minlength: 6
          }         
        }, //end form validation rules
        messages: {    
          j_username: {
            required: "Please enter your email."
          },
          j_password: {
            required: "Please provide your password.",
            minlength: jQuery.format("At least {0} characters required.")
          }
        } //end form error messages
      });
    });
    </script>    
</html>