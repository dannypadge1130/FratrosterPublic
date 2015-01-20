<div class="row">
	<div class="col-lg-12">
		<div id="rushContainer_refresh">
			<g:render template="/apps/refresh/rushList" />
		</div>
		<div id="commentRefreshArea">
			<g:render template="/apps/rushCommentModal" />
		</div>
	</div>
	<!--/col-->
</div>

<div id="modalRefresh_send">
	<g:render template="/apps/modal/rushSendBid" />
</div>
<div id="modalRefresh_deny">
	<g:render template="/apps/modal/rushDenyBid" />
</div>

<script type="text/javascript">
	function updateCount(forCount, againstCount, rushId) {
		document.getElementById('upCount1_' + rushId).innerHTML = forCount;
		document.getElementById('upCount2_' + rushId).innerHTML = forCount;
		document.getElementById('downCount1_' + rushId).innerHTML = againstCount;
		document.getElementById('downCount2_' + rushId).innerHTML = againstCount;
		document.getElementById('voteForCount_' + rushId).value = forCount;
		document.getElementById('voteAgainstCount_' + rushId).value = againstCount;
	}

	function voteCast(votedFor, rushId) {
		$('#voted_' + rushId).hide();
		$('#removeVote_' + rushId).show();
		var forCount = parseInt(document.getElementById('voteForCount_'
				+ rushId).value);
		var againstCount = parseInt(document
				.getElementById('voteAgainstCount_' + rushId).value);
		if (votedFor) {
			updateCount(forCount + 1, againstCount, rushId);
			document.getElementById('vote_' + rushId).value = "true";
		} else {
			updateCount(forCount, againstCount + 1, rushId);
			document.getElementById('vote_' + rushId).value = "false";
		}
	}

	function removeVote(rushId) {
		$('#removeVote_' + rushId).hide();
		$('#voted_' + rushId).show();
		var votedFor = document.getElementById('vote_' + rushId).value;
		var forCount = parseInt(document.getElementById('voteForCount_'
				+ rushId).value);
		var againstCount = parseInt(document
				.getElementById('voteAgainstCount_' + rushId).value);
		if (votedFor == 'true') {
			updateCount(forCount - 1, againstCount, rushId);
		} else {
			updateCount(forCount, againstCount - 1, rushId);
		}
	}

	//Show Comment Modal 
	function showCommentModal() {
		//Show Comment Modal
		$('#commentModal').modal('show');
		//Simply Countable JS
		$('#rush-comment').simplyCountable({
			counter : '#counter',
			countType : 'characters',
			maxCount : 140,
			strictMax : true,
			safeClass : 'safe'
		});
		//Comment Focus 
		$('#comment-focus').on('click', function() {
			$('#rush-comment').focus();
		});
	}

	function showApproveRushModal() {
		$('#approveRushModal').modal('show');
	}
	function showDenyRushModal() {
		$('#denyRushModal').modal('show');
	}
	function closeApproveRushModal() {
		$('#approveRushModal').modal('hide');
	}
	function closeDenyRushModal() {
		$('#denyRushModal').modal('hide');
	}
</script>