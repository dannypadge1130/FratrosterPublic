<%@ page import="com.fratroster.user.User"%>
<%@ page import="com.fratroster.user.UserProfile"%>
<%@ page import="com.fratroster.user.UserContact"%>

<div class="module">
	<p class="listing-response">
		<span class="highlight">Email:</span> 
		<a href="mailto:${userInstance?.profile?.contactInfo?.preferredEmail}">${userInstance?.profile?.contactInfo?.preferredEmail}</a>
	</p>
	<p class="listing-response">
		<span class="highlight">Cell:</span> ${userInstance?.profile?.contactInfo?.phone}
	</p>
	<p class="listing-response">
		<span class="highlight">Hometown:</span> ${userInstance?.profile?.contactInfo?.address1} ${userInstance?.profile?.contactInfo?.address2}
	</p>
	<p class="listing-response">
		<span class="highlight">Highschool:</span> ${userInstance?.profile?.highschool}
	</p>
</div>
