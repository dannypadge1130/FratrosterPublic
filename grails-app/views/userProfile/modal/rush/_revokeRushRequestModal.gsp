<%@ page import="com.fratroster.Frat"%>

<div class="modal" id="cancel-rush-invitation-request-modal" tabindex="-1" 
role="dialog" aria-labelledby="cancelRushInvitationRequest" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="cancelRushInvitationRequest">Cancel Rush Invite Request?</h4>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-lg-12">
			            <g:link controller="frat" action="show" id="${fratInstance?.id}">
			            	<img class="img-thumbnail profile-image rush-preview-image pull-left" src="${fratInstance?.image?.imageUrl}"/>
			            </g:link>                                        
			            <h3>
			            	<g:link controller="frat" action="show" id="${fratInstance?.id}">${fratInstance?.fratName}</g:link>
			            </h3>  
						<p> 
							Are you sure you want to cancel you're rush request to <g:link controller="frat" action="show" id="${fratInstance?.id}">${fratInstance?.fratName}</g:link>?
						</p>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<g:formRemote name="deleteRushRequest" update="rush-invitations" 
					onComplete="globaljs.hideModal('#cancel-rush-invitation-request-modal')" url="[controller: 'userProfile', action: 'deletePendingRushRequest']" onFailure="globaljs.ajaxError();">
					<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
				    <input type="hidden" name="fratId" value="${fratInstance?.id}" />
				    <input type="submit" class="btn btn-primary" value="Revoke Request">
				</g:formRemote>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>