<div class="row main-container">
	<div class="col-lg-12">
		<!--Pending Alumni / Brothers / Rushes Tab Listing-->		
			<div id="pendingBrothers" class="tab-pane fade in active">
				<g:render template="/apps/pendingusers/pendingMemberList" />
			</div>
			<div id="pendingAlumni" class="tab-pane fade">
				<g:render template="/apps/pendingusers/pendingAlumniList" />
			</div>
			<div id="pendingRushes" class="tab-pane fade">
				<g:render template="/apps/pendingusers/pendingRushList" />
			</div>		
	</div>
	<!--/col-->
</div>

<!--Approve Pending Alumni Modal-->
<div id="approveAlumniModal" class="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="approveModalBannerMessage"></h4>
			</div>
			<div id="approveMessage" class="modal-body"></div>
			<div class="modal-footer">
				<button class="btn btn-danger" data-dismiss="modal" aria-hidden="true">Cancel</button>
				<span id="approveModal"><button class="btn btn-default">Approve</button></span>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>

<!--Deny Pending Alumni Modal-->
<div id="denyAlumniModal" class="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h4 class="modal-title" id="denyModalBannerMessage"></h4>
			</div>
			<div id="denyMessage" class="modal-body"></div>
			<div class="modal-footer">
				<button class="btn btn-danger" data-dismiss="modal" aria-hidden="true">Cancel</button>
				<span id="denyModal"><button class="btn btn-default">Deny</button></span>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
    
<script type="text/javascript"> 
	function populateApprovalModal(userType, userId){
		jQuery.ajax({
		    url: "/fratRoster/apps/getApprovalModalJSON",
		    type: "GET",
		    data: {type: userType, userid: userId},
		    dataType: "json",
		    beforeSend: function(x) {
		    	if (x && x.overrideMimeType) {
		    		x.overrideMimeType("application/j-son;charset=UTF-8");
		      	}
		    },
		    success: function(result) {
				var actionLink = result.content.actionLink;
				actionLink = actionLink.replace(/"/g, '\\\"');
				document.getElementById('approveModalBannerMessage').innerHTML = result.content.bannerMessage;
				document.getElementById('approveMessage').innerHTML = result.content.approvalMessage;
				document.getElementById('approveModal').innerHTML = '<button class="btn btn-default" onclick="'+actionLink+' $(\'#approveAlumniModal\').modal(\'hide\');">Approve</button>';
				$('#approveAlumniModal').modal('show');
			}
		});
	}

	function populateDenyModal(userType, userId){
		jQuery.ajax({
		    url: "/fratRoster/apps/getDenyModalJSON",
		    type: "GET",
		    data: {type: userType, userid: userId},
		    dataType: "json",
		    beforeSend: function(x) {
		    	if (x && x.overrideMimeType) {
		    		x.overrideMimeType("application/j-son;charset=UTF-8");
		      	}
		    },
		    success: function(result) {
				var actionLink = result.content.actionLink;
				actionLink = actionLink.replace(/"/g, '\\\"');
				document.getElementById('denyModalBannerMessage').innerHTML = result.content.bannerMessage;
				document.getElementById('denyMessage').innerHTML = result.content.approvalMessage;
				document.getElementById('denyModal').innerHTML = '<button class="btn btn-default" onclick="'+actionLink+' $(\'#denyAlumniModal\').modal(\'hide\');">Deny</button>';
				$('#denyAlumniModal').modal('show');
			}
		});
	}
</script>