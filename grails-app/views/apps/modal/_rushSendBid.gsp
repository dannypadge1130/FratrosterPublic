<!-- Approve Pledge Modal -->
<div class="modal" id="approvePledgeModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
  <div class="modal-content">
    <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
      <h4 class="modal-title" id="approveModalBannerMessage">Approve Pledge</h4>
    </div>
    <g:if test="${fullName != null}">
		<div id="approveMessage" class="modal-body">
			<p>Are you sure you want to make ${fullName} a brother?</p>
		</div>
	</g:if>
    <div class="modal-footer">
      <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
		<g:if test="${pledgeId != null}">
      <g:remoteLink action="acceptPledge" id="${pledgeId}" onComplete="closeApprovePledgeModal();" update="pledgeContainer_refresh">
      	<span id="approveModal"><button class="btn btn-default">Approve</button></span>
      </g:remoteLink>
  	</g:if>                  
    </div>
  </div><!-- /.modal-content -->
</div><!-- /.modal-dialog -->
</div><!-- /.modal -->