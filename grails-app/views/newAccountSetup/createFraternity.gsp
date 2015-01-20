<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Register on fratroster to exclusively connect with prospective rushes and fraternities on campus.">
    <meta name="author" content="">
    <meta name="keywords" content="fraternities, rushes, alumni">
    <title>fratroster - Create Fraternity</title>
    <g:render template="/include/genericIncludes"/>
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="../../assets/js/html5shiv.js"></script>
      <script src="../../assets/js/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
    <g:render template="/include/header" />
    <!--Container-->
    <div class="container">
      <!--Create Fraternity callout--> 
      <div class="row">
        <div class="col-lg-12 text-center">          
          <h1>It's time to start your fraternity.</h1>      
          <p class="help-block">Does your fraternity already exist? <g:link action="selectFraternity" controller="newAccountSetup">Join it.</g:link></p>  
          <hr>
        </div>
      </div><!--/Create Fraternity success callout-->
      <!--Create Fraternity Section-->
      <div class="row">
      	<g:hasErrors bean="${fratInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${fratInstance}" var="error">
					<li<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
						<g:message error="${error}" />
					</li>
				</g:eachError>
			</ul>
		</g:hasErrors>   
        <div class="col-lg-4 col-lg-offset-4 col-md-5 col-md-offset-4 col-sm-6 col-sm-offset-3">
          <g:form role="form" id="create-fraternity-form" name="create-fraternity-form" action="createFraternity_save">            
            <div class="form-group">
              <input type="text" class="form-control" name="fratName" id="fraternityName" placeholder="Fraternity Name">
            </div>
            <div class="form-group">
              <select class="form-control" name="fratType" id="fraternityType">
                <option value="">Select Fraternity Type</option>
                <option value="1">National</option>
                <option value="2">Local</option>
                <option value="3">Business</option>
              </select>
            </div>                    
            <button type="submit" class="btn-mobile btn btn-primary">Create Fraternity</button>
          </g:form>
        </div>      
      </div><!--/Create profile Section-->
    </div> <!-- /Container -->
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <g:render template="/include/javascript"/>
    <script>
    $(function() {      
      //focus on first field
      $('#create-fraternity-form :input:enabled:visible:first').focus();      
      //validate registration form 
      $('#create-fraternity-form').validate({
        rules: {
          fratName: {
            required: true
          },
          fratType: {
            required: true            
          }
        }, //end form validation rules
        messages: {    
          fratName: {
            required: "Please enter your Fraternity Name."
          },
          fratType: {
            required: "Please provide your Fraternity Type."
          }
        } //end form error messages
      });
    });
    </script>    
  </body>
</html>