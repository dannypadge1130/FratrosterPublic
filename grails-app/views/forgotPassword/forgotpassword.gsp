<%@ page import="com.fratroster.user.User" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Login to fratroster.">
    <meta name="author" content="">
    <meta name="keywords" content="fraternities, rushes, alumni">
    <title><g:message code="SITE_TITLE" args='["Forgot Password"]'/></title>
    <g:render template="/include/genericIncludes"/>  
  </head> 
<body>
    <g:render template="/include/header"/>
    <!--Container-->
    <div class="container">
      <!--forgot-password-callout-->
      <div class="row">
        <div class="col-lg-12 text-center">          
          <h1>Forgot your password?</h1>      
          <p class="help-block">Enter in your email below and leave the rest to us.</p>  
          <hr>
        </div>
      </div>
      <!--/forgot-password-callout-->
      <!--forgot-password-section-->
      <div class="row">
        <div class="col-lg-4 col-lg-offset-4 col-md-5 col-md-offset-4 col-sm-6 col-sm-offset-3">         
          <g:form role="form" name="resetUserPassword" method="post" id="resetUserPassword" novalidate="novalidate">
              <div class="form-group">
                <input type="email" class="form-control" name="user_email" id="user_email" placeholder="Email">
                <g:if test="${errorMessage != null && !errorMessage.isEmpty()}" class="errorMessage">
                  <label class="error">${errorMessage}</label>
                </g:if>                   
              </div>          
              <g:actionSubmit class="btn btn-primary btn-mobile" id="forgotPasswordSubmit" action="submitForgotPassword" value="Send Password!"/>
          </g:form>
        </div>
      </div>
      <!--/forgot-password-section-->
    </div> 
    <!--/Container --> 
  <g:render template="/include/javascript"/>
  <script>
    $(function () {   
      //Focus email field when login modal displays     
      $("#user_email").focus();     
      //validate registration form 
      $('#resetUserPassword').validate({
        rules: {
          user_email: {
            required: true
          }         
        }, //end form validation rules
        messages: {    
          user_email: {
            required: 'Please enter your email.'
          }
        } //end form error messages
      });        
    });
  </script>
</body>