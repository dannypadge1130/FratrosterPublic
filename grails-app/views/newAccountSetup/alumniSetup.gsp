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
     	<g:hasErrors bean="${pAlumniInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${pAlumniInstance}" var="error">
					<li<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
						<g:message error="${error}" />
					</li>
				</g:eachError>
			</ul>
		</g:hasErrors>       
        <div class="col-lg-4 col-lg-offset-4 col-md-5 col-md-offset-4 col-sm-6 col-sm-offset-3">
          <g:form role="form" id="select-fraternity-form" action="alumniSetup_save">  
			<div class="form-group">
	            <select class="span4" id="reg_state" name="state" onchange="alumniregistrationjs.getCollegeJSON();">
	            	<g:each var="currState" in="${states}" status="i">
						<option value="${currState.stateAbrv}"<g:if test="${i == 0}">selected</g:if>>${currState.stateName}</option>
					</g:each>
				</select>
          	</div>
          	<div class="form-group">
		        <select class="span4 required" id="collegeList" name="college" onchange="alumniregistrationjs.getFratJSON(this.value);">
	            </select>
            </div>                  
            <div class="form-group">
                <select class="form-control" name="selectFraternity" id="selectFraternity">
            	</select>
            </div>            
            <!--ALUMNUS ONLY TEXT-->
            <p class="help-block"><a href="#" data-toggle="popover" data-placement="top" data-content="Not here, yet. Get an active brother to create it!">Where's my fraternity?</a></p>
            <!--/ALUMNUS ONLY TEXT-->
            <button type="submit" class="btn-mobile btn btn-primary">Join Fraternity.</button>
          </g:form>
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
    
    <script type="text/javascript">
	    alumniregistrationjs = {
	    	collegeJSON : new Object(),
	    	fratJSON: new Object(),
	    	
	    	getFratJSON:function(collegeNameVal){
	    		jQuery.ajax({
	    		    url: "/fratRoster/getFratJSON",
	    		    type: "GET",
	    		    data: {collegeName: collegeNameVal},
	    		    dataType: "json",
	    		    beforeSend: function(x) {
	    		    	if (x && x.overrideMimeType) {
	    		    		x.overrideMimeType("application/j-son;charset=UTF-8");
	    		      	}
	    		    },
	    		    success: function(result) {
	    		    	alumniregistrationjs.setCollegeJSON(result.content);
	    		      	alumniregistrationjs.populateFratSelect(result.content);
	    		    }
	    		});
	    	},
	    	
	    	setFratJSON:function(json) {
	    		this.fratJSON = json;
	    	},
	    	
	    	populateFratSelect:function(json){
	    		var fratListObj = document.getElementById("selectFraternity");
	    		while(fratListObj.hasChildNodes()) {
	    			fratListObj.removeChild(fratListObj.firstChild);
	    		}
	    		for(i=0; i<json.frats.length; i++){
	    			fratListObj.options[i]=new Option(json.frats[i].fratName, json.frats[i].fratName);
	    		}
	    	},
	    		
	    	setCollegeJSON:function(json){
	    		this.collegeJSON = json;
	    	},
	    		
	    	getCollegeJSON:function(){
	    		var state = document.getElementById("reg_state");
	    		var stateValue = state.options[state.selectedIndex].value;
	    		jQuery.ajax({
	    		    url: "/fratRoster/collegeInfoJSON",
	    		    type: "GET",
	    		    data: {stateAbrv: stateValue},
	    		    dataType: "json",
	    		    beforeSend: function(x) {
	    		    	if (x && x.overrideMimeType) {
	    		    		x.overrideMimeType("application/j-son;charset=UTF-8");
	    		      	}
	    		    },
	    		    success: function(result) {
	    		    	alumniregistrationjs.setCollegeJSON(result.content);
	    		      	alumniregistrationjs.populateCollegeSelect(result.content);
	    		    }
	    		});
	    	},
	    	
	    	populateCollegeSelect:function(json){
	    		var collegeListObj = document.getElementById("collegeList");
	    		while(collegeListObj.hasChildNodes()) {
	    			collegeListObj.removeChild(collegeListObj.firstChild);
	    		}
	    			
	    		for(i=0; i<json.colleges.length; i++){
	    			collegeListObj.options[i]=new Option(json.colleges[i].collegeName, json.colleges[i].collegeName);
	    			if(i==0){
	    				collegeListObj.options[i].selected = true;
	    				alumniregistrationjs.getFratJSON(collegeListObj.options[i].value);
	    			}
	    		}
	    	}
	    }

		$(document).ready( function(){
			alumniregistrationjs.getCollegeJSON();
			$('#reg_state').focus();
		});
	</script>
  </body>
</html>