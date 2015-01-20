<g:if test="${alertMessage}">
	<div class="alert alert-success">  
		<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>  
 		<p>${alertMessage}</p> 
	</div> 
</g:if>

<g:each in="${pendingMemberList}" status="i" var="pendingMember">
  <!--pending brother-->
  <div class="col-lg-3 col-sm-4">            
    <div class="list-background">
      <div class="banner">
        <p class="banner-title">${pendingMember?.user?.profile?.firstName} ${pendingMember?.user?.profile?.lastName}</p> 
      </div>
      <!--pending brother container-->
      <div class="list-container text-center"> 
      	<!--pending brother approval/denial options-->    
      	<div class="list-options">
        	<a class="btn btn-default" href="javascript:populateApprovalModal('member','${pendingMember.id}');"><i class="fa fa-check fa-2x"></i></a> 
            <a class="btn btn-default" href="javascript:populateDenyModal('member','${pendingMember.id}');"><i class="fa fa-ban fa-2x"></i></a>               
        </div>                              
        <div class="hover-mask"> 
	    	<!--pending brother image-->          
			<g:link controller="userProfile" action="show" id="${pendingMember?.user?.profile?.id}">
				<g:if test="${pendingMember?.user?.profile?.profileImage}">
					<img src="${pendingMember?.user?.profile?.profileImageUrl}" class="img-thumbnail image-resize listing-logo" alt="profile image"/>
				</g:if>
				<g:else>
					<img src="${resource(dir: 'images/userprofile', file: 'fratrosterDefaultBrotherProfile.png')}" class="img-thumbnail image-resize listing-logo" alt="Fratroster default profile image"/>
				</g:else>
			</g:link>            
          	<!--pending brother info-->
          	<div class="info text-left">
            	<p class="listing-response"><span class="highlight">About:</span> <span>${pendingMember?.user?.profile?.description}</span></p>
            	<p class="listing-response"><span class="highlight"><g:message code="GRAD_YEAR"/></span> <g:formatDate format="yyyy" date="${pendingMember?.user?.profile?.graduationYear}"/></p>
          	</div><!--/pending-brother info-->
        </div><!--/hover-mask-->                  
      </div><!--/list-container-->
    </div><!--/list-background-->                
  </div><!--pending brothers-->
</g:each>	
