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
          <h1>Great, you're really close.</h1>      
          <p class="help-block">How about telling us who you are?</p>  
          <hr>
        </div>
      </div><!--/Create profile success callout-->
      <!--Select status Section-->
      <div class="row">         
        <div class="col-lg-5 col-lg-offset-4 col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
          <form role="form" id="select-status-form">            
            <div class="form-group text-center">
              <p>
              	<g:link controller="newAccountSetup" action="schoolEmailSetup" params="[flowType: 'rush']" class="btn btn-default btn-mobile">I'm a Rush</g:link>
              	<g:link controller="newAccountSetup" action="schoolEmailSetup" params="[flowType: 'brother']" class="btn btn-default btn-mobile">I'm a Brother</g:link>
              	<g:link controller="newAccountSetup" action="alumniSetup" params="[flowType: 'alumni']" class="btn btn-default btn-mobile">I'm a Alumnus</g:link>
              </p>
            </div>                                  
          </form>
        </div>      
      </div><!--/Select Status  Section-->
      <g:render template="/include/newaccountsetupbreadcrumbs2"/>
    </div> <!-- /Container -->
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <g:render template="/include/javascript"/>
    <script>
    $(function() {      
      //focus on first field
      $('#create-profile-form :input:enabled:visible:first').focus();
      //validate registration form 
      $('#create-profile-form').validate({
        rules: {
          firstName: {
            required: true
          },
          lastName: {
            required: true            
          },
          password: {
            required: true,
            minlength: 6
          },
          confirmPassword: {
            required: true,
            minlength: 6,
            equalTo: '#password'              
          },
          gradYear: {
            required: true
          }
        }, //end form validation rules
        messages: {    
          firstName: {
            required: "Please enter your First Name."
          },
          lastName: {
            required: "Please provide your Last Name."
          },          
          password: {
            required: "Please provide your password.",
            minlength: jQuery.format("At least {0} characters required.")            
          },
          confirmPassword: {
            required: "Please provide your password.",
            minlength: jQuery.format("At least {0} characters required."),
            equalTo: "Passwords must match."
          },
          gradYear: {
            required: "Please select your Grad Year. "
          }
        } //end form error messages
      });
    });
    </script>    
  </body>
</html>