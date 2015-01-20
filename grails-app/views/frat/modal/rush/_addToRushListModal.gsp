<%@ page import="com.fratroster.user.User"%>

<!--Add Rush Modal-->
<div class="modal" id="add-rush-modal" tabindex="-1" role="dialog" aria-labelledby="addToRushList" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="addToRushList">Add rush?</h4>
      </div>
      <g:formRemote name="addToRushListForm" update="college-rushes" url="[controller: 'frat', action:'saveToRushList']" onComplete="\$('#add-rush-modal').modal('hide');">
	      <div class="modal-body">
	        <div class="row">
	          <div class="col-lg-12">   
	              <!--rush-profile-image-->
	              <g:link controller="userProfile" action="show" id="${rushInstance?.id}">
	                <img class="img-thumbnail profile-image rush-preview-image pull-left" src="${rushInstance?.profile?.profileImage?.imageUrl}"/>
	              </g:link>
	              <!--/rush-profile-image-->
	              <!--rush-name-->
	              <h3>
	                <g:link controller="userProfile" action="show" id="${rushInstance?.id}">${rushInstance?.profile?.getFullName()}</g:link>
	              </h3> 
	              <!--/rush-name-->
	                <p>Are you sure you want to add <g:link controller="userProfile" action="show" id="${rushInstance?.id}">${rushInstance?.profile?.getFullName()}</g:link> as a rush?</p>
	                <g:if test="${availableFrats?.size() > 1}">
	                  <select name="fratId" class="fraternity-select">
	                    <g:each in="${availableFrats}" var="currFrat">
	                      <option value="${currFrat?.id}">${currFrat?.fratName}</option>
	                    </g:each>
	                  </select>
	                </g:if>
	                <g:else>                  
	                  <input type="hidden" name="fratId" value="${availableFrats?.get(0)?.id}"/>
	                </g:else>
	          </div>
	        </div>
	      </div>
	      <div class="modal-footer">                  
	        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
	          <input type="hidden" name="id" value="${rushInstance?.id}"/>
	            <g:submitButton class="btn btn-primary" name="add-rush" value="Add Rush"/> 
	      </div>
      </g:formRemote>  
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.Add Rush Modal --> 