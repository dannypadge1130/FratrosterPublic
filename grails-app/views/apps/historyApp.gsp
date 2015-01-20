<!DOCTYPE html>
<html lang="en">
	<head>	
    <meta charset="utf-8">
	<title><g:message code="SITE_TITLE" args='["History"]'/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Fratroster's Brothers">
	 <g:render template="/include/genericIncludes"/>
	</head>
<body>
  <g:render template="/include/header"/>
  	<!--Begin History Container-->
	<div class="container">
    <div class="row main-container">
      <div class="col-lg-12">
        <div class="text-center">
          <h3>${historyAppInstance?.fratapp?.frat?.fratName} History</h3>            
        </div>        
        <hr>
        <div class="col-lg-6">
          <div class="main">
            <div class="banner">
              <p class="banner-title">${historyAppInstance?.fratapp?.frat?.fratName} Founding</p> 
            </div>                
    		    <p>${historyAppInstance?.description}</p>
            <p>${historyAppInstance?.description}</p>
            <p>${historyAppInstance?.description}</p>
            <p>${historyAppInstance?.description}</p>
            <p>Lorem ipsum dolor sit amet, sea quando homero admodum id, mea eros audire et. At nam modus debitis, mea possim scripta temporibus ei. Pro porro civibus et, erant labitur officiis sed te. Falli urbanitas voluptatibus vim te, vis debitis vocibus.</p>                 
          </div>                          
        </div>
        <div class="col-lg-6">
          <div class="main">
            <div class="banner">
              <p class="banner-title">${historyAppInstance?.fratapp?.frat?.fratName} Beginning</p> 
            </div>                
            <p>${historyAppInstance?.description}</p>       
          </div>                          
          <div class="main">
            <div class="banner">
              <p class="banner-title">${historyAppInstance?.fratapp?.frat?.fratName} Middle</p> 
            </div>                
            <p>${historyAppInstance?.description}</p>       
          </div> 
          <div class="main">
            <div class="banner">
              <p class="banner-title">${historyAppInstance?.fratapp?.frat?.fratName} End</p> 
            </div>                
            <p>${historyAppInstance?.description}</p>       
          </div>                                    
        </div><!--/col-->
      </div><!--/col-->
    </div><!--/main-container-->
      <g:render template="/include/footer"/>
	</div> <!-- /container -->
	<g:render template="/include/javascript"/>
</body>
</html>