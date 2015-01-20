<%@ page import="com.fratroster.user.User" %> <!--THIS CAN BE REMOVED AND PUT IN GLOBAL INCLUDE ONCE HEADER IS MOVED TO GENERIC INCLUDES-->
<!DOCTYPE html>
<html lang="en">
	<head>	
    <meta charset="utf-8">
	<title><g:message code="SITE_TITLE" args='["About fratroster"]'/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Fratroster's Brothers">
	<!--Bootstrap3 Styles-->
    <link href="${resource(dir: 'css/bootstrap3', file: 'bootstrap.min.css')}" rel="stylesheet" type="text/css">
    <!--Bootstrap3 New Style.css-->
    <link href="${resource(dir: 'css/bootstrap3', file: 'newBS3Style.css')}" rel="stylesheet">
    <!--Font Awesome Styles-->
    <link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.0/css/font-awesome.min.css" rel="stylesheet">
	</head>
<body>
    <!--fratroster header-->
    <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <g:link controller="userProfile" action="index" class="navbar-brand">fratroster</g:link>
          <sec:ifLoggedIn>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">          
            <li><g:link controller="frat"><i class="fa fa-bookmark fa-2x"></i></g:link></li>
            <li><g:link controller="userProfile"><i class="fa fa-user fa-2x"></i></g:link></li>
            <g:hasAFrat>
              <li><button class="btn btn-default dropdown-toggle" data-toggle="dropdown"><span class="fa fa-asterisk fa-2x"></span></button>
              <ul class="dropdown-menu">
              <g:set var="user" value="${User.findByUsername(sec.loggedInUserInfo(field:'username'))}"/>
              <g:each in="${user?.fratMembers}" status="i" var="fratMember">
                <li><g:link controller="frat" action="usersFratLanding" params='[fratid:"${fratMember?.frat?.id}"]'>${fratMember?.frat?.fratName}</g:link></li>
              </g:each>
              </ul></li>
            </g:hasAFrat>
            <g:doesntHaveAFrat>
              <li><g:link controller="frat" action="list"><g:message code="USER_FINDFRAT_LINK"/></g:link></li>
            </g:doesntHaveAFrat>
            <li><g:link controller="userProfile" action="dashboard" id="${userProfileInstance?.id}"><i class="fa fa-cog fa-2x"></i></g:link>
            <li><g:link controller="logout"><i class="fa fa-sign-out fa-2x"></i></g:link></li>
          </ul>
        </div><!--/.nav-collapse -->
        </sec:ifLoggedIn>
      </div>
    </div>
  </div>
  	<!--Begin History Container-->
	<div class="container">
      <div class="row main">
        <div class="banner">
          <p class="banner-title">About fratroster</p> 
        </div>                
	  	<p>Fratroster is an exclusive social networking site built by fraternity members, for fraternity members looking to connect with prospective rushes, network with alumni, and grow their fraternity's presence on campus. As fraternity brothers, we know how difficult it is to reach committed rushes, reconnect with old alumni, and manage your growing fraternity. Don't worry though; Fratroster does all the heavy lifting for you. We give you visibility into comitted rushes, apps to consolidate your fraternity's operations, ways to connect with alumni and a whole lot more. Find out more below, or <g:link controller="signup">Sign Up  now!</g:link></p>
      </div>                          
	<!--fratroster footer-->
    <footer>
      <div class="row">
        <div class="col-lg-2 col-sm-3">
          <dl>            
            <dd>What is fratroster?</dd>
            <dd><g:link controller="about">About fratroster</g:link></dd>
            <dd><a href="#">Terms of Use</a></dd>
            <dd><a href="#">Privacy Policy</a></dd>
            </dl>
        </div>
        <div class="col-lg-2 col-sm-3">
          <dl>
            <dd>Need Help?</dd>
            <dd><a href="#">FAQ</a></dd>
            </dl>
        </div>
        <div class="col-lg-2 col-sm-3">
          <dl>
            <dd>More</dd>
            <dd><a href="#">College Affiliates</a></dd>
            <dd><a href="#">On Campus Events</a></dd>
            <dd><a href="#">fratroster Blog</a></dd>
          </dl>
        </div>
        <div class="col-lg-2 col-sm-3 col-lg-offset-4 social-icons">
          <a href="https://www.facebook.com/pages/Frat-Roster/440377119345013" target="_blank"><i class="fa fa-facebook fa-2x"></i></a>
          <a href="https://twitter.com/fratroster" target="_blank"><i class="fa fa-twitter fa-2x"></i></a>
          <a href=""><i class="fa fa-linkedin fa-2x"></i></a>
          <a href="https://plus.google.com/u/0/116114533996664312591/about?cfem=1" target="_blank"><i class="fa fa-google-plus fa-2x"></i></a>
          <a href="https://pinterest.com/fratroster/" target="_blank"><i class="fa fa-pinterest fa-2x"></i></a>
          <p id="copyright">fratroster &copy; 2013</p>
        </div>
      </div>
    </footer>
	</div> <!-- /container -->
	<!--Jquery-->
  	<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
  	<!--BS3 JS-->
  	<script type="text/javascript" src="${resource(dir: 'js/bootstrap3', file: 'bootstrap.min.js')}"></script>
</body>
</html>