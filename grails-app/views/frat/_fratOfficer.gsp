<div id="officers" class="mediumContent">
	<div id="officerbanner" class="mediumContentBanner">
		<p class="bannerTitle">		
			<g:if test="${fratInstance?.fratName}">
				<span class="property-value" aria-labelledby="fratName-label"><g:fieldValue bean="${fratInstance}" field="fratName"/>Officers</span>
			</g:if>
		</p>
	</div>
	<div class="rs-carousel [rs-carousel-horizontal rs-carousel-vertical rs-carousel-disabled]">
		<div class="rs-carousel-mask"> 
	    	<ul class="rs-carousel-runner">
	    		<g:each in="${officerList}" status="i" var="officer">
		        	<li class="rs-carousel-item">
		            	<div class="carouselObject">
		                	<div class="carouselObjectName">
		                    	<a href="#">${officer.user.profile.firstName} ${officer.user.profile.lastName}</a>
		                    </div>
		                    <div class="fratphoto">
								<g:if test="${officer?.profileImageName}">
									<img src="${officer?.profileImageUrl}" alt="profile image"/>
								</g:if>
								<g:else>
									<img src="${resource(dir: 'images/userprofile', file: 'fratrosterDefaultBrotherProfile.png')}" alt="Fratroster default profile image"/>
								</g:else>
							</div>
		                    <div class="carouselObjectTitle">
		                    	<p>${officer.officerMember.title}</p>
		                	</div>
		                </div>
		          	</li>
	          	</g:each>
	      	</ul>
	 	</div>
	</div>
</div>