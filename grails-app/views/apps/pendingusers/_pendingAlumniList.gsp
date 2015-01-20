<g:if test="${alertMessage}">
	<div class="alert alert-success">  
		<a class="close" data-dismiss="alert">×</a>  
 		<p>${alertMessage}</p> 
	</div> 
</g:if>

<g:each in="${pendingAlumniList}" status="i" var="pendingAlumni"> 
  <!--pending alumnus-->
  <div class="col-lg-3 col-sm-4">            
    <div class="list-background">
      <div class="banner">
        <p class="banner-title">${pendingAlumni?.firstName} ${pendingAlumni?.lastName}</p> 
      </div>
      <!--pending alumnus container-->
      <div class="list-container text-center">                                                      
          <!--pending alumnus approval/denial options-->                                              
            <div class="list-options">
              <a class="btn btn-default" href="javascript:populateApprovalModal('alumni','${pendingAlumni.id}');"><i class="fa fa-check fa-2x"></i></a> 
              <a class="btn btn-default" href="javascript:populateDenyModal('alumni','${pendingAlumni.id}');"><i class="fa fa-ban fa-2x"></i></a>               
            </div>             
            <!--hover-mask-->
            <div class="hover-mask">
              <!--pending alumnus image-->
              <g:if test="${pendingAlumni?.profileImage}">
                <img src="${pendingAlumni?.profileImageUrl}" class="img-thumbnail image-resize listing-logo" alt="profile image"/>
              </g:if>
              <g:else>
                <img src="${resource(dir: 'images/userprofile', file: 'fratrosterDefaultBrotherProfile.png')}" class="img-thumbnail image-resize listing-logo" alt="Fratroster default profile image"/>
              </g:else>             
              <!--pending alumnus info-->
              <div class="info text-left">  
                <p class="listing-response"><span class="highlight"><g:message code="PROFESSION"/></span> <span>${pendingAlumni?.profession}</span></p>
             	<p class="listing-response"><span class="highlight"><g:message code="GRAD_YEAR"/></span> <g:formatDate format="yyyy" date="${pendingMember?.user?.profile?.graduationYear}"/></p>
          	 </div><!--/pending alumnus info-->     
            </div><!--/hover-mask-->            
        </div><!--/list-container-->
    </div><!--/list-background-->                
  </div><!--pending alumnus-->
</g:each>