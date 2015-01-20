<%@ page import="com.fratroster.user.User"%>

<!--Revoke Rush Invitation Modal-->
<div class="modal" id="revoke-rush-invitation-modal" tabindex="-1"
	role="dialog" aria-labelledby="revokeRushInvite" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="revokeRushInvite">Revoke Invitation?</h4>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-lg-12">
			            <g:link controller="userProfile" action="show" id="${rushInstance?.id}">
			            	<img class="img-thumbnail image-resize listing-logo pull-left" src="${rushInstance?.profile?.profileImage?.imageUrl}"/>
			            </g:link>                                        
			            <h3>
			            	<g:link controller="userProfile" action="show" id="${rushInstance?.id}">${rushInstance?.profile?.getFullName()}</g:link>
			            </h3>  
						<g:formRemote name="deletePendingRush" update="college-rushes" url="[controller: 'frat', action:'deletePendingRush']" onComplete="\$('#revoke-rush-invitation-modal').modal('hide');">
							<p> Are you sure you want to revoke <g:link controller="userProfile" action="show" id="${rushInstance?.id}">${rushInstance?.profile?.getFullName()}</g:link>'s
								invitation to rush 				 
								<g:if test="${availableFrats?.size() > 1}">
			            			<select name="fratId">
					            		<g:each in="${availableFrats}" var="currFrat">
											<option value="${currFrat?.id}">${currFrat?.fratName}</option>
					            		</g:each>
		            				</select>
		            			</g:if>
					            <g:else>
					            	${availableFrats?.get(0)?.fratName}
					            	<input type="hidden" name="fratId" value="${availableFrats?.get(0)?.id}"/>
					            </g:else>?
							</p>													
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
				<input type="hidden" name="id" value="${rushInstance?.id}"/>
				<g:submitButton class="btn btn-danger" name="revoke-invite" value="Revoke Invitation"/> 				
			</div>
			</g:formRemote>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.Revoke Rush Invitation Modal -->