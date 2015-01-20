<%@ page import="com.fratroster.user.UserProfile" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title><g:message code="SITE_TITLE" args='["Edit ${userProfileInstance?.firstName} ${userProfileInstance?.lastName}"]'/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
	  	<meta name="description" content="Edit Fratroster's User Profile">
		<g:render template="/include/genericIncludes"/>
		<link href="${resource(dir: 'css/jqueryuploader', file: 'jquery.fileupload-ui.css')}" rel="stylesheet">
		<link href="${resource(dir: 'css/jqueryuploader', file: 'jquery.fileupload-ui-noscript.css')}" rel="stylesheet">
	</head>
	<body>
		<g:render template="/include/header"/>
		<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
		</g:if>
		<g:hasErrors bean="${userProfileInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${userProfileInstance}" var="error">
					<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
		</g:hasErrors>
		<div id="alert_placeholder"></div>		
		<div class="container">
	      <div class="row">
	        <div class="col-lg-6">
	          <!--About <g:fieldValue bean="${userProfileInstance}" field="firstName"/>-->
	          <div class="main">
	            <div class="banner">
	              <p class="banner-title">Edit <g:fieldValue bean="${userProfileInstance}" field="firstName"/>'s Profile</p>
	              <!--Save / Cancel-->               
	                <g:if test="${secUser?.profile?.id == userProfileInstance?.id}">
	                  <g:link action="edit" id="${userProfileInstance?.id}"><i class="pull-right edit-container fa fa-save"></i></g:link>
	                </g:if>
	            </div>
	            <%--BEGIN: REFRESH AREA - PROFILE PICTURE --%>
				<g:render template="/include/profileimage"/>  
				<%--END: REFRESH AREA - PROFILE PICTURE --%>
				<g:formRemote name="refreshProfilePic" onComplete="preloadProfileImage();" update="userPhoto" url="[ controller: 'image', action:'refreshProfilePic' ]"></g:formRemote>
	          	<%--AJAX FILE UPLOAD --%>
				<input id="fileupload" type="file" name="file" data-url='<g:createLink controller="image" action="uploadProfilePhoto" />'>
				<div id="progress">
				    <div class="bar" style="width: 0%;"></div>
				</div>
	            <h2 class="listing-title"><g:fieldValue bean="${userProfileInstance}" field="firstName"/> <g:fieldValue bean="${userProfileInstance}" field="lastName"/></h2>  
	            <g:form role="form">			  
	            	<g:hiddenField name="id" value="${userProfileInstance?.id}" />
					<g:hiddenField name="version" value="${userProfileInstance?.version}" />
				  <div class="form-group">			    
				    <g:textArea class="form-control" name="description" required="" placeholder="Describe yourself" value="${userProfileInstance?.description}"/>
				  </div>			  	
				  <div class="form-group">
				  	<g:select class="required" name="graduationYear" from="${2013..1950}" value="${userProfileInstance?.graduationYear}" noSelection="['':'Please select one']"/>
				  </div>		  
				  	<g:actionSubmit class="btn btn-default save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					<g:link controller="userProfile"><button type="button" class="btn btn-danger">Cancel</button></g:link>
				</g:form>                     
	          </div>
	      	</div>
	      </div>
	  	<g:render template="/include/footer"/>
	  	</div>
	  	<g:render template="/include/javascript"/>		
		<script type="text/javascript" src="${resource(dir: 'js', file: 'global.js')}"></script>	
		<script type="text/javascript" src="${resource(dir: 'js/jqueryuploader/vendor', file: 'jquery.ui.widget.js')}"></script>
		<script type="text/javascript" src="${resource(dir: 'js/jqueryuploader', file: 'jquery.iframe-transport.js')}"></script>
		<script type="text/javascript" src="${resource(dir: 'js/jqueryuploader', file: 'jquery.fileupload.js')}"></script>
		<script type="text/javascript">
			$(function () {
			    $('#fileupload').fileupload({
			        dataType: 'json',
			        done: function (e, data) {
				        if(data._response.result.content.status === 'success') {
				        	$("#refreshProfilePic").submit();
				            $('#alert_placeholder').html('<div class="alert alert-success text-center"><a class="close" data-dismiss="alert">×</a><span>'+data._response.result.content.message+'</span></div>');
							 
			            } else {
							$('#alert_placeholder').html('<div class="alert alert-warning text-center"><a class="close" data-dismiss="alert">×</a><span>'+data._response.result.content.message+'</span></div>');
						}
						
			        },
				    progressall: function (e, data) {
				        var progress = parseInt(data.loaded / data.total * 100, 10);
				        $('#progress .bar').css(
				            'width',
				            progress + '%'
				        );
				    },
				    fail: function (e, data) {
				    	$('#alert_placeholder').html('<div class="alert alert-danger text-center"><a class="close" data-dismiss="alert">×</a><span>'+data._response.result.content.message+'</span></div>');
					}
			    });
			});
			
			function preloadProfileImage() {
				$('#profilepicture').load(function() {
					$("#preloadProfileImage").show();
				});
			}
			preloadProfileImage();
		</script>
	</body>
</html>
