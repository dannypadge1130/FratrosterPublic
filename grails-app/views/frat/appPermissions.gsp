<!DOCTYPE html>
<html>
<head>
<title>Application Permissions - Landing</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!--DataTables CSS-->
<link rel="stylesheet" href="${resource(dir: 'css', file: 'datatables.css')}" media="screen">
<g:render template="/include/genericIncludes" />
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="../../assets/js/html5shiv.js"></script>
      <script src="../../assets/js/respond.min.js"></script>
    <![endif]-->
<style>
/*********************
    Center the app store pills
    **********************/
.nav-tabs>li,.nav-pills>li {
	float: none;
	display: inline-block;
	*display: inline; /* ie7 fix */
	zoom: 1; /* hasLayout ie7 trigger */
}

.nav-tabs,.nav-pills {
	text-align: center;
}
</style>
</head>
<body>
	<g:render template="/include/header" />
	<!--begin container-->
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<!--frat app filter-->
				<div class="text-center">
					<h3>${fratApp?.frat?.fratName} | ${fratApp?.getApp()?.appDetails?.appName}</h3>
					<ul class="nav nav-pills frat-apps" id="financeTabs">
						<li class="active"><a href="#home" data-toggle="tab"><i
								class="fa fa-user"></i> Brothers</a></li>
						<li><a href="#profile" data-toggle="tab"><i
								class="fa fa-briefcase"></i> Alumni</a></li>
					</ul>
					<label class="radio-inline"> <input type="radio"
						name="app-access" id="radio1" value="option1"> Private <i
						class="fa fa-question-circle" data-toggle="tooltip"
						title="Private to all fraternity members."></i>
					</label> <label class="radio-inline"> <input type="radio"
						name="app-access" id="radio2" checked="checked" value="option2">
						Public <i class="fa fa-question-circle" data-toggle="tooltip"
						title="Public to all fratroster members."></i>
					</label>

				</div>
				<hr>
				<div class="main">
					<div class="banner">
						<p class="banner-title">${fratApp?.frat?.fratName} Members</p>
					</div>
					<!-- Tab panes -->
					<div class="tab-content">
						<div class="tab-pane fade in active" id="home">
							<table cellpadding="0" cellspacing="0" border="0"
								class="datatable table table-hover">
								<thead>
									<tr>
										<th>Brother</th>
										<th>Name</th>
										<th>App Permisson</th>
									</tr>
								</thead>
								<tbody>
									<g:each in="${customMemberList}" status="i" var="brother">
										<tr>
											<td><img class="media-object img-thumbnail"
												src="https://fbcdn-profile-a.akamaihd.net/hprofile-ak-ash3/c10.10.160.160/944748_10153068222020221_691421709_a.jpg"></td>
											<td><a href="#">${brother?.name}</a></td>
											<td><label class="radio-inline"> <input
													<g:if test="${brother?.permission == 'N'}">checked="checked"</g:if>
													type="radio" name="radioGroup_${i}" id="radio1" value="option1">
													Hide <i class="fa fa-question-circle" data-toggle="tooltip"
													title="Private to all fraternity members."></i>
											</label> <label class="radio-inline"> <input type="radio"
													name="radioGroup_${i}" id="radio2" <g:if test="${brother?.permission == 'R'}">checked="checked"</g:if>
													value="option2"> View <i
													class="fa fa-question-circle" data-toggle="tooltip"
													title="Private to all fraternity members."></i>
											</label> <label class="radio-inline"> <input type="radio" 
													<g:if test="${brother?.permission == 'WR'}">checked="checked"</g:if>
													name="radioGroup_${i}" id="radio3" value="option3"> Edit
													<i class="fa fa-question-circle" data-toggle="tooltip"
													title="Private to all fraternity members."></i>
											</label></td>
										</tr>
									</g:each>
								</tbody>
							</table>
						</div>
						<div class="tab-pane fade" id="profile">
							<table cellpadding="0" cellspacing="0" border="0"
								class="datatable table table-hover">
								<thead>
									<tr>
										<th>Alumnus</th>
										<th>Name</th>
										<th>App Permisson</th>
									</tr>
								</thead>
								<tbody>
									<g:each in="${customAlumniList}" status="i" var="alumni">
										<tr>
											<td><img class="media-object img-thumbnail"
												src="https://fbcdn-profile-a.akamaihd.net/hprofile-ak-ash3/c10.10.160.160/944748_10153068222020221_691421709_a.jpg"></td>
											<td><a href="#">${alumni?.name}</a></td>
											<td><label class="radio-inline"> <input
													<g:if test="${alumni?.permission == 'N'}">checked="checked"</g:if>
													type="radio" name="radioGroup_${i}" id="radio1" value="option1">
													Hide <i class="fa fa-question-circle" data-toggle="tooltip"
													title="Private to all fraternity members."></i>
											</label> <label class="radio-inline"> <input type="radio"
													name="radioGroup_${i}" id="radio2" <g:if test="${alumni?.permission == 'R'}">checked="checked"</g:if>
													value="option2"> View <i
													class="fa fa-question-circle" data-toggle="tooltip"
													title="Private to all fraternity members."></i>
											</label> <label class="radio-inline"> <input type="radio" 
													<g:if test="${alumni?.permission == 'WR'}">checked="checked"</g:if>
													name="radioGroup_${i}" id="radio3" value="option3"> Edit
													<i class="fa fa-question-circle" data-toggle="tooltip"
													title="Private to all fraternity members."></i>
											</label></td>
										</tr>
									</g:each>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--Approve All Pledges Modal-->
		<!-- Modal -->
		<div class="modal" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title">Set permissions for all members.</h4>
					</div>
					<div class="modal-body">
						<!--Mass Approval Permissions-->
						<label class="radio-inline"> <input type="radio"
							name="massPermissionsBrother" id="radio1" value="option1">
							Hide
						</label> <label class="radio-inline"> <input type="radio"
							name="massPermissionsBrother" id="radio2" checked="checked"
							value="option2"> View
						</label> <label class="radio-inline"> <input type="radio"
							name="massPermissionsBrother" id="radio3" value="option3">
							Edit
						</label>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-default">Save</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->
		<g:render template="/include/footer" />
	</div>
	<g:render template="/include/javascript" />
	<!--DataTables JS-->
	<script
		src="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/jquery.dataTables.min.js"></script>
	<script src="${resource(dir: 'js', file: 'datatables.js')}"></script>
	<script type="text/javascript">
		$(function() {
			$('#financeTabs a').click(function(e) {
				e.preventDefault()
				$(this).tab('show')
			});
			//Datatables
			$('.datatable')
					.dataTable(
							{
								"sPaginationType" : "bs_full",
								//Only sort by Name   
								"aoColumnDefs" : [ {
									'bSortable' : false,
									'aTargets' : [ 0, 2 ]
								} ],
								//Set amount of pages to display
								"iDisplayLength" : 5,
								//Add in custom dom elements, including an edit all feature
								"sDom" : "<'row'<'col-sm-12'<'pull-left'f><'pull-left edit-all'>r<'clearfix'>>>t<'row'<'col-sm-12'<'pull-left'i><'pull-right'p><'clearfix'>>>",
							});
			$('.datatable').each(
					function() {
						var datatable = $(this);
						// SEARCH - Add the placeholder for Search and Turn this into in-line form control
						var search_input = datatable.closest(
								'.dataTables_wrapper').find(
								'div[id$=_filter] input');
						search_input.attr('placeholder', 'Search');
						search_input.addClass('form-control input-sm');
						// LENGTH - Inline-Form control
						var length_sel = datatable.closest(
								'.dataTables_wrapper').find(
								'div[id$=_length] select');
						length_sel.addClass('form-control input-sm');
					});
			//Create edit button and modal refrence (needs refactored)
			$(".edit-all").html("<a><i></i> Edit All</a>");
			$('.edit-all').find('a').addClass('btn btn-default');
			$('.edit-all').find('i').addClass('fa fa-edit fa');
			$('.edit-all').find('a').attr("href", "#myModal");
			$('.edit-all').find('a').attr("data-toggle", "modal");
			//initiate tooltips
			$("[data-toggle='tooltip']").tooltip();
		});
	</script>
</body>
</html>