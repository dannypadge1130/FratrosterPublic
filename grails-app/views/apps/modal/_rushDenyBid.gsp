<!-- Deny Pledge Modal -->
<div class="modal" id="denyRushBidModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
  <div class="modal-content">
    <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
      <h4 class="modal-title" id="denyRushBidModalBannerMessage">Reject Rush</h4>
    </div>
    <g:if test="${fullName != null}">
		<div id="denyMessage" class="modal-body">
			<p>Are you sure you want to reject ${fullName}?</p>
		</div>
	</g:if>
    <div class="modal-footer">
      <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
		<g:if test="${pledge?.id != null}">
      <g:remoteLink action="denyPledge" id="${pledge?.id}" onComplete="closeDenyPledgeModal();" update="pledgeContainer_refresh">
      	<span id="denyModal"><button class="btn btn-default">Deny</button></span>
      </g:remoteLink>
  	</g:if>                  
    </div>
  </div><!-- /.modal-content -->
</div><!-- /.modal-dialog -->
</div><!-- /.modal -->