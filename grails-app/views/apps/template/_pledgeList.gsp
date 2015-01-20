<div class="row main-container">
	<div class="col-lg-12">
		<div id="pledgeContainer_refresh">
			<g:render template="/apps/refresh/pledgeList" />
		</div>
	</div>
	<!--col-->
</div>
<!-- /row -->
<div id="modalRefresh_send">
	<g:render template="/apps/modal/pledgeSendBid" />
</div>
<div id="modalRefresh_deny">
	<g:render template="/apps/modal/pledgeDenyBid" />
</div>

<script type="text/javascript"> 
  function showApprovePledgeModal() {
      $('#approvePledgeModal').modal('show');
   }
  function closeApprovePledgeModal() {
      $('#approvePledgeModal').modal('hide');
   }
  function showDenyPledgeModal() {
      $('#denyPledgeModal').modal('show');
   }   
  function closeDenyPledgeModal() {
      $('#denyPledgeModal').modal('hide');
  } 
</script>