<g:if test="${userProfileInstance?.profileImage?.imageUrl != null && !userProfileInstance?.profileImage?.imageUrl.isEmpty()}">
	<span id="preloadProfileImage">
		<img id="profilepicture" class="img-thumbnail image-resize pull-left listing-logo" src="${userProfileInstance?.profileImage?.imageUrl}" alt="profile image"/>
	</span>
</g:if>
<g:else>
	<img class="img-thumbnail image-resize pull-left listing-logo" src="${resource(dir: 'images/userprofile', file: 'fratrosterDefaultBrotherProfile.png')}" alt="Fratroster default profile image"/>
</g:else>