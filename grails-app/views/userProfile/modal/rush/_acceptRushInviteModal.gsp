<!--Accept Rush Modal-->
<div class="modal" id="accept-rush-modal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">Accept Invitation?</h4>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-lg-12">
						<!--fraternity-profile-image-->
						<g:link action="show" controller="frat" id="${fratInstance?.id}">
							<img class="img-thumbnail profile-image rush-preview-image pull-left" src="${fratInstance?.image?.imageUrl}" />
						</g:link>
						<!--/fraternity-profile-image-->
						<!--fraternity-name-->
						<h3>
							<g:link action="show" controller="frat" id="${fratInstance?.id}">${fratInstance?.fratName}</g:link>
						</h3>
						<!--/fraternity-name-->
						<p>
							Are you sure you want to rush <g:link action="show" controller="frat" id="${fratInstance?.id}">${fratInstance?.fratName}</g:link>?
						</p>
					</div>
				</div>
			</div>
			<div class="modal-footer">				
				<g:form name="acceptRushInviteForm" action="acceptPendingRushInvite">
					<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
				    <input type="hidden" name="fratId" value="${fratInstance?.id}" />
				    <input type="submit" class="btn btn-primary" value="Accept Invitation">
				</g:form>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.Accept Rush Modal -->