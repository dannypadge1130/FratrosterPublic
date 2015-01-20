<%@ page import="com.fratroster.Frat"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>
	<g:message code="SITE_TITLE" args='["${fratInstance?.fratName} App Store"]' />
</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Add relevant apps, manage member access and get organized.">
<g:render template="/include/genericIncludes" />
<link href="${resource(dir: 'css/isotope', file: 'isotope.css')}" rel="stylesheet">
</head>
<body>
	<g:render template="/include/header" />
	<!--begin container-->
	<div class="container">
		<!--container title-->
		<div class="row">
			<div class="col-lg-12">
			<!--frat app filter-->	
				<div class="row">
					<div class="col-lg-12">              							
						<h3 class="text-center">Welcome to your fraternity's app store.</h3>
						<h5 class="text-center">Add relevant apps, manage member access and get organized.</h5>
						<ul class="nav nav-pills list-filters" id="list-item-categories">
							<li class="active"><a href="#" data-filter="*"><i class="fa fa-star"></i> All</a></li>
							<li><a href="#" data-filter=".active"><i class="fa fa-check"></i> Active</a></li>
							<li><a href="#" data-filter=".inactive"><i class="fa fa-ban"></i> Inactive</a></li>
						</ul>
					</div><!--/col-->				
				</div><!--/row-->
				<hr>
				<!--begin app listing-->
				<div id="posts">
					<g:each in="${customAppList}" status="i" var="app">
						<div class="post item col-lg-3 col-sm-4 <g:if test="${app?.active}">active</g:if>">
							<div class="list-background">
								<div class="banner">
									<p class="banner-title">${app?.name}</p>
								</div>
								<div class="app-container text-center">
									<div class="app-options">
										<g:link action="addApp" id="${app.appTypeId}">
											<button class="btn btn-default activate-app <g:if test="${app?.active}">btn-primary</g:if>">
												<i class="fa fa-check fa-2x"></i>
											</button>
										</g:link>
										<g:link action="removeApp" id="${app?.fratAppId}">
											<button class="btn btn-default deactivate-app <g:if test="${!app?.active}">btn-danger</g:if>">
												<i class="fa fa-ban fa-2x"></i>
											</button>
										</g:link>
										<g:link class="btn btn-default" action="appPermissions" id="${app?.fratAppId}"><i class="fa fa-cog fa-2x"></i></g:link>
									</div>
									<div class="hover-mask">
										<a href="#"><i class="${app?.image} app-large-icon"></i></a>
										<div class="info text-left">
											<p>${app?.desc}</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</g:each>
				</div><!--/app listing-->
			</div><!--/col-->
		</div><!-- /row -->
		<g:render template="/include/footer" />
	</div><!-- /container -->
	<!--Include Jquery Codes-->
	<g:render template="/include/javascript" />
	<!--Isotope JS Files-->
	<script type="text/javascript" src="${resource(dir: 'js/isotope', file: 'jquery.isotope.min.js')}"></script>
	<script>		
		$(function() {
			//Isotope Post Script
			//Create Posts as Variable 
			var $posts = $('#posts');
			$posts.imagesLoaded(function() {
				$posts.isotope({
					//Isotope Photo Selector
					itemSelector : '.item',
				});
			});
			//Fancybox/Isotope Code - Set's Gallery to Isotope's Filter Selection
			$('#list-item-categories a').on(
					"click",
					function() {
						var selector = $(this).attr('data-filter');
						$posts.isotope({
							filter : selector
						}, function() {
							if (selector == "*") {
								$(".fancybox").attr(
										"data-fancybox-group",
										"gallery");
							} else {
								$(selector).find(".fancybox")
										.attr("data-fancybox-group",
												selector);
							}
						});
						return false;
					});
			//Active Links         
			$('.list-filters li a').on('click', function() {
				$('.list-filters li').removeClass('active');
				$(this).parent().addClass('active');
			});
			//Activate App
			$('.activate-app').on('click', function() {
				$(this).toggleClass('btn-primary');
				$(this).parents('div:eq(3)').toggleClass('active');
			});
			//Deactivate App
			$('.deactivate-app').on('click', function() {
				$(this).toggleClass('btn-danger');
				$(this).parents('div:eq(3)').toggleClass('inactive');
			});
		});
	</script>
</body>
</html>
