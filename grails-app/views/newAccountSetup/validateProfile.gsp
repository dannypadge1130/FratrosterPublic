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
    <style>      
      .help-block {
        margin-top: 15px;
      }           
    </style>    
  </head>
  <body>
    <g:render template="/include/header"/>
    <!--Container-->
    <div class="container">
      <!--Create profile callout--> 
      <div class="row">
        <div class="col-lg-12 text-center">          
          <h1>You're basically home free.</h1>      
          <p>How about crossing that finish line?</p>  
          <hr>
        </div>
      </div><!--/Create profile Callout-->   	
      <!--Create profile Section-->
      <div class="row">         
        <div class="col-lg-4 col-lg-offset-4 col-md-5 col-md-offset-4 col-sm-6 col-sm-offset-3">          
          <g:if test="${userInstance?.verificationPin != null && !userInstance?.verificationPin.isEmpty()}">
            <!--Pin Success Message-->
            <div class="alert alert-success text-center">
              <p>A pin has been sent to your school email. Please provide the pin below to finish the verification process.</p>
            </div><!--/Pin Succes Message--> 
          </g:if>         
          <!--College Email-->
          <g:form role="form" id="create-profile-form" name="create-profile-form" action="validateEduEmail" useToken="true">            
            <div class="form-group">
              <input type="email" class="form-control" name="collegeEmail" id="collegeEmail" placeholder="College Email">
              <g:hasErrors bean="${userInstance}">                
                <g:eachError bean="${userInstance}" var="error">
                    <label class="error" <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></label>
                  </g:eachError>                
              </g:hasErrors>               
            </div>                                                        
            <button type="submit" class="btn-mobile btn btn-primary">Send Pin</button>
          </g:form><!--/College Email-->
          <g:if test="${userInstance?.verificationPin != null && !userInstance?.verificationPin.isEmpty()}">      
            <!--Validate Edu Email-->
            <g:form role="form" id="verify-pin-form" name="verify-pin-form" action="validateEduPin" useToken="true">            
              <div class="form-group">
                <input type="text" class="form-control" name="verificationPin" id="verificationPin" placeholder="Verification Pin">
              </div>                                               
              <button type="submit" class="btn-mobile btn btn-primary">Finish</button>
            </g:form><!--/Validate Edu Email-->
          </g:if>                 
        </div>     
      </div><!--/Create profile Section-->      
      <g:render template="/include/newaccountsetupbreadcrumbs3"/>
    </div> <!-- /Container -->
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <g:render template="/include/javascript"/>
    <script>
    $(function() {      
      //focus on first field
      $('#create-profile-form :input:enabled:visible:first').focus();
      //Check if valid college email
      jQuery.validator.addMethod("edu", function(value, element) {
        // Make it work optionally OR
        //  Check the last 4 characters and ensure they match .edu
        return (this.optional(element) || value.slice(-4) == ".edu"); 
      });
      //validate registration form 
      $('#create-profile-form').validate({
        rules: {
          collegeEmail: {
            required: true,
            edu: true
          }        
        }, //end form validation rules
        messages: {    
          collegeEmail: {
            required: "Please enter your College Email.",
            edu: "Please enter a valid College Email"
          }     
        } //end form error messages
      });
      $('#verify-pin-form').validate({
          rules: {
            verificationPin: {
              required: true            
            }         
          }, //end form validation rules
          messages: {    
            verificationPin: {
              required: "Please enter your Verification Pin."
            }       
          } //end form error messages
       });
    });
    </script>    
  </body>
</html>