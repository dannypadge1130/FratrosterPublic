<%@ page import="com.fratroster.Frat"%>

<div class="modal" id="rush-frat-modal" tabindex="-1" role="dialog" aria-labelledby="rushFratModal" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="addToRushListModal">Rush ${fratInstance?.fratName}?</h4>
      </div>
      <g:formRemote name="rushFratForm" update="college-fraternities" url="[controller: 'frat', action:'rushFrat']" onComplete="\$('#rush-frat-modal').modal('hide');">
	      <div class="modal-body">
	        <div class="row">
	          <div class="col-lg-12">   
	              <!--rush-profile-image-->
	              <g:link controller="frat" action="show" id="${fratInstance?.id}">
	                <img class="img-thumbnail profile-image rush-preview-image pull-left" src="${fratInstance?.image?.imageUrl}"/>
	              </g:link>
	              <h3>
	                <g:link controller="frat" action="show" id="${fratInstance?.id}">${fratInstance?.fratName}</g:link>
	              </h3> 
	                <p>Are you sure you want to rush <g:link controller="frat" action="show" id="${fratInstance?.id}">${fratInstance?.fratName}</g:link>?</p>          
	                <input type="hidden" name="fratId" value="${fratInstance?.id}"/>
	          </div>
	        </div>
	      </div>
	      <div class="modal-footer">                  
	        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
	        <g:submitButton class="btn btn-primary" name="rush-frat" value="Rush Frat"/> 
	      </div>
      </g:formRemote>  
    </div>
  </div>
</div>