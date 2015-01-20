<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Register on fratroster to exclusively connect with prospective rushes and fraternities on campus.">
    <meta name="author" content="">
    <meta name="keywords" content="fraternities, rushes, alumni">
    <title>fratroster - Join Fraternity</title>
    <g:render template="/include/genericIncludes"/>
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="../../assets/js/html5shiv.js"></script>
      <script src="../../assets/js/respond.min.js"></script>
    <![endif]-->   
  </head>
  <body>
    <g:render template="/include/header"/>
    <!--Container-->
    <div class="container">
      <!--Create profile callout--> 
      <div class="row">
        <div class="col-lg-12 text-center">          
          <h1>Welcome to brotherhood.</h1>      
          <p class="help-block">Can't find your fraternity? <g:link controller="newAccountSetup" action="createFraternity">Create it.</g:link></p>
          <hr>
        </div>
      </div><!--/Create profile Callout-->
      <!--Create profile Section-->
      <div class="row">     
        <div class="col-lg-4 col-lg-offset-4 col-md-5 col-md-offset-4 col-sm-6 col-sm-offset-3">
          <g:form role="form" id="select-fraternity-form" name="select-fraternity-form" action="selectFraternity_save">                                     
            <div class="form-group">
              <select class="form-control" name="selectFraternity" id="selectFraternity">              		
                  <option value="">Select Fraternity</option>
              		<g:each var="currFrat" in="${fratList}" status="i">                    
						        <option value="${currFrat.id}">${currFrat.fratName}</option>
					         </g:each>             
              </select>
              <g:hasErrors bean="${pBrotherInstance}">
                <g:eachError bean="${pBrotherInstance}" var="error">
                  <label class="error">
                    <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>
                    <g:message error="${error}" />
                  </label>
                </g:eachError>                      
              </g:hasErrors>   
            </div>             
            <button type="submit" class="btn-mobile btn btn-primary">Join Fraternity.</button>
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
      $('#select-fraternity-form :input:enabled:visible:first').focus();
      //initiate tooltips
      $("[data-toggle='popover']").popover();  
      //validate registration form 
      $('#select-fraternity-form').validate({
        rules: {
          selectFraternity: {
            required: true            
          }         
        }, //end form validation rules
        messages: {    
          selectFraternity: {
            required: "Please select your Fraternity."
          }       
        } //end form error messages
      });
    });
    </script>    
  </body>
</html>