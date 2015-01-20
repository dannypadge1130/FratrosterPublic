<%@ page import="com.fratroster.user.User" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Register with fratroster.">
    <meta name="author" content="">
    <meta name="keywords" content="fraternities, rushes, alumni">
    <title><g:message code="SITE_TITLE" args='["Register"]'/></title>
    <g:render template="/include/genericIncludes"/>    
  </head>    
  <body>
    <g:render template="/include/header"/>
    <!--Container-->
    <div class="container">
      <!--Registration Callout--> 
      <div class="row">
        <div class="col-lg-12 text-center">          
          <h1><g:message code="JOIN_FRATROSTER"/></h1>      
          <p class="help-block"><g:message code="ALREADY_REGISTERED"/> <g:link controller="login"><g:message code="LOG_IN"/></g:link>.</p>  
          <hr>
        </div>
      </div><!--/Registration Callout-->
      <!--Registration Form Section-->
      <div class="row">
        <div class="col-lg-4 col-lg-offset-4 col-md-5 col-md-offset-4 col-sm-6 col-sm-offset-3">         
          <g:form role="form" action="register" name="registration-form" id="registration-form" useToken="true" novalidate="novalidate">
              <div class="form-group">
                <input type="email" class="form-control" name="email" id="user-email" placeholder="Email">
                <g:hasErrors bean="${userReg}">                
                    <g:eachError bean="${userReg}" var="error">
                      <label class="error">
                        <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>
                        <g:message error="${error}"/>
                      </label>
                    </g:eachError>                
                </g:hasErrors>                     
              </div>          
              <button type="submit" class="btn-mobile btn btn-primary"><g:message code="REGISTER"/></button>
              <p class="help-block"><g:message code="TERMS_SERVICES"/> <a href="#">Terms of Services</a> <g:message code="AND"/> <a href="#">Privacy Policy</a>.</p>
          </g:form>
        </div>
      </div><!--/Registration Form Section-->
    </div> <!--/Container --> 
    <g:render template="/include/javascript"/>
    <script>
      $(function() {      
        //Put focus on the first form field
        $('#registration-form :input:enabled:visible:first').focus();
        //validate registration form 
        $('#registration-form').validate({
          rules: {
            email: {
              required: true
            }         
          }, //end form validation rules
          messages: {    
            email: {
              required: 'Please enter your email.'
            }
          } //end form error messages
        });
      });
    </script>
  </body>
</html>
