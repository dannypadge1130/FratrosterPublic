<div class="modal" id="commentModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
    	<div class="modal-content">
       		<div class="modal-header">
         		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
         		<h4 class="modal-title">${rush?.user?.profile?.getFullName()}</h4>
       		</div>
       		<div class="modal-body">
         		<div class="pull-left">
	          		<g:link controller="userProfile" action="show" id="${rush?.user?.profile?.id}">
			            <g:if test="${rush?.user?.profile?.profileImage}">
			              <img class="img-thumbnail image-resize pull-left listing-logo" src="${rush?.user?.profile?.profileImage.imageUrl}" alt="profile image"/>
			            </g:if>
			            <g:else>
			              <img class="img-thumbnail image-resize pull-left listing-logo" src="${resource(dir: 'images/userprofile', file: 'fratrosterDefaultBrotherProfile.png')}" alt="Fratroster default profile image"/>
			            </g:else>
	          		</g:link>
           		</div>
         		<h2 class="listing-title">
         			<g:link controller="userProfile" action="show" id="${rush?.user?.profile?.id}">${rush?.user?.profile?.getFullName()}</g:link>
         		</h2>     
           		<ul class="list-inline">
	              	<li><a href="#"><i class="fa fa-thumbs-o-up fa-lg"></i></a> ${rush?.getLikeCount()}</li>
					<li><a href="#"><i class="fa fa-thumbs-o-down fa-lg"></i></a> ${rush?.getDislikeCount()}</li>
	              	<li><a href="#" id="comment-focus"><i class="fa fa-comment-o fa-lg"></i></a> ${rush?.comments?.size()}</li>
           		</ul>                       
           		<p class="listing-response"><span class="highlight">Rushing:</span> <a href="#">TKE</a>, <a href="#">Pan</a></p>                  
           		<p class="listing-response"><span class="highlight">Grad Year:</span> 2011</p>                    
         		<div class="clear"></div>
  				<hr>
         		<ul class="media-list">
	           		<!-- Comments -->
	           		<g:each in="${rush?.getOrderedCommentList()}" status="i" var="comment">
			        	<li class="media">
			             	<g:link controller="userProfile" action="show" class="pull-left" id="${comment?.author?.profile?.id}">
					            <g:if test="${comment?.author?.profile?.profileImage}">
					              <img class="media-object img-thumbnail" src="${comment?.author?.profile?.profileImage.imageUrl}" alt="profile image"/>
					            </g:if>
					            <g:else>
					              <img class="media-object img-thumbnail" src="${resource(dir: 'images/userprofile', file: 'fratrosterDefaultBrotherProfile.png')}" alt="Fratroster default profile image"/>
					            </g:else>
		          			</g:link>
		             		<div class="media-body">
		               			<g:link controller="userProfile" action="show" id="${comment?.author?.profile?.id}"><h4 class="media-heading">${comment?.author?.profile?.getFullName()}</h4></g:link>
		               			<p>${comment?.message}</p>
		               			<hr>
		             		</div>
		             	</li>
		             </g:each>             
         		</ul>         		
	         	<!--Your Comment-->
	         	<ul class="media-list">
	           		<li class="media">
	           			<g:link controller="userProfile" action="show" class="pull-left" id="${currentUser?.profile?.id}">
				            <g:if test="${currentUser?.profile?.profileImage}">
				              <img class="media-object img-thumbnail" src="${currentUser?.profile?.profileImage.imageUrl}" alt="profile image"/>
				            </g:if>
				            <g:else>
				              <img class="media-object img-thumbnail" src="${resource(dir: 'images/userprofile', file: 'fratrosterDefaultBrotherProfile.png')}" alt="Fratroster default profile image"/>
				            </g:else>
	          			</g:link>
	             		<div class="media-body">
	               			<g:link controller="userProfile" action="show" id="${currentUser?.profile?.id}"><h4 class="media-heading">${currentUser?.profile?.getFullName()}</h4></g:link>                      
	               			<g:form action="submitRushComment" name="rushCommentForm" class="form-horizontal" role="form">
	                 			<div class="form-group">                          
	                   				<div class="col-lg-12">
	                     				<textarea type="text" name="rushComment" class="form-control message" id="rush-comment" maxlength="140" placeholder="Your Comment"></textarea>
	                   				</div>
	                 			</div>
	                 			<input type="hidden" name="authorId" value="${currentUser?.id}" />
	                 			<input type="hidden" name="rushId" value="${rush?.id}" />
	                 			<input type="hidden" name="appId" value="${appId}" />
	               			</g:form>
	               			<button type="button" class="btn btn-default" onclick="globaljs.submitForm(document.forms['rushCommentForm'])"><i class="fa fa-pencil fa"></i> Comment</button>
          					<p class="pull-right" id="counter"></p>
	             		</div>
	           		</li>
	         	</ul>                
       		</div>
    	</div>
	</div>
</div>       