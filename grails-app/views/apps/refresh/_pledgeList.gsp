<g:if test="${alertMessage}">
	<div class="alert alert-success">
		<a class="close" data-dismiss="alert">×</a>
		<p>
			${alertMessage}
		</p>
	</div>
</g:if>
<!--begin pledge listing-->
<g:each in="${pledgeList}" status="i" var="pledge">
<!--pledge-->
<div class="col-lg-3 col-md-4 col-sm-6">
  <div class="list-background">
    <div class="banner">
      <p class="banner-title">${pledge?.user?.profile?.firstName} ${pledge?.user?.profile?.lastName}</p> 
    </div>
    <!--pledge container-->
    <div class="list-container text-center">
    	<!--pledge approval/denial options-->    
      	<div class="list-options">
        	<g:remoteLink action="approvePledgeModalRefresh" onComplete="showApprovePledgeModal()" class="btn btn-default" id="${pledge?.id}" update="modalRefresh_send"> 
				<i class="fa fa-check fa-2x"></i>
			</g:remoteLink>
            <g:remoteLink action="denyPledgeModalRefresh" id="${pledge?.id}" update="modalRefresh_deny" onComplete="showDenyPledgeModal()" class="btn btn-default">
				<i class="fa fa-ban fa-2x"></i>
			</g:remoteLink>
        </div>
        <!--hover-mask-->
        <div class="hover-mask">
	        <!--pledge image-->        
			<div class="profile-photo">
				<g:link controller="userProfile" action="show" id="${pledge?.user?.profile?.id}">
					<g:if test="${pledge?.user?.profile?.profileImage}">
						<img class="img-thumbnail image-resize listing-logo pull-left"
							src="${pledge?.user?.profile?.profileImage.imageUrl}"
							alt="profile image" />
					</g:if>
					<g:else>									
						<!--Generic Profile Image-->
						<i class="fa fa-user fa-5x generic-user-image-sm listing-logo"></i>	
					</g:else>
				</g:link>
			</div>
	        <div class="info">	       
	        	<g:link controller="userProfile" action="show" id="${pledge?.user?.profile?.id}">
					<h4 class="listing-response">${pledge?.user?.profile?.firstName} ${pledge?.user?.profile?.lastName}</h4>
				</g:link>   
	        	<p class="listing-response"> 
	          		${pledge?.user?.profile?.description}
	          		${pledge?.user?.profile?.graduationYear}
	          	</p>
	        </div><!--/info-->                  
	    </div><!--/hover-mask-->
    </div><!--/list-container-->
  </div><!--/list-background-->              
</div><!--pledge-->
</g:each>   