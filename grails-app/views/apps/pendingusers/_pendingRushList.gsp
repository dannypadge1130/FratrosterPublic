<g:if test="${alertMessage}">
	<div class="alert alert-success">  
		<a class="close" data-dismiss="alert">×</a>  
 		<p>${alertMessage}</p> 
	</div> 
</g:if>

<g:each in="${pendingRushList}" status="i" var="pendingRush">
  <!--pending rush-->
  <div class="col-lg-3 col-sm-4">            
    <div class="list-background">
      <div class="banner">
        <p class="banner-title">${pendingRush?.user?.profile?.firstName} ${pendingRush?.user?.profile?.lastName}</p> 
      </div>
      <!--pending rush container-->
      <div class="list-container text-center">
		<!--pending rush approval/denial options-->    
      	<div class="list-options">
        	<a class="btn btn-default" href="javascript:populateApprovalModal('rush','${pendingRush.id}');"><i class="fa fa-check fa-2x"></i></a> 
            <a class="btn btn-default" href="javascript:populateDenyModal('rush','${pendingRush.id}');"><i class="fa fa-ban fa-2x"></i></a>               
        </div>        	
        <!--hover-mask-->
        <div class="hover-mask"> 
          <!--pending rush image-->          
			<g:link controller="userProfile" action="show" id="${pendingRush?.user?.profile?.id}">
				<g:if test="${pendingRush?.user?.profile?.profileImage}">
					<img src="${pendingRush?.user?.profile?.profileImageUrl}" class="img-thumbnail image-resize listing-logo" alt="profile image"/>
				</g:if>
				<g:else>
					<img src="${resource(dir: 'images/userprofile', file: 'fratrosterDefaultBrotherProfile.png')}" class="img-thumbnail image-resize listing-logo" alt="Fratroster default profile image"/>
				</g:else>
			</g:link>           
	       	<!--pending rush info-->
	        <div class="info text-left">  
	            <p class="listing-response"> 
                <i class="fa fa-book"></i>${pendingRush?.user?.profile?.description}
	        	    <i class="fa fa-graduation-cap"></i> <g:formatDate format="yyyy" date="${pendingRush?.user?.profile?.graduationYear}"/>
              </p>
          </div><!--/info-->
        </div><!--/hover-mask-->               
      </div><!--/list-container-->
    </div><!--/list-background-->                
  </div><!--pending rushes-->
</g:each>		