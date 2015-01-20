<%@ page import="com.fratroster.Frat"%>
<%@ page import="com.fratroster.College"%>
<%@ page import="com.fratroster.user.User"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>fratroster - ${college.collegeName}</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="${college.collegeName} fraternities.">
<g:render template="/include/genericIncludes" />
<style>
    .info {
      height: 110px;
      padding-bottom: 11px;
      border: 0;
      border-bottom: 1px solid #eeeeee;
    }
</style>
</head>
<body>
	<g:render template="/include/header" />
	<!--begin container-->
	<div class="container">
		<div class="row main-container">
			<div class="col-lg-12">
				<!--container title-->
				<div class="row main-container">
					<div class="col-lg-12">
						<!--College Section-->
						<div class="text-center">
						<!--College Image-->
							<img class="img-thumbnail profile-image" src="${college?.image?.imageUrl}" alt="icon for ${college?.collegeName}"/>
							<!--College Name-->
							<h3>${college?.collegeName} |
							<!--College Social Links-->
							<g:render template="/include/socialNetworkBookmarks" bean="${college?.socialNetworkInfo}" />
							</h3>           
		             		<!--College Motto-->    
		             		<p><em>${college?.shortDescription}</em></p>                      
		         		</div>
		       		</div> 
		   		</div> 				
				<!--College Tabs-->
				<div class="row">
					<div class="col-lg-12">
						<ul class="nav nav-tabs">
							<li class="active">
								<a href="#college-fraternities" data-toggle="tab"><i class="fa fa-beer fa"></i> Fraternities</a>
							</li>							
							<li>
								<a href="#college-rushes" data-toggle="tab"><i class="fa fa-bullseye fa"></i> Rushes</a>
							</li>
						</ul>
					</div>
				</div><!--/College Tabs-->				
				<div class="tab-content">
					<!--Fraternity List Tab-->
					<div class="tab-pane fade in active" id="college-fraternities">
						<g:render template="/frat/template/fratTab"/>
					</div><!--/Fraternity List Tab-->
					<!--Rush Tab-->
					<div class="tab-pane fade" id="college-rushes">
						<g:render template="/frat/template/rushTab"/>
					</div><!--/Rush List Tab-->					
				</div><!--/tab-content-->
				<div id="rushCard">
					<g:render template="/frat/modal/rush/rushCardModal"/>
				</div>
				<div id="inviteRush">
					<g:render template="/frat/modal/rush/addToRushListModal"/>
				</div>
				<div id="revokeRushInvite">
					<g:render template="/frat/modal/rush/revokeRushInviteModal"/>
				</div>
				<div id="rushFrat">
					<g:render template="/frat/modal/rush/rushFratModal"/>
				</div>
			</div><!--col-->
		</div><!-- /row -->
		<g:render template="/include/footer" />
	</div>
	<!-- /container -->
	<g:render template="/include/javascript" />
	<script>
  $(function () {
    //initiate tooltips
    $("[data-toggle='tooltip']").tooltip();   

	/*function testDiv() {
		  if ($( '#rush-preview-modal' ).length && $( '#rush-preview-modal' ).hasClass('modal', 'in')){
		        $('body').append('<div id="test-background"></div>');
		    }  

		    //outside of function check if preview has both classes, and if not alert or remove ,etc. 
		}

    $( ".preview-rush" ).on( "click", testDiv );*/


    
  });
  </script>
  
  <script>
  	var rushList = {
	  	nextRush:function(index) {
	  		var populateId = document.getElementById("nextRush_"+index).value;
	  		var totalCount = document.getElementById("totalRushCount").value;
	  		if(index === totalCount-1) {
				index = 0;
		  	} else {
				index = index + 1;
			}
	  		params:'\'oneParameter=\'+jsOneParameter+\'&anotherParameter=\'+jsSecondParameter'
	    	${ remoteFunction (action:"renderRushCard", update:"rushCard", params:'\'populateId=\'+populateId+\'&rushIndex=\'+index', /*before:"rushList.hideRushCard()",*/ onComplete:"rushList.displayRushCard();") }	
	    		//Hide modal-backdrop on next rush		
				$('.modal-backdrop').remove();	   
	    },
	   	previousRush:function(index) {
	    	var populateId = document.getElementById("previousRush_"+index).value;
	    	var totalCount = document.getElementById("totalRushCount").value;
	  		if(index === 0) {
				index = totalCount-1;
		  	} else {
				index = index - 1;
			}
	    	${ remoteFunction (action:"renderRushCard", update:"rushCard", params:'\'populateId=\'+populateId+\'&rushIndex=\'+index', /*before:"rushList.hideRushCard()",*/ onComplete:"rushList.displayRushCard();") }	
	    		//Hide modal-backdrop on previous rush		
				$('.modal-backdrop').remove();
	    },
	    displayRushCard:function() {
	    	$('#rush-preview-modal').modal('show');	    
		}
    };
  </script>
</body>
</html>
