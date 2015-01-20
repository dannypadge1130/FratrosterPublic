<%@ page import="com.fratroster.user.User"%>
<%@ page import="com.fratroster.user.UserProfile"%>
<%@ page import="com.fratroster.user.UserContact"%>

<div class="module">
	<g:hasErrors bean="${userInstance}">
		<ul class="errors" role="alert">
			<g:eachError bean="${userInstance}" var="error">
				<li
					<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
						error="${error}" /></li>
			</g:eachError>
		</ul>
	</g:hasErrors>
	<g:formRemote role="form" name="editAboutForm" url="[controller: 'userProfile', action: 'updateAbout_save']" before="if(!validateEsssentialForm()) return false;" update="about_section" useToken="true">
		<!--Edit Email-->
		<div class="form-group">			
			<input type="text" class="form-control" name="preferredEmail" value="${userInstance?.profile?.contactInfo?.preferredEmail}" placeholder="Email"/>
		</div>
		<!--Edit Cell-->		
		<div class="form-group">			
			<input type="text" class="form-control" name="phone" value="${userInstance?.profile?.contactInfo?.phone}" placeholder="Cell"/>
		</div>
		<!--Edit Address-->
		<div class="form-group">			
			<input type="text" class="form-control" name="address1" value="${userInstance?.profile?.contactInfo?.address1}" placeholder="Address 1"/>			
		</div>
		<div class="form-group">
			<input type="text" class="form-control" name="address2" value="${userInstance?.profile?.contactInfo?.address2}" placeholder="Address 2"/>
		</div>
		<!--Highschool-->
		<div class="form-group">			
			<input type="text" class="form-control" name="highschool" value="${userInstance?.profile?.highschool}" placeholder="Highschool"/>
		</div>
		<button type="submit" class="btn btn-primary">Update</button>
		<g:remoteLink action="updateAbout_cancel" update="about_section"><button type="button" class="btn btn-danger">Cancel</button></g:remoteLink>
	</g:formRemote>
</div>