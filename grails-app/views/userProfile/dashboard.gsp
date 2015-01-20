<!DOCTYPE html>
<html lang="en">
	<head>
    <meta charset="utf-8">
	<title><g:message code="default.list.label" args='["User Dashboard"]' /></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Fratroster's Brothers">
	<g:render template="/include/genericIncludes"/>
	</head>	
	<body>
    <g:render template="/include/header"/>	
  	<div class="container">	    
	    <div class="row">
	    	<div class="col-lg-12">                  
	    		<!--settings-callout-->
	      		<div class="text-center">
	        		<h3>Welcome to your dashboard. <i class="fa fa-cogs"></i></h3>
	            	<p class="help-block">Manage personal information, permissions and more.</p>
	        	</div>
	        	<!--/settings-callout-->	        	
		      	<div class="row">
		        	<div class="col-lg-12">           
		        		<!--settings-navigation-->
		           		<ul class="nav nav-tabs" id="dashboardTabs">
				     		<li class="active">
				     			<g:remoteLink action="myInformation" update="dashboardBody" data-toggle="tab"><i class="fa fa-cogs fw"></i> My Settings</g:remoteLink>
				     		</li> 
					     	<g:hasAFrat>
					     		<g:ifFratAdmin fratid="${fratId}">
					     			<li><a href="#admin" data-toggle="tab">Administration</a></li>
					     		</g:ifFratAdmin>
					     	</g:hasAFrat>
					     </ul>                   
					     <!--/settings-navigation--> 
			        </div>
			        <!--/col-->
		      	</div>
		      	<!--/row-->              
		      	<!--tab-content-->
		      	<div class="tab-content">		        	
		      		<!--my-settings-->
		        	<div class="tab-pane fade in active" id="dashboardBody">
		       			<div class="row tab-information">
		  					<div class="col-lg-12">
		        				<g:render template="/userProfile/dashboardMyInformation"/>
		        			</div>
		        		</div>
		        	</div>
		        	<!--/my-settings-->
		      	</div>
		      	<!--/tab-content-->       
	        </div>
	        <!--/col-12-->
	    </div>
	    <!--/row-->   
	    <g:render template="/include/footer"/>
	</div>
		<g:render template="/include/javascript"/>
	</body>
</html>