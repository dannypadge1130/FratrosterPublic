<!--Confirm Bid Modal-->
<div class="modal" id="confirm-bid-modal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">Confirm Bid?</h4>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-lg-12">
						<div class="text-center">
							<g:link controller="frat" action="show" id="${fratInstance?.id}">
			            		<img class="img-thumbnail image-resize listing-logo pull-left" src="${fratInstance?.image?.imageUrl}"/>
			            	</g:link> 
							<h3>
								<g:link controller="frat" action="show" id="${fratInstance?.id}">${fratInstance?.fratName}</g:link>
							</h3>
							<p>
								Are you sure you want to confirm your bid from <g:link controller="frat" action="show" id="${fratInstance?.id}">${fratInstance?.fratName}</g:link>?
							</p>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
				<g:form name="acceptBidForm" action="acceptPledgeBid">
				    <input type="hidden" name="fratId" value="${fratInstance?.id}" />
				    <input type="submit" class="btn btn-primary" value="Confirm Bid">
				</g:form>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.Confirm Bid Modal -->