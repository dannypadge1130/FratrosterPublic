<!--Stop Rushing Modal-->
<div class="modal" id="stop-rushing-modal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">Stop Rushing?</h4>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-lg-12">
						<!--fraternity-profile-image-->
			            <g:link controller="frat" action="show" id="${fratInstance?.id}">
			            	<img class="img-thumbnail profile-image rush-preview-image pull-left" src="${fratInstance?.image?.imageUrl}"/>
			            </g:link>                      
			            <!--/fraternity-profile-image-->                  
			            <!--fraternity-name-->
			            <h3>
			            	<g:link controller="frat" action="show" id="${fratInstance?.id}">${fratInstance?.fratName}</g:link>
			            </h3>
			            <!--/fraternity-name-->
						<p>
							Are you sure you want to stop rushing <g:link controller="frat" action="show" id="${fratInstance?.id}">${fratInstance?.fratName}</g:link>?
						</p>
					</div>
				</div>
			</div>
			<div class="modal-footer">				
				<g:form name="stopRushingFratForm" controller="userProfile" action="stopRushingFrat">
					<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
				    <input type="hidden" name="fratId" value="${fratInstance?.id}" />
				    <input type="submit" class="btn btn-primary" value="Stop Rushing">
				</g:form>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.Stop Rushing Modal -->